import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/support_contacts.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/support_contact_cards.dart';

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
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        leading: const BackButton(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(26),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.35),
                      blurRadius: 26,
                      offset: const Offset(0, 14),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              const SizedBox(height: 24),
              const SectionHeader(title: 'Contact Us'),
              const SizedBox(height: 14),
              const SupportContactCards(
                whatsappMessage: SupportContacts.generalSupportMessage,
              ),
              const SizedBox(height: 26),
              const SectionHeader(title: 'Frequently Asked'),
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
      ),
    );
  }

  Widget _buildFaqTile(Map<String, String> faq) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlassCard(
        padding: EdgeInsets.zero,
        blur: false,
        child: Theme(
          data: ThemeData(
            dividerColor: Colors.transparent,
            colorScheme: const ColorScheme.dark(primary: AppColors.primary),
          ),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            iconColor: AppColors.primary,
            collapsedIconColor: AppColors.muted,
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
      ),
    );
  }
}
