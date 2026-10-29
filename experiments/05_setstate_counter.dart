import 'package:flutter/material.dart';

// Experiment 5A: Stateful & Stateless Widgets + setState()
// Demonstrates mutable widget state, setState() lifecycle, and state resets
// using a portfolio project endorsement / appreciation counter.

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProjectEndorsementScreen(),
    ));

class ProjectEndorsementScreen extends StatefulWidget {
  const ProjectEndorsementScreen({super.key});

  @override
  State<ProjectEndorsementScreen> createState() =>
      _ProjectEndorsementScreenState();
}

class _ProjectEndorsementScreenState extends State<ProjectEndorsementScreen> {
  int likesCount = 0;
  bool isBookmarked = false;

  void _incrementLikes() {
    setState(() {
      likesCount++;
    });
  }

  void _decrementLikes() {
    setState(() {
      if (likesCount > 0) likesCount--;
    });
  }

  void _resetLikes() {
    setState(() {
      likesCount = 0;
    });
  }

  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 5A - setState() Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Card(
            margin: const EdgeInsets.all(20),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.rocket_launch_rounded, size: 48, color: Color(0xFF6366F1)),
                  const SizedBox(height: 12),
                  const Text(
                    'Portfolio Project Likes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Demonstrating reactive widget rebuilds via setState()',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 24),

                  // Display state
                  Text(
                    '$likesCount',
                    style: const TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6366F1),
                    ),
                  ),
                  const Text('Total Endorsements'),
                  const SizedBox(height: 24),

                  // Interactive state triggers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _incrementLikes,
                        icon: const Icon(Icons.thumb_up_alt_rounded, size: 18),
                        label: const Text('+1 Like'),
                      ),
                      OutlinedButton.icon(
                        onPressed: _decrementLikes,
                        icon: const Icon(Icons.thumb_down_alt_rounded, size: 18),
                        label: const Text('-1 Like'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        onPressed: _resetLikes,
                        icon: const Icon(Icons.refresh_rounded, size: 18),
                        label: const Text('Reset'),
                      ),
                      IconButton(
                        tooltip: isBookmarked ? 'Bookmarked' : 'Add bookmark',
                        icon: Icon(
                          isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                          color: isBookmarked ? Colors.amber : Colors.grey,
                        ),
                        onPressed: _toggleBookmark,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
