// Class for containing tasks, with the following parameters
// name: name of the task
// description: description of the task
// deadline of the task: date of the task
// assigned to: person assigned to the task
// with copyWith method &
// with factory method

import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int id;
  final String name;
  final int projectId;
  final String description;
  final DateTime deadline;
  final String assignedTo;

  const Task({
    required this.id,
    required this.name,
    required this.description,
    required this.deadline,
    required this.assignedTo,
    required this.projectId,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      projectId: json['project_id'] ?? 0,
      deadline:
          DateTime.tryParse(json['deadline']) ?? DateTime(2024, 1, 1, 0, 0, 0),
      assignedTo: json['assignedTo'] ?? 'Ivan Zhuikov',
    );
  }

  Task copyWith({
    String? name,
    String? description,
    DateTime? deadline,
    String? assignedTo,
  }) {
    return Task(
      id: id,
      name: name ?? this.name,
      projectId: projectId,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      assignedTo: assignedTo ?? this.assignedTo,
    );
  }

  @override
  List<Object?> get props =>
      [name, description, deadline, assignedTo, projectId, id];
}
