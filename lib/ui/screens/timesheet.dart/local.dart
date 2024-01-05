import 'package:apexive/ui/screens/timesheet.dart/sheets.dart';

class LocalTimeSheet extends BaseTimeSheetWidet {
  const LocalTimeSheet({super.key});

  @override
  String get emptyTextAction => throw UnimplementedError();

  @override
  String get emptyTextDescription => "Create a timer to to begin tracking time";

  @override
  String get emptyTextTitle => "You don’t have any local timesheets";
}
