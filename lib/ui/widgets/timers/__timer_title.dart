import 'package:apexive/data/models/timer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerTitle extends StatelessWidget {
  const TimerTitle({
    super.key,
    required this.context,
    required this.timer,
  });

  final BuildContext context;
  final TimerModel timer;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 4,
      children: [
        Text(
          DateFormat("EEEE").format(timer.startTime),
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.w400),
        ),
        Text(
          DateFormat("dd.MM.yyyy").format(timer.startTime),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        RichText(
          text: TextSpan(
            text: "Start Time ",
            children: [
              TextSpan(
                  text: DateFormat(DateFormat.HOUR24_MINUTE)
                      .format(timer.startTime)),
            ],
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
