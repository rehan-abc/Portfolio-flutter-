import 'package:flutter/material.dart';

enum SkillCategory {
  frontend,
  backend,
  mobile,
  devopsAndTools,
}

class SkillModel {
  final String name;
  final double proficiency; // 0.0 to 1.0
  final IconData icon;
  final SkillCategory category;

  const SkillModel({
    required this.name,
    required this.proficiency,
    required this.icon,
    required this.category,
  });
}
