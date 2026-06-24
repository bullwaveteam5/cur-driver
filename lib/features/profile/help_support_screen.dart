import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  static const List<Map<String, String>> _faqs = [
    {
      'q': 'How do I go online?',
      'a': 'Open the Home tab and toggle the Online switch at the top to start receiving ride requests.',
    },
    {
      'q': 'When will I get paid?',
      'a': 'Your ride earnings are added to your wallet instantly. You can withdraw to your bank anytime.',
    },
    {
      'q': 'How do I withdraw money?',
      'a': 'Go to the Wallet screen and tap the Withdraw button to transfer your balance to your bank.',
    },
    {
      'q': 'How is my rating calculated?',
      'a': 'Your rating is the average of the star ratings given by passengers after each completed trip.',
    },
    {
      'q': 'What if a passenger cancels?',
      'a': 'You may receive a cancellation fee depending on the time and distance already covered.',
    },
  ];

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: AppColors.greenGradient,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.support_agent_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'How can we help you?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Our support team is available 24/7',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Contact Us',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _buildContactCard(
                    icon: Icons.call_rounded,
                    title: 'Call Us',
                    subtitle: '1800-123-456',
                    onTap: () => _showSnack(context, 'Calling support...'),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _buildContactCard(
                    icon: Icons.chat_bubble_rounded,
                    title: 'Live Chat',
                    subtitle: 'Chat now',
                    iconColor: Colors.blueAccent,
                    onTap: () => _showSnack(context, 'Opening live chat...'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            _buildContactCard(
              icon: Icons.email_rounded,
              title: 'Email Support',
              subtitle: 'support@wavego.com',
              iconColor: Colors.orangeAccent,
              fullWidth: true,
              onTap: () => _showSnack(context, 'Opening email app...'),
            ),
            const SizedBox(height: 28),
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 14),
            ..._faqs.map(_buildFaqTile),
            const SizedBox(height: 16),
            CustomButton(
              label: 'Raise a Ticket',
              icon: Icons.confirmation_number_rounded,
              onPressed: () => _showSnack(context, 'Support ticket created'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? iconColor,
    bool fullWidth = false,
  }) {
    final Color accent = iconColor ?? AppColors.primary;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Row(
            mainAxisAlignment:
                fullWidth ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: accent, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.subText,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFaqTile(Map<String, String> faq) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
          colorScheme: const ColorScheme.dark(primary: AppColors.primary),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          iconColor: AppColors.primary,
          collapsedIconColor: AppColors.subText,
          title: Text(
            faq['q'] ?? '',
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                faq['a'] ?? '',
                style: const TextStyle(
                  color: AppColors.subText,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
