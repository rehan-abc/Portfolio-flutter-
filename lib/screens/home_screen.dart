import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const HomeScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 400 && !_showBackToTop) {
        setState(() => _showBackToTop = true);
      } else if (_scrollController.offset <= 400 && _showBackToTop) {
        setState(() => _showBackToTop = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _scrollToIndex(int index) {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.pop(context);
    }

    switch (index) {
      case 0:
        _scrollToKey(_aboutKey);
        break;
      case 1:
        _scrollToKey(_skillsKey);
        break;
      case 2:
        _scrollToKey(_projectsKey);
        break;
      case 3:
        _scrollToKey(_experienceKey);
        break;
      case 4:
        _scrollToKey(_contactKey);
        break;
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildMobileDrawer(context),
      body: Column(
        children: [
          // Top Navbar
          Navbar(
            onNavItemTap: _scrollToIndex,
            onThemeToggle: widget.onThemeToggle,
            isDarkMode: widget.isDarkMode,
            onOpenDrawer: () => _scaffoldKey.currentState?.openDrawer(),
          ),

          // Scrollable Sections
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(
                    onProjectsTap: () => _scrollToKey(_projectsKey),
                    onContactTap: () => _scrollToKey(_contactKey),
                  ),
                  Container(
                    key: _aboutKey,
                    child: const AboutSection(),
                  ),
                  Container(
                    key: _skillsKey,
                    child: const SkillsSection(),
                  ),
                  Container(
                    key: _projectsKey,
                    child: const ProjectsSection(),
                  ),
                  Container(
                    key: _experienceKey,
                    child: const ExperienceSection(),
                  ),
                  Container(
                    key: _contactKey,
                    child: const ContactSection(),
                  ),
                  Footer(
                    onScrollToTop: _scrollToTop,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _showBackToTop
          ? FloatingActionButton.small(
              onPressed: _scrollToTop,
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
              tooltip: "Scroll to top",
              child: const Icon(Icons.arrow_upward_rounded),
            )
          : null,
    );
  }

  Widget _buildMobileDrawer(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.code_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    AppConstants.developerName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            for (int i = 0; i < AppConstants.navItems.length; i++)
              ListTile(
                title: Text(AppConstants.navItems[i]),
                leading: Icon(_getNavIcon(i), size: 20),
                onTap: () => _scrollToIndex(i),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getNavIcon(int index) {
    switch (index) {
      case 0:
        return Icons.person_outline_rounded;
      case 1:
        return Icons.bolt_rounded;
      case 2:
        return Icons.folder_outlined;
      case 3:
        return Icons.timeline_rounded;
      case 4:
        return Icons.mail_outline_rounded;
      default:
        return Icons.circle_outlined;
    }
  }
}
