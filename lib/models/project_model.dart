import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String description;
  final List<String> technologies;
  final String githubUrl;
  final String? liveDemoUrl;
  final IconData icon;
  final bool isFeatured;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    required this.githubUrl,
    this.liveDemoUrl,
    required this.icon,
    this.isFeatured = false,
  });
}
