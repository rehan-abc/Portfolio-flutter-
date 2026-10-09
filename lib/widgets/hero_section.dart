import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../utils/responsive.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const HeroSection({
    super.key,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
      ),
      child: Center(
        child: SizedBox(
          width: Responsive.contentWidth(context),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildAvatar(context),
                    const SizedBox(height: 32),
                    _buildTextContent(context, alignCenter: true),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildTextContent(context, alignCenter: false),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 4,
                      child: Center(child: _buildAvatar(context)),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, {required bool alignCenter}) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment:
          alignCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Status badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: theme.colorScheme.primary.withOpacity(0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Available for Opportunities",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Headline
        Text(
          "Hey there! 👋 I'm",
          textAlign: alignCenter ? TextAlign.center : TextAlign.start,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppConstants.developerName,
          textAlign: alignCenter ? TextAlign.center : TextAlign.start,
          style: theme.textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -1.0,
          ),
        ),
        const SizedBox(height: 12),

        // Subtitle / Title
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF6366F1), Color(0xFF06B6D4)],
          ).createShader(bounds),
          child: Text(
            AppConstants.developerTitle,
            textAlign: alignCenter ? TextAlign.center : TextAlign.start,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 18),

        // Tagline
        Text(
          AppConstants.developerTagline,
          textAlign: alignCenter ? TextAlign.center : TextAlign.start,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.textTheme.bodyMedium?.color?.withOpacity(0.75),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),

        // Call to action buttons
        Wrap(
          spacing: 16,
          runSpacing: 14,
          alignment: alignCenter ? WrapAlignment.center : WrapAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: onProjectsTap,
              icon: const Icon(Icons.rocket_launch_rounded, size: 18),
              label: const Text("View Projects"),
            ),
            OutlinedButton.icon(
              onPressed: onContactTap,
              icon: const Icon(Icons.mail_outline_rounded, size: 18),
              label: const Text("Contact Me"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 260,
      height: 260,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary.withOpacity(0.8),
            const Color(0xFF06B6D4).withOpacity(0.6),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.3),
            blurRadius: 30,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.cardTheme.color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_outline_rounded,
                size: 80,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Flutter Dev",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
