//Timer class with the following fields
// projectId
// taskID
// totalDuration in seconds
// remainingDuration in seconds
// status
// favorite
// with a copywith method to generate a copy of the timer
// and with a factory method to create a timer
import 'dart:async';
import 'dart:math';

import 'package:apexive/blocs/timer/ticker.dart';
import 'package:apexive/blocs/timer/timer_bloc.dart';
import 'package:apexive/data/models/form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum TimerStatus { running, paused, complete }

enum TimerType {
  local,
  odoo,
}

class TimerModel extends Cubit<TimerState> {
  final int id;
  final int projectId;
  final int taskID;
  final int totalDuration;
  final TimerType timerType;
  final DateTime startTime;
  final String description;
  bool favorite;
  int remainingDuration;
  TimerStatus status;
  StreamSubscription<int>? _tickerSubscription;
  final TimerTicker _ticker = const TimerTicker();

  TimerModel({
    required this.projectId,
    required this.id,
    required this.taskID,
    required this.totalDuration,
    required this.remainingDuration,
    required this.status,
    required this.timerType,
    required this.startTime,
    required this.favorite,
    this.description = '',
  }) : super(TimerInitial(tDuration: totalDuration)) {
    if (status == TimerStatus.running) startTimer();
  }

  TimerModel copyWith({
    int? projectId,
    int? taskID,
    int? totalDuration,
    int? remainingDuration,
    TimerStatus? status,
    bool? favorite,
    TimerType? timerType,
  }) {
    return TimerModel(
      id: id,
      projectId: projectId ?? this.projectId,
      taskID: taskID ?? this.taskID,
      totalDuration: totalDuration ?? this.totalDuration,
      remainingDuration: remainingDuration ?? this.remainingDuration,
      status: status ?? this.status,
      timerType: timerType ?? this.timerType,
      favorite: favorite ?? this.favorite,
      startTime: startTime,
      description: description,
    );
  }

  factory TimerModel.fromJson(Map<String, dynamic> json) {
    return TimerModel(
      id: json['id'] ?? 0,
      projectId: json['project_id'] ?? 0,
      taskID: json['task_id'] ?? 0,
      totalDuration: json['total_duration'] ?? 0,
      remainingDuration: json['remaining_duration'] ?? 0,
      status: TimerStatus.values[json['status'] ?? 0],
      timerType: TimerType.values[json['timer_type'] ?? 0],
      startTime: DateTime.tryParse(json['start_time']) ?? DateTime.now(),
      favorite: json['favorite'] ?? false,
      description: json['description'] ?? '',
    );
  }
  //Factory Timer model from time form
  // accepts a TimeForm
  factory TimerModel.fromTimerForm(TimerForm form,
      {TimerType type = TimerType.local}) {
    int min = 30;
    int max = 3600 * 24;
    final tDuration = Random().nextInt((max + 1) - min);
    return TimerModel(
      //random id
      id: DateTime.now().millisecondsSinceEpoch,
      projectId: form.projectId.value!.id,
      taskID: form.taskId.value!.id,
      totalDuration: tDuration,
      remainingDuration: tDuration,
      status: TimerStatus.running,
      timerType: type,
      startTime: DateTime.now(),
      favorite: form.favorite.value ?? false,
      description: form.description.value ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'project_id': projectId,
      'task_id': taskID,
      'timer_type': timerType.index,
      'total_duration': totalDuration,
      'remaining_duration': remainingDuration,
      'status': status.index,
      'favorite': favorite,
    };
  }

  void toggleTimer() {
    if (state is TimerRunInProgress) {
      pauseTimer();
    } else {
      resumeTimer(
        const TimerResumed(),
      );
    }
  }

  void stopTimer() {
    _tickerSubscription?.cancel();
    status = TimerStatus.complete;
    emit(const TimerRunComplete());
  }

  void startTimer() {
    emit(TimerRunInProgress(tDuration: state.tDuration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: state.tDuration)
        .listen((duration) => _onTicked(duration));
  }

  void pauseTimer() {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(tDuration: state.tDuration));
    }
  }

  void resumeTimer(TimerResumed resume) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(tDuration: state.tDuration));
    }
  }

  void _onTicked(int duration) {
    remainingDuration = duration;
    if (duration > 0) {
      emit(TimerRunInProgress(tDuration: duration));
    } else {
      status = TimerStatus.complete;
      emit(const TimerRunComplete());
    }
  }
}
