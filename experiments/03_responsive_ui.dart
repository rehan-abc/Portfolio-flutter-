import 'package:flutter/material.dart';

// Experiment 3: Responsive UI
// Demonstrates building responsive layouts using MediaQuery and LayoutBuilder
// to adapt between multi-column desktop and single-column mobile views.

void main() {
  runApp(const ResponsivePortfolioApp());
}

class ResponsivePortfolioApp extends StatelessWidget {
  const ResponsivePortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 3 - Responsive UI',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
      ),
      home: const ResponsivePortfolioScreen(),
    );
  }
}

class ResponsivePortfolioScreen extends StatelessWidget {
  const ResponsivePortfolioScreen({super.key});

  static const double mobileBreakpoint = 800;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= mobileBreakpoint;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Experiment 3 (${isDesktop ? "Desktop Mode" : "Mobile Mode"})',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Chip(
              label: Text('${screenWidth.toInt()}px wide'),
              backgroundColor: const Color(0xFF6366F1).withOpacity(0.2),
            ),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: const EdgeInsets.all(20),
            // Switch layout based on width: Row on desktop, ListView on mobile
            child: isDesktop
                ? const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 4, child: _DeveloperSummaryCard()),
                      SizedBox(width: 24),
                      Expanded(flex: 6, child: _ProjectsCardList()),
                    ],
                  )
                : ListView(
                    children: const [
                      _DeveloperSummaryCard(),
                      SizedBox(height: 20),
                      _ProjectsCardList(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _DeveloperSummaryCard extends StatelessWidget {
  const _DeveloperSummaryCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 44,
              backgroundColor: Color(0xFF6366F1),
              child: Icon(Icons.person, size: 48, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text('Rehan', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Flutter & Full-Stack Developer', style: TextStyle(color: Color(0xFF06B6D4))),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 12),
            Text(
              'Crafting responsive cross-platform apps with clean architectures.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectsCardList extends StatelessWidget {
  const _ProjectsCardList();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Featured Work',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildProjectTile(
              title: 'AI Chatbot with Tools',
              tech: 'Python, Function Calling, CLI',
              icon: Icons.smart_toy_rounded,
            ),
            _buildProjectTile(
              title: 'Flutter Portfolio Web',
              tech: 'Flutter, Material 3, Responsive',
              icon: Icons.web_rounded,
            ),
            _buildProjectTile(
              title: 'OTP Authentication Service',
              tech: 'Node.js, Supabase, Auth',
              icon: Icons.security_rounded,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectTile({
    required String title,
    required String tech,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF6366F1).withOpacity(0.2),
          child: Icon(icon, color: const Color(0xFF6366F1)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(tech),
        trailing: const Icon(Icons.chevron_right, size: 20),
      ),
    );
  }
}
