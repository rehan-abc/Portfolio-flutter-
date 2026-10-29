import 'package:flutter/material.dart';

// Experiment 10: Testing and Debugging in Flutter
// Demonstrates how to design testable widget architectures, verify UI outputs
// through automated widget tests, and use Flutter debugging tools.

void main() => runApp(const TestingDebuggingApp());

class TestingDebuggingApp extends StatelessWidget {
  const TestingDebuggingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 10 - Testing & Debugging',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
      ),
      home: const TestingDebuggingScreen(),
    );
  }
}

class TestingDebuggingScreen extends StatelessWidget {
  const TestingDebuggingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 10 - Testing & Debugging'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          _SectionTitle(title: 'A. Automated UI & Widget Testing'),
          SizedBox(height: 12),
          _ToolCard(
            icon: Icons.check_circle_outline_rounded,
            title: 'find.text() & find.byIcon()',
            description:
                'Locates target widgets by label or symbol to ensure UI consistency and branding accuracy.',
          ),
          _ToolCard(
            icon: Icons.touch_app_rounded,
            title: 'tester.tap() & tester.pumpAndSettle()',
            description:
                'Simulates realistic user gestures (taps, scrolls) and waits for all microtasks and animations to complete.',
          ),
          _ToolCard(
            icon: Icons.fact_check_rounded,
            title: 'Form Validation Testing',
            description:
                'Asserts error strings appear when invalid inputs (e.g. invalid emails or empty fields) are submitted.',
          ),
          Divider(height: 36),
          _SectionTitle(title: 'B. Flutter Debugging Tools'),
          SizedBox(height: 12),
          _ToolCard(
            icon: Icons.account_tree_rounded,
            title: 'Flutter Inspector',
            description:
                'Visually explores the render tree, identifies flex overflows, and inspects box constraints in real-time.',
          ),
          _ToolCard(
            icon: Icons.speed_rounded,
            title: 'Flutter DevTools Profiler',
            description:
                'Monitors CPU execution, memory allocations, widget rebuild counts, and frame rendering bottlenecks.',
          ),
          _ToolCard(
            icon: Icons.terminal_rounded,
            title: 'debugPrint() & Breakpoints',
            description:
                'Controls console output without truncation and pauses thread execution for variable inspection.',
          ),
          Divider(height: 36),
          _SectionTitle(title: 'C. Verification Commands'),
          SizedBox(height: 12),
          _CommandTile(
            command: 'flutter analyze',
            description: 'Runs Dart analyzer to detect static type errors, lints, and dead code.',
          ),
          _CommandTile(
            command: 'flutter test',
            description: 'Executes all automated unit, model, and widget test suites.',
          ),
          _CommandTile(
            command: 'flutter run --debug',
            description: 'Launches application with Hot Reload, assertions, and Observatory enabled.',
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class _ToolCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ToolCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF6366F1).withOpacity(0.15),
          child: Icon(icon, color: const Color(0xFF6366F1)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}

class _CommandTile extends StatelessWidget {
  final String command;
  final String description;

  const _CommandTile({
    required this.command,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: const Color(0xFF1E293B),
      child: ListTile(
        leading: const Icon(Icons.code_rounded, color: Color(0xFF06B6D4)),
        title: Text(
          command,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color: Color(0xFF06B6D4),
          ),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
