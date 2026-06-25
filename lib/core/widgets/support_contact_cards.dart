import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/support_contacts.dart';
import '../utils/contact_launcher.dart';
import 'glass_card.dart';

class SupportContactCards extends StatelessWidget {
  const SupportContactCards({
    super.key,
    this.compact = false,
    this.whatsappMessage,
  });

  final bool compact;
  final String? whatsappMessage;

  Future<void> _call(BuildContext context) async {
    final bool ok = await ContactLauncher.callSupport();
    if (!ok && context.mounted) ContactLauncher.showLaunchError(context);
  }

  Future<void> _whatsapp(BuildContext context) async {
    final bool ok = await ContactLauncher.openWhatsApp(message: whatsappMessage);
    if (!ok && context.mounted) ContactLauncher.showLaunchError(context);
  }

  Future<void> _email(BuildContext context) async {
    final bool ok = await ContactLauncher.emailSupport();
    if (!ok && context.mounted) ContactLauncher.showLaunchError(context);
  }

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return Row(
        children: [
          Expanded(
            child: _WhatsAppCard(onTap: () => _whatsapp(context), compact: true),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _ContactTile(
              icon: Icons.call_rounded,
              title: 'Call',
              subtitle: SupportContacts.supportPhoneDisplay,
              color: AppColors.success,
              onTap: () => _call(context),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _ContactTile(
              icon: Icons.email_rounded,
              title: 'Email',
              subtitle: 'Support',
              color: AppColors.accent,
              onTap: () => _email(context),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        _WhatsAppCard(onTap: () => _whatsapp(context)),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: _ContactTile(
                icon: Icons.call_rounded,
                title: 'Call Us',
                subtitle: SupportContacts.supportPhoneDisplay,
                color: AppColors.success,
                onTap: () => _call(context),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _ContactTile(
                icon: Icons.email_rounded,
                title: 'Email Us',
                subtitle: SupportContacts.supportEmail,
                color: AppColors.accent,
                onTap: () => _email(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _WhatsAppCard extends StatelessWidget {
  const _WhatsAppCard({required this.onTap, this.compact = false});

  final VoidCallback onTap;
  final bool compact;

  static const Color whatsAppGreen = Color(0xFF25D366);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(compact ? 16 : 20),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: whatsAppGreen.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(compact ? 16 : 20),
            border: Border.all(color: whatsAppGreen.withValues(alpha: 0.45)),
          ),
          child: Padding(
            padding: EdgeInsets.all(compact ? 14 : 18),
            child: Row(
              children: [
                Container(
                  width: compact ? 42 : 52,
                  height: compact ? 42 : 52,
                  decoration: BoxDecoration(
                    color: whatsAppGreen,
                    borderRadius: BorderRadius.circular(compact ? 12 : 14),
                    boxShadow: [
                      BoxShadow(
                        color: whatsAppGreen.withValues(alpha: 0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Icon(
                    compact ? Icons.chat_rounded : Icons.chat_bubble_rounded,
                    color: Colors.white,
                    size: compact ? 22 : 26,
                  ),
                ),
                SizedBox(width: compact ? 10 : 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        compact ? 'WhatsApp' : 'Chat on WhatsApp',
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: compact ? 14 : 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        compact
                            ? 'Verify docs'
                            : 'Fastest way to verify your documents',
                        style: const TextStyle(
                          color: AppColors.subText,
                          fontSize: 12,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (!compact)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: whatsAppGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'OPEN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      blur: false,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 12),
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
            style: const TextStyle(color: AppColors.muted, fontSize: 11.5),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
