import 'package:apexive/data/models/project.dart';
import 'package:apexive/data/models/task.dart';
import 'package:apexive/data/models/timer.dart';
import 'package:equatable/equatable.dart';

abstract class TimersheetEvent {}

class TimersheetEventLoad extends TimersheetEvent {
  final bool refresh;
  TimersheetEventLoad({this.refresh = false});
}

class TimerheetEventAdd extends TimersheetEvent {
  final TimerModel timer;
  TimerheetEventAdd(this.timer);
}

enum TimerSheetStatus { loading, loaded, error }

class TimerSheetState extends Equatable {
  final TimerSheetStatus status;
  final List<TimerModel> timers;
  final List<Project> projects;
  final List<Task> tasks;
  const TimerSheetState({
    this.status = TimerSheetStatus.loading,
    this.timers = const [],
    this.projects = const [],
    this.tasks = const [],
  });

  TimerSheetState copyWith({
    TimerSheetStatus? status,
    List<TimerModel>? timers,
    List<Task>? tasks,
    List<Project>? projects,
  }) {
    return TimerSheetState(
      status: status ?? this.status,
      timers: timers ?? this.timers,
      projects: projects ?? this.projects,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props => [status, timers, projects, tasks];
}

class TimerSheetInitial extends TimerSheetState {
  const TimerSheetInitial() : super();
}
