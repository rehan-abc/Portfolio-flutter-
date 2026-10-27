import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 900;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900 &&
      MediaQuery.of(context).size.width < 1150;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1150;

  static double contentWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 1140;
    if (width > 900) return width * 0.9;
    return width * 0.92;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1150) {
      return desktop;
    } else if (width >= 900 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
