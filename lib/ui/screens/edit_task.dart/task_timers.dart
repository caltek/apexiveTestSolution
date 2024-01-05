import 'package:apexive/blocs/timer/timer_bloc.dart';
import 'package:apexive/blocs/timesheet/time_sheets.dart';
import 'package:apexive/data/models/task.dart';
import 'package:apexive/data/models/timer.dart';
import 'package:apexive/ui/widgets/banner.dart';
import 'package:apexive/ui/widgets/timers/__timer_description.dart';
import 'package:apexive/ui/widgets/timers/__timer_title.dart';
import 'package:apexive/ui/widgets/timers/count_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskTimers extends StatefulWidget {
  final Task task;
  const TaskTimers({super.key, required this.task});

  @override
  State<TaskTimers> createState() => _TaskTimersState();
}

class _TaskTimersState extends State<TaskTimers>
    with AutomaticKeepAliveClientMixin {
  late List<TimerModel> taskTimers;
  late List<TimerModel> runningTimers;
  late List<TimerModel> inactiveTimers;

  @override
  void initState() {
    taskTimers = context.read<TimesheetBloc>().getTimersByTask(widget.task.id);
    initTimers();
    super.initState();
  }

  initTimers() {
    runningTimers = taskTimers
        .where((element) =>
            element.status == TimerStatus.running ||
            element.status == TimerStatus.paused)
        .toList();
    inactiveTimers = taskTimers
        .where((element) => element.status == TimerStatus.complete)
        .toList();
  }

  onTimerComplete() {
    setState(() {
      initTimers();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        slivers: [
          _IncompleteTimers(
            task: widget.task,
            timers: runningTimers,
            onTimerComplete: onTimerComplete,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          if (inactiveTimers.isNotEmpty)
            SliverToBoxAdapter(
              child: Text(
                "Completed Timers",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          _CompletedTimers(
            timers: inactiveTimers,
            task: widget.task,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _IncompleteTimers extends StatelessWidget {
  final Task task;
  final List<TimerModel> timers;
  final VoidCallback onTimerComplete;
  const _IncompleteTimers(
      {required this.task,
      required this.timers,
      required this.onTimerComplete});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        final TimerModel timer = timers[index];
        return BlocProvider.value(
          value: timer,
          child: BlocListener<TimerModel, TimerState>(
            listenWhen: (previous, current) => current is TimerRunComplete,
            listener: (context, state) {
              onTimerComplete();
            },
            child: ProminentBanner(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimerTitle(context: context, timer: timer),
                  const SizedBox(
                    height: 8,
                  ),
                  CountDown(timerModel: timer, compact: false),
                  const SizedBox(
                    height: 16,
                  ),
                  if (timer.description.isNotEmpty)
                    TimerDescription(context: context, timer: timer)
                ],
              ),
            ),
          ),
        );
      },
      itemCount: timers.length,
    );
  }
}

class _CompletedTimers extends StatelessWidget {
  final Task task;
  final List<TimerModel> timers;
  const _CompletedTimers({required this.task, required this.timers});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        final TimerModel timer = timers[index];
        return BlocProvider.value(
          value: timer,
          child: ProminentBanner(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      children: [
                        const Icon(
                          CupertinoIcons.checkmark_circle_fill,
                          color: Colors.white,
                        ),
                        TimerTitle(context: context, timer: timer)
                      ],
                    ),
                    CountDown(timerModel: timer, compact: true),
                  ],
                ),
                if (timer.description.isNotEmpty)
                  TimerDescription(context: context, timer: timer)
              ],
            ),
          ),
        );
      },
      itemCount: timers.length,
    );
  }
}
