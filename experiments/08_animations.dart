import 'package:flutter/material.dart';

// Experiment 8: Animations
// Demonstrates Flutter's animation framework using AnimationController,
// CurvedAnimation, FadeTransition, and SlideTransition on portfolio cards.

void main() {
  runApp(const AnimationPortfolioApp());
}

class AnimationPortfolioApp extends StatelessWidget {
  const AnimationPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 8 - Animations',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
      ),
      home: const PortfolioAnimationScreen(),
    );
  }
}

class PortfolioAnimationScreen extends StatefulWidget {
  const PortfolioAnimationScreen({super.key});

  @override
  State<PortfolioAnimationScreen> createState() =>
      _PortfolioAnimationScreenState();
}

class _PortfolioAnimationScreenState extends State<PortfolioAnimationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    // Smooth curve for opacity
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Slide up from bottom offset
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.35),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    // Start animation on mount
    _controller.forward();
  }

  void _replay() {
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 8 - Animations')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Combined Fade & Slide animation on card
              FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Color(0xFF6366F1), Color(0xFF06B6D4)],
                              ),
                            ),
                            child: const Icon(Icons.rocket_launch_rounded, size: 40, color: Colors.white),
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            'Rehan | Portfolio Animations',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Fade + Slide Entrance Effect',
                            style: TextStyle(color: Color(0xFF06B6D4), fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Animations make web & mobile portfolio components engage user attention naturally.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              FilledButton.icon(
                onPressed: _replay,
                icon: const Icon(Icons.replay_rounded),
                label: const Text('Replay Entrance Animation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
