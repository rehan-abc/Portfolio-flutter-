import 'package:flutter/material.dart';

// Experiment 5B: State Management using ChangeNotifier & ListenableBuilder
// Demonstrates decoupling business logic from UI using Flutter's built-in
// ChangeNotifier pattern, managing themes and project metrics without external dependencies.

void main() {
  runApp(const StateManagementDemoApp());
}

// Model managing portfolio state and notifying listeners
class PortfolioStateController extends ChangeNotifier {
  int _projectRating = 5;
  bool _isDarkMode = true;

  int get projectRating => _projectRating;
  bool get isDarkMode => _isDarkMode;

  void rateProject(int rating) {
    if (rating >= 1 && rating <= 5) {
      _projectRating = rating;
      notifyListeners();
    }
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

final portfolioController = PortfolioStateController();

class StateManagementDemoApp extends StatelessWidget {
  const StateManagementDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: portfolioController,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Experiment 5B - State Management',
          themeMode: portfolioController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorSchemeSeed: const Color(0xFF6366F1),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: const Color(0xFF6366F1),
          ),
          home: const PortfolioStateScreen(),
        );
      },
    );
  }
}

class PortfolioStateScreen extends StatelessWidget {
  const PortfolioStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 5B - State Controller'),
        actions: [
          IconButton(
            tooltip: 'Toggle Theme',
            icon: Icon(
              portfolioController.isDarkMode
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
            ),
            onPressed: portfolioController.toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Rate Portfolio Work',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'State managed via ChangeNotifier & ListenableBuilder',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 24),

                    // Reactive Star Rating Row
                    ListenableBuilder(
                      listenable: portfolioController,
                      builder: (context, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            final starIndex = index + 1;
                            final isSelected = starIndex <= portfolioController.projectRating;
                            return IconButton(
                              icon: Icon(
                                isSelected ? Icons.star_rounded : Icons.star_outline_rounded,
                                color: isSelected ? Colors.amber : Colors.grey,
                                size: 36,
                              ),
                              onPressed: () => portfolioController.rateProject(starIndex),
                            );
                          }),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    ListenableBuilder(
                      listenable: portfolioController,
                      builder: (context, _) {
                        return Text(
                          'Current Rating: ${portfolioController.projectRating} / 5 Stars',
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: portfolioController.toggleTheme,
                      icon: const Icon(Icons.palette_rounded, size: 18),
                      label: const Text('Toggle Theme Mode'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
