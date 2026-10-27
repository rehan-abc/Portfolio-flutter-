import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('Portfolio app boots up and displays brand logo and title',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    // Build our app and trigger a frame.
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    // Verify brand title is present
    expect(find.text("<${AppConstants.developerName} />"), findsWidgets);

    // Verify developer title is displayed
    expect(find.text(AppConstants.developerTitle), findsOneWidget);

    // Verify CTA buttons exist
    expect(find.text("View Projects"), findsOneWidget);
    expect(find.text("Contact Me"), findsOneWidget);
  });

  testWidgets('Theme toggle switches mode', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    // Find the theme switcher button icon (initially dark mode, showing light_mode icon)
    final Finder themeToggleFinder = find.byIcon(Icons.light_mode_rounded);
    expect(themeToggleFinder, findsWidgets);

    // Tap the theme toggle
    await tester.tap(themeToggleFinder.first);
    await tester.pumpAndSettle();

    // After toggle, dark mode icon should be present
    expect(find.byIcon(Icons.dark_mode_rounded), findsWidgets);
  });
}
