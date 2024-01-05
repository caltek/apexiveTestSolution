import 'package:apexive/blocs/timer/timer_bloc.dart';
import 'package:apexive/data/models/timer.dart';
import 'package:apexive/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// generate descriptive for each functions in this class

class CountDown extends StatelessWidget {
  final TimerModel timerModel;
  final bool compact;
  const CountDown({super.key, required this.timerModel, this.compact = true});

  @override
  Widget build(BuildContext context) {
    return compact ? _buildCompact(context) : _buildFull(context);
  }

  // annotate with comments
  //
  Widget _buildCompact(BuildContext context) {
    return BlocBuilder<TimerModel, TimerState>(
      builder: (context, state) {
        final duration = Duration(
            seconds: state is! TimerRunComplete
                ? state.tDuration
                : timerModel.totalDuration);
        final color = state is TimerRunInProgress ? Colors.black : Colors.white;

        return Container(
          padding: const EdgeInsets.all(16).copyWith(top: 6, bottom: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64),
            color: state is TimerRunInProgress
                ? Colors.white
                : Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Utils.formatDuration(duration),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(height: 20 / 14, fontSize: 14, color: color),
              ),
              const SizedBox(
                width: 4,
              ),
              if (state is! TimerRunComplete)
                InkWell(
                  onTap: () {
                    timerModel.toggleTimer();
                  },
                  child: Icon(
                    state is TimerRunInProgress
                        ? CupertinoIcons.pause
                        : CupertinoIcons.play_fill,
                    color: color,
                  ),
                )
            ],
          ),
        );
      },
    );
  }

  Widget _buildFull(BuildContext context) {
    return BlocBuilder<TimerModel, TimerState>(
      builder: (context, state) {
        final duration = Duration(
            seconds: state is! TimerRunComplete
                ? state.tDuration
                : timerModel.totalDuration);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Utils.formatDuration(duration),
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFullIcon(context, CupertinoIcons.stop_fill, onTap: () {
                  timerModel.stopTimer();
                }),
                const SizedBox(
                  width: 16,
                ),
                _buildFullIcon(
                  context,
                  state is TimerRunInProgress
                      ? CupertinoIcons.pause
                      : CupertinoIcons.play_fill,
                  onTap: () {
                    timerModel.toggleTimer();
                  },
                  backgroundColor:
                      state is TimerRunInProgress ? Colors.white : null,
                  color: state is TimerRunInProgress ? Colors.black : null,
                )
              ],
            )
          ],
        );
      },
    );
  }

  Widget _buildFullIcon(BuildContext context, IconData icon,
      {Color? backgroundColor, VoidCallback? onTap, Color? color}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color:
              backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(64),
        ),
        child: Icon(
          icon,
          size: 32,
          color: color,
        ),
      ),
    );
  }
}
