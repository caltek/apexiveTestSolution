//Repository class for the Timer model
// with helper method to create, edit and get timers

import 'package:apexive/data/models/timer.dart';

class TimerRepo {
  //create timer accepts a timer json object returns a timer
  TimerModel createTimer(Map<String, dynamic> json) {
    return TimerModel.fromJson(json);
  }

  //give a timer object and a map object return a copy of timer
  TimerModel editTimer(TimerModel timer, Map<String, dynamic> json) {
    return timer.copyWith(
      projectId: json['project_id'],
      taskID: json['task_id'],
      totalDuration: json['total_duration'],
      remainingDuration: json['remaining_duration'],
      status: TimerStatus.values[json['status']],
      favorite: json['favorite'],
    );
  }

  List<TimerModel> getTimers(List<dynamic> json) {
    return json.map((timer) => TimerModel.fromJson(timer)).toList();
  }
}
