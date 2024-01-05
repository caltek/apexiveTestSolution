// Repository for projects
//with methods for create, edit and get projects

import 'package:apexive/data/models/project.dart';

class ProjectsRepo {
  //create project accepts a project json object returns a project
  Project createProject(Map<String, dynamic> json) {
    return Project.fromJson(json);
  }

  //give a project object and a map object return a copy of project
  Project editProject(Project project, Map<String, dynamic> json) {
    return project.copyWith(
      name: json['name'],
      description: json['description'],
    );
  }

  List<Project> getProjects(List<dynamic> json) {
    return json.map((project) => Project.fromJson(project)).toList();
  }
}
