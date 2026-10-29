import 'package:flutter/material.dart';

// Experiment 4: Navigation and Named Routes
// Demonstrates multi-screen routing in Flutter using Navigator.pushNamed(),
// centralized route constants, and passing data between portfolio views.

void main() => runApp(const PortfolioNavApp());

class AppRoutes {
  static const String home = '/';
  static const String projects = '/projects';
  static const String skills = '/skills';
  static const String contact = '/contact';
}

class PortfolioNavApp extends StatelessWidget {
  const PortfolioNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 4 - Navigation & Routes',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.projects: (context) => const ProjectsScreen(),
        AppRoutes.skills: (context) => const SkillsScreen(),
        AppRoutes.contact: (context) => const ContactScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rehan | Portfolio Navigation')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 46,
                backgroundColor: Color(0xFF6366F1),
                child: Icon(Icons.person, size: 48, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text('Rehan', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const Text('Flutter & Full-Stack Developer', style: TextStyle(color: Color(0xFF06B6D4))),
              const SizedBox(height: 32),
              _NavButton(
                icon: Icons.rocket_launch_rounded,
                label: 'View Projects',
                onPressed: () => Navigator.pushNamed(context, AppRoutes.projects),
              ),
              const SizedBox(height: 12),
              _NavButton(
                icon: Icons.code_rounded,
                label: 'Technical Skills',
                onPressed: () => Navigator.pushNamed(context, AppRoutes.skills),
              ),
              const SizedBox(height: 12),
              _NavButton(
                icon: Icons.mail_outline_rounded,
                label: 'Contact & Hire',
                onPressed: () => Navigator.pushNamed(context, AppRoutes.contact),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Projects Catalog')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.smart_toy_rounded, color: Color(0xFF6366F1)),
              title: Text('AI Chatbot with Simple Tools'),
              subtitle: Text('Python, Function Calling, System CLI'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.web_rounded, color: Color(0xFF06B6D4)),
              title: Text('Flutter Portfolio Web'),
              subtitle: Text('Flutter, Material 3, Responsive UI'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.security_rounded, color: Colors.amber),
              title: Text('OTP Authentication Service'),
              subtitle: Text('Node.js, Supabase, React'),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Technical Skills')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(leading: Icon(Icons.flutter_dash), title: Text('Flutter & Dart (90%)')),
          ListTile(leading: Icon(Icons.web), title: Text('React & Modern Web (82%)')),
          ListTile(leading: Icon(Icons.terminal), title: Text('Python & Backend APIs (85%)')),
          ListTile(leading: Icon(Icons.commit), title: Text('Git & GitHub Version Control (92%)')),
        ],
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get In Touch')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.mark_email_read_rounded, size: 64, color: Color(0xFF6366F1)),
              SizedBox(height: 16),
              Text('rehan.dev@example.com', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Bengaluru, India'),
              SizedBox(height: 16),
              Text('GitHub: github.com/rehan-abc', style: TextStyle(color: Color(0xFF06B6D4))),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _NavButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
      ),
    );
  }
}
