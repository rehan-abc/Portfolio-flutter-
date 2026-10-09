import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../utils/responsive.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isSubmitting = true);

      // Simulate sending message
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (!mounted) return;
        setState(() => _isSubmitting = false);
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: const [
                Icon(Icons.check_circle_rounded, color: Colors.white),
                SizedBox(width: 10),
                Text("Thank you! Your message has been sent successfully."),
              ],
            ),
            backgroundColor: Colors.green.shade700,
            behavior: SnackBarBehavior.floating,
          ),
        );
      });
    }
  }

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
            children: [
              _buildSectionTitle(
                context,
                "Get In Touch",
                "Have a question, proposal, or want to collaborate? Send me a message!",
              ),
              const SizedBox(height: 40),

              isMobile
                  ? Column(
                      children: [
                        _buildContactInfo(context),
                        const SizedBox(height: 32),
                        _buildContactForm(context),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: _buildContactInfo(context),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          flex: 6,
                          child: _buildContactForm(context),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's Connect",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Feel free to reach out for freelance projects, open source collaborations, or just a tech chat.",
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 28),

        _InfoTile(
          icon: Icons.email_outlined,
          title: "Email",
          value: AppConstants.developerEmail,
        ),
        const SizedBox(height: 16),
        _InfoTile(
          icon: Icons.location_on_outlined,
          title: "Location",
          value: AppConstants.developerLocation,
        ),
        const SizedBox(height: 16),
        _InfoTile(
          icon: Icons.code_rounded,
          title: "GitHub",
          value: AppConstants.githubUrl,
        ),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.dividerColor.withOpacity(0.06),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Your Name",
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
            ),
            const SizedBox(height: 18),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Your Email",
                prefixIcon: Icon(Icons.email_outlined),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return "Please enter your email";
                }
                if (!val.contains("@") || !val.contains(".")) {
                  return "Please enter a valid email address";
                }
                return null;
              },
            ),
            const SizedBox(height: 18),
            TextFormField(
              controller: _messageController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Your Message",
                alignLabelWithHint: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Icon(Icons.chat_bubble_outline_rounded),
                ),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return "Please enter your message";
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isSubmitting ? null : _handleSubmit,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: _isSubmitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.send_rounded, size: 18),
                        SizedBox(width: 8),
                        Text(
                          "Send Message",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
            ),
          ],
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

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: theme.colorScheme.primary, size: 22),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
