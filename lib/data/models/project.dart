//Create a dart class for storing a project with name, description, and color
// and a copy with method which copies an instance with other aditional data
// and with factory method that a acceps a json document and returns an instance
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Project extends Equatable {
  final int id;
  final String name;
  final String description;
  final Color color;
  final bool isFavorite;
  const Project({
    required this.name,
    required this.id,
    required this.description,
    required this.color,
    this.isFavorite = false,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      color: Color(int.tryParse(json['color'], radix: 16) ?? 0xFF000000),
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Project copyWith({
    String? name,
    String? description,
    Color? color,
    bool? isFavorite,
  }) {
    return Project(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      color: color ?? this.color,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [name, description, color, isFavorite, id];
}
