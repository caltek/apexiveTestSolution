part of 'timeform_cubit.dart';

sealed class TimeformState extends Equatable {
  const TimeformState();

  @override
  List<Object> get props => [];
}

final class TimeformInitial extends TimeformState {}

final class TimeFormValidating extends TimeformState {}

final class TimeFormValidationFailed extends TimeformState {}

final class TimerFormSaved extends TimeformState {
  final TimerModel timer;
  const TimerFormSaved({required this.timer});
}
