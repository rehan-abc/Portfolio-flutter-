import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../utils/responsive.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onNavItemTap;
  final VoidCallback onThemeToggle;
  final bool isDarkMode;
  final VoidCallback? onOpenDrawer;

  const Navbar({
    super.key,
    required this.onNavItemTap,
    required this.onThemeToggle,
    required this.isDarkMode,
    this.onOpenDrawer,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
      ),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor.withOpacity(0.9),
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor.withOpacity(0.08),
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: SizedBox(
          width: Responsive.contentWidth(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo / Brand
              InkWell(
                onTap: () => onNavItemTap(0),
                borderRadius: BorderRadius.circular(8),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.primary,
                            const Color(0xFF06B6D4),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.code_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "<${AppConstants.developerName} />",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
              ),

              // Navigation Links (Desktop/Tablet) or Menu icon (Mobile)
              if (!isMobile)
                Row(
                  children: [
                    for (int i = 0; i < AppConstants.navItems.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextButton(
                          onPressed: () => onNavItemTap(i),
                          style: TextButton.styleFrom(
                            foregroundColor: theme.textTheme.bodyMedium?.color,
                          ),
                          child: Text(
                            AppConstants.navItems[i],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 12),
                    // Theme Switcher Button
                    IconButton(
                      tooltip: isDarkMode ? "Switch to Light Mode" : "Switch to Dark Mode",
                      icon: Icon(
                        isDarkMode
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        color: isDarkMode ? Colors.amber : theme.colorScheme.primary,
                      ),
                      onPressed: onThemeToggle,
                    ),
                  ],
                )
              else
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isDarkMode
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        color: isDarkMode ? Colors.amber : theme.colorScheme.primary,
                      ),
                      onPressed: onThemeToggle,
                    ),
                    if (onOpenDrawer != null)
                      IconButton(
                        icon: const Icon(Icons.menu_rounded),
                        onPressed: onOpenDrawer,
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
