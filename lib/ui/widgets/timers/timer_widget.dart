import 'package:apexive/data/models/project.dart';
import 'package:apexive/data/models/task.dart';
import 'package:apexive/data/models/timer.dart';
import 'package:apexive/ui/screens/edit_task.dart/edit_task.dart';
import 'package:apexive/ui/widgets/timers/count_down.dart';
import 'package:apexive/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerWidget extends StatelessWidget {
  final TimerModel timerModel;
  final Project project;
  final Task task;
  const TimerWidget(
      {super.key,
      required this.timerModel,
      required this.project,
      required this.task});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: timerModel,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 2,
                child: buildSummary(context, project, task, timerModel)),
            CountDown(
              timerModel: timerModel,
            )
          ],
        ),
      ),
    );
  }

  Widget buildProjectBanner(BuildContext context, Project project) {
    return Container(
      width: 2,
      constraints: const BoxConstraints(
        minHeight: 80,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: project.color,
      ),
    );
  }

  Widget buildSummary(
      BuildContext context, Project project, Task task, TimerModel timerModel) {
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
      decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: project.color,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(1))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Navigator.of(context).push(EditTask.route(task: task)),
            child: buildSummaryTile(
              context,
              timerModel.favorite
                  ? CupertinoIcons.star_fill
                  : CupertinoIcons.star,
              task.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.15,
                  height: 24 / 16),
            ),
          ),
          buildSummaryTile(context, CupertinoIcons.briefcase, project.name),
          buildSummaryTile(context, CupertinoIcons.time,
              "Deadline ${Utils.format(task.deadline)}"),
        ],
      ),
    );
  }

  Widget buildSummaryTile(BuildContext context, IconData icon, String title,
      {TextStyle? style}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 14,
        ),
        const SizedBox(
          width: 4,
        ),
        Flexible(
          child: Text(
            title,
            style: style ??
                Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(letterSpacing: 0.25),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
