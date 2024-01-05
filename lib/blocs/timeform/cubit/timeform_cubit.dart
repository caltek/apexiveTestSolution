import 'package:apexive/data/models/form.dart';
import 'package:apexive/data/models/project.dart';
import 'package:apexive/data/models/task.dart';
import 'package:apexive/data/models/timer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timeform_state.dart';

class TimeformCubit extends Cubit<TimeformState> {
  TimeformCubit() : super(TimeformInitial());
  TimerForm form = const TimerForm(
    projectId: CustomFormField<Project>(),
    taskId: CustomFormField<Task>(),
    description: CustomFormField<String>(),
    favorite: CustomFormField(),
  );

  onSave() {
    if (_validateForm()) {
      final timer = TimerModel.fromTimerForm(form);
      emit(TimerFormSaved(timer: timer));
    } else {
      emit(TimeFormValidationFailed());
    }
  }

  bool _validateForm() {
    var valid = true;
    if (form.projectId.value == null) {
      form = form.copyWith(
          projectId: const CustomFormField<Project>(
              isValid: false, error: "Please select a project"));
      valid = false;
    }
    if (form.taskId.value == null) {
      form = form.copyWith(
          taskId: const CustomFormField(
              isValid: false, error: "Please select a task"));
      valid = false;
    }
    return valid;
  }

  onProjectChanged(CustomFormField<Project> value) {
    form = form.copyWith(projectId: value);
  }

  onTaskChanged(CustomFormField<Task> value) {
    form = form.copyWith(taskId: value);
  }

  onDescriptionChanged(CustomFormField<String> value) {
    form = form.copyWith(description: value);
  }

  onFavoriteChanged(CustomFormField<bool> value) {
    form = form.copyWith(favorite: value);
  }
}
