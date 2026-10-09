import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/experience_model.dart';

class PortfolioData {
  static const List<ProjectModel> projects = [
    ProjectModel(
      title: "AI Chatbot with Simple Tools",
      description:
          "An intelligent conversational assistant capable of executing file and directory system operations dynamically using LLM function calling.",
      technologies: ["Python", "OpenAI API", "System Automation", "CLI"],
      githubUrl: "https://github.com/rehan-abc/Chatbot-with-simple-Tools",
      icon: Icons.smart_toy_rounded,
      isFeatured: true,
    ),
    ProjectModel(
      title: "CLI AI Agent (CRUD on Files)",
      description:
          "A command-line autonomous agent featuring a robust architecture to manage, inspect, and mutate structured file trees autonomously.",
      technologies: ["Python", "CLI Architecture", "File Management", "AI"],
      githubUrl: "https://github.com/rehan-abc/CLI-AI-Agent",
      icon: Icons.terminal_rounded,
      isFeatured: true,
    ),
    ProjectModel(
      title: "Flutter Portfolio Web & Mobile",
      description:
          "A sleek, responsive, and animated personal portfolio app built using Flutter with dark/light mode, custom design systems, and responsive layout.",
      technologies: ["Flutter", "Dart", "Material 3", "Responsive UI"],
      githubUrl: "https://github.com/rehan-abc/Portfolio-flutter-",
      icon: Icons.devices_rounded,
      isFeatured: true,
    ),
    ProjectModel(
      title: "OTP Authentication Service",
      description:
          "Secure OTP verification flow with database session management and seamless user auth integration built with modern web technologies.",
      technologies: ["Node.js", "Supabase", "React", "Authentication"],
      githubUrl: "https://github.com/rehan-abc/otp-auth",
      icon: Icons.security_rounded,
      isFeatured: false,
    ),
  ];

  static const List<SkillModel> skills = [
    // Mobile & Frontend
    SkillModel(
      name: "Flutter",
      proficiency: 0.90,
      icon: Icons.flutter_dash_rounded,
      category: SkillCategory.mobile,
    ),
    SkillModel(
      name: "Dart",
      proficiency: 0.88,
      icon: Icons.code_rounded,
      category: SkillCategory.mobile,
    ),
    SkillModel(
      name: "React & Web",
      proficiency: 0.82,
      icon: Icons.web_rounded,
      category: SkillCategory.frontend,
    ),
    SkillModel(
      name: "Material 3 / UI Design",
      proficiency: 0.85,
      icon: Icons.palette_rounded,
      category: SkillCategory.frontend,
    ),

    // Backend & Languages
    SkillModel(
      name: "Python",
      proficiency: 0.85,
      icon: Icons.pest_control_rounded,
      category: SkillCategory.backend,
    ),
    SkillModel(
      name: "Node.js",
      proficiency: 0.80,
      icon: Icons.dns_rounded,
      category: SkillCategory.backend,
    ),
    SkillModel(
      name: "Supabase / SQL",
      proficiency: 0.78,
      icon: Icons.storage_rounded,
      category: SkillCategory.backend,
    ),

    // DevOps & Tools
    SkillModel(
      name: "Git & GitHub",
      proficiency: 0.92,
      icon: Icons.commit_rounded,
      category: SkillCategory.devopsAndTools,
    ),
    SkillModel(
      name: "REST APIs & JSON",
      proficiency: 0.88,
      icon: Icons.api_rounded,
      category: SkillCategory.devopsAndTools,
    ),
    SkillModel(
      name: "VS Code & Antigravity",
      proficiency: 0.90,
      icon: Icons.integration_instructions_rounded,
      category: SkillCategory.devopsAndTools,
    ),
  ];

  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      role: "Full Stack & Flutter Developer",
      company: "Independent Projects & Freelance",
      period: "2024 - Present",
      description:
          "Designing and deploying end-to-end full stack web, mobile, and AI agent solutions.",
      highlights: [
        "Architected responsive cross-platform Flutter user interfaces",
        "Implemented autonomous AI tools integrating LLM APIs and system utilities",
        "Integrated authentication pipelines and database workflows with Supabase",
      ],
    ),
    ExperienceModel(
      role: "Software Engineering Student",
      company: "Computer Science & Engineering",
      period: "2021 - 2025",
      description:
          "Focused on core algorithms, object-oriented design patterns, distributed systems, and software engineering.",
      highlights: [
        "Led multiple team software development hackathons and project milestones",
        "Deep foundational knowledge in Data Structures, OS, and Software Architecture",
      ],
    ),
  ];
}
