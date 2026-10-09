import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../utils/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 60,
      ),
      child: Center(
        child: SizedBox(
          width: Responsive.contentWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSectionTitle(context, "About Me", "Get to know me better"),
              const SizedBox(height: 36),

              // Bio card
              Container(
                padding: EdgeInsets.all(isMobile ? 20 : 32),
                decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: theme.dividerColor.withOpacity(0.06),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      AppConstants.aboutMe,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        height: 1.8,
                        fontSize: isMobile ? 15 : 17,
                        color: theme.textTheme.bodyMedium?.color?.withOpacity(0.85),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Skill pills / core strengths
                    Wrap(
                      spacing: 12,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: const [
                        _StrengthBadge(icon: Icons.architecture_rounded, text: "Clean Architecture"),
                        _StrengthBadge(icon: Icons.devices_rounded, text: "Cross-Platform"),
                        _StrengthBadge(icon: Icons.speed_rounded, text: "High Performance"),
                        _StrengthBadge(icon: Icons.auto_awesome_rounded, text: "Modern UX/UI"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Stats Row / Grid
              Wrap(
                spacing: 24,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _StatCard(
                    number: "${AppConstants.yearsExperience}+",
                    label: "Years Experience",
                    icon: Icons.calendar_month_rounded,
                  ),
                  _StatCard(
                    number: "${AppConstants.projectsCompleted}+",
                    label: "Projects Completed",
                    icon: Icons.folder_special_rounded,
                  ),
                  _StatCard(
                    number: "${AppConstants.satisfiedClients}+",
                    label: "Happy Collaborators",
                    icon: Icons.sentiment_very_satisfied_rounded,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, String subtitle) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          title,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: 50,
          height: 3,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

class _StrengthBadge extends StatelessWidget {
  final IconData icon;
  final String text;

  const _StrengthBadge({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;

  const _StatCard({
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 220,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.dividerColor.withOpacity(0.06),
        ),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: theme.colorScheme.primary),
          const SizedBox(height: 12),
          Text(
            number,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
