import 'package:apexive/data/models/timer.dart';
import 'package:apexive/ui/screens/timesheet.dart/sheets.dart';
import 'package:flutter/cupertino.dart';

class OdooTimerSheet extends BaseTimeSheetWidet {
  const OdooTimerSheet({super.key});

  @override
  String get emptyTextDescription => "Synchronize with odoo to get started";

  @override
  String get emptyTextTitle => "You don’t have any odoo timesheets";

  @override
  TimerType get timerType => TimerType.odoo;

  @override
  Widget get emptyIcon => Image.asset("assets/images/odoo.png", width: 150);
}
