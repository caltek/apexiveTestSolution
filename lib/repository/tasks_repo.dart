//Repository for tasks data
// with helper method to create, edit and get tasks

import 'package:apexive/data/models/task.dart';

class TasksRepo {
  //create task accepts a task json object returns a task
  Task createTask(Map<String, dynamic> json) {
    return Task.fromJson(json);
  }

  //give a task object and a map object return a copy of task
  Task editTask(Task task, Map<String, dynamic> json) {
    return task.copyWith(
      name: json['name'],
      description: json['description'],
      deadline: json['deadline'],
      assignedTo: json['assignedTo'],
    );
  }

  List<Task> getTasks(List<dynamic> json) {
    return json.map((task) => Task.fromJson(task)).toList();
  }
}
