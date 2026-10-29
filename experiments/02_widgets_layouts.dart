import 'package:flutter/material.dart';

// Experiment 2: Flutter Widgets and Layouts
// Demonstrates using Row, Column, and Stack to construct a structured developer profile card.

void main() {
  runApp(const PortfolioLayoutApp());
}

class PortfolioLayoutApp extends StatelessWidget {
  const PortfolioLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 2 - Widgets & Layouts',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
      ),
      home: const PortfolioLayoutScreen(),
    );
  }
}

class PortfolioLayoutScreen extends StatelessWidget {
  const PortfolioLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 2 - Layouts'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        // Column aligns content vertically
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Stack overlaps the circular avatar on top of the banner header
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                // Background decorative cover banner
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF06B6D4)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.code_rounded, size: 64, color: Colors.white70),
                  ),
                ),
                // Overlapping avatar
                const Positioned(
                  bottom: -40,
                  child: CircleAvatar(
                    radius: 46,
                    backgroundColor: Color(0xFF0F172A),
                    child: CircleAvatar(
                      radius: 42,
                      backgroundColor: Color(0xFF6366F1),
                      child: Icon(Icons.person, size: 48, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            // Profile info
            const Text(
              'Rehan',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Flutter & Full-Stack Developer',
              style: TextStyle(fontSize: 16, color: Color(0xFF06B6D4)),
            ),
            const SizedBox(height: 24),

            // Row organizes developer statistics horizontally
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatItem(icon: Icons.folder_special_rounded, value: '20+', label: 'Projects'),
                    _StatItem(icon: Icons.timelapse_rounded, value: '3+ Yrs', label: 'Experience'),
                    _StatItem(icon: Icons.star_rounded, value: '4.9 ★', label: 'Rating'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Tech stack chips in a Wrap layout
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Key Competencies',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(label: Text('Flutter / Dart'), avatar: Icon(Icons.flutter_dash, size: 18)),
                Chip(label: Text('Material 3'), avatar: Icon(Icons.palette, size: 18)),
                Chip(label: Text('Responsive Web'), avatar: Icon(Icons.devices, size: 18)),
                Chip(label: Text('Git & GitHub'), avatar: Icon(Icons.merge_type, size: 18)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFF6366F1), size: 28),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
