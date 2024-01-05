part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  const TimerState({required this.tDuration});
  final int tDuration;

  @override
  List<Object> get props => [tDuration];
}

final class TimerInitial extends TimerState {
  const TimerInitial({required super.tDuration});
}

final class TimerRunPause extends TimerState {
  const TimerRunPause({required super.tDuration});

  @override
  String toString() => 'TimerRunPause { duration: $tDuration }';
}

final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress({required super.tDuration});

  @override
  String toString() => 'TimerRunInProgress { duration: $tDuration }';
}

final class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(tDuration: 0);
}
