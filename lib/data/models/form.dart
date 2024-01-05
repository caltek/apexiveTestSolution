import 'package:apexive/data/models/project.dart';
import 'package:apexive/data/models/task.dart';
import 'package:equatable/equatable.dart';

class CustomFormField<T> extends Equatable {
  final T? value;
  final bool? isValid;
  final String? error;
  const CustomFormField({
    this.value,
    this.isValid,
    this.error,
  });

  @override
  List<Object?> get props => [value, isValid, error];
}

class TimerForm extends Equatable {
  final CustomFormField<Project> projectId;
  final CustomFormField<Task> taskId;
  final CustomFormField<String> description;
  final CustomFormField<bool> favorite;

  const TimerForm({
    required this.projectId,
    required this.taskId,
    required this.description,
    required this.favorite,
  });

  //generate copy with method
  TimerForm copyWith({
    CustomFormField<Project>? projectId,
    CustomFormField<Task>? taskId,
    CustomFormField<String>? description,
    CustomFormField<bool>? favorite,
  }) {
    return TimerForm(
      projectId: projectId ?? this.projectId,
      taskId: taskId ?? this.taskId,
      description: description ?? this.description,
      favorite: favorite ?? this.favorite,
    );
  }

  @override
  List<Object?> get props => [projectId, taskId, description, favorite];
}
