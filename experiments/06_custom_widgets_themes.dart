import 'package:flutter/material.dart';

// Experiment 6: Custom Widgets and Themes
// Demonstrates building reusable UI components (PortfolioHeader, ProjectCard, CustomButton)
// styled cohesively using Material 3 ThemeData and custom design tokens.

void main() {
  runApp(const CustomWidgetsThemeApp());
}

class CustomWidgetsThemeApp extends StatelessWidget {
  const CustomWidgetsThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 6 - Custom Widgets & Themes',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF1E293B),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF6366F1),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
      home: const CustomWidgetsScreen(),
    );
  }
}

// 1. Custom reusable widget: Developer Profile Banner
class ReusableProfileHeader extends StatelessWidget {
  final String name;
  final String title;

  const ReusableProfileHeader({
    super.key,
    required this.name,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 32,
              backgroundColor: Color(0xFF6366F1),
              child: Icon(Icons.person, color: Colors.white, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(title, style: const TextStyle(color: Color(0xFF06B6D4))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. Custom reusable widget: Project Feature Card
class ReusableProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String tech;
  final IconData icon;

  const ReusableProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.tech,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF6366F1)),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                tech,
                style: const TextStyle(color: Color(0xFF06B6D4), fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomWidgetsScreen extends StatelessWidget {
  const CustomWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 6 - Custom Widgets')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ReusableProfileHeader(
            name: 'Rehan',
            title: 'Flutter & Full-Stack Developer',
          ),
          const SizedBox(height: 12),
          const ReusableProjectCard(
            title: 'AI Chatbot with Tools',
            description: 'Autonomous agent executing file and system tools dynamically.',
            tech: 'Python, Function Calling, System CLI',
            icon: Icons.smart_toy_rounded,
          ),
          const ReusableProjectCard(
            title: 'Flutter Portfolio Web',
            description: 'Responsive, zero-dependency portfolio with Material 3 design system.',
            tech: 'Flutter, Dart, Responsive UI',
            icon: Icons.devices_rounded,
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Custom button action executed!')),
              );
            },
            icon: const Icon(Icons.touch_app_rounded),
            label: const Text('Interact with Custom Button'),
          ),
        ],
      ),
    );
  }
}
