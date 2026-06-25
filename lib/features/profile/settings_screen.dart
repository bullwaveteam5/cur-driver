import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/section_header.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _pushNotifications = true;
  bool _rideAlerts = true;
  bool _soundEffects = true;
  bool _locationSharing = true;
  bool _darkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
              const SectionHeader(title: 'Notifications'),
              const SizedBox(height: 12),
              _buildSwitchCard(
                icon: Icons.notifications_active_rounded,
                color: AppColors.primary,
                title: 'Push Notifications',
                subtitle: 'Receive app notifications',
                value: _pushNotifications,
                onChanged: (v) => setState(() => _pushNotifications = v),
              ),
              const SizedBox(height: 12),
              _buildSwitchCard(
                icon: Icons.directions_car_rounded,
                color: AppColors.accent,
                title: 'Ride Alerts',
                subtitle: 'New ride request sounds',
                value: _rideAlerts,
                onChanged: (v) => setState(() => _rideAlerts = v),
              ),
              const SizedBox(height: 12),
              _buildSwitchCard(
                icon: Icons.volume_up_rounded,
                color: AppColors.warning,
                title: 'Sound Effects',
                subtitle: 'In-app sounds and feedback',
                value: _soundEffects,
                onChanged: (v) => setState(() => _soundEffects = v),
              ),
              const SizedBox(height: 26),
              const SectionHeader(title: 'Privacy'),
              const SizedBox(height: 12),
              _buildSwitchCard(
                icon: Icons.my_location_rounded,
                color: AppColors.success,
                title: 'Location Sharing',
                subtitle: 'Share live location while online',
                value: _locationSharing,
                onChanged: (v) => setState(() => _locationSharing = v),
              ),
              const SizedBox(height: 26),
              const SectionHeader(title: 'Appearance'),
              const SizedBox(height: 12),
              _buildSwitchCard(
                icon: Icons.dark_mode_rounded,
                color: AppColors.primarySoft,
                title: 'Dark Mode',
                subtitle: 'Use dark theme',
                value: _darkMode,
                onChanged: (v) => setState(() => _darkMode = v),
              ),
              const SizedBox(height: 26),
              const SectionHeader(title: 'General'),
              const SizedBox(height: 12),
              GlassCard(
                padding: const EdgeInsets.symmetric(vertical: 6),
                blur: false,
                child: Column(
                  children: [
                    _navTile(Icons.language_rounded, 'Language', 'English'),
                    _divider(),
                    _navTile(Icons.privacy_tip_rounded, 'Privacy Policy', null),
                    _divider(),
                    _navTile(
                        Icons.description_rounded, 'Terms & Conditions', null),
                    _divider(),
                    _navTile(Icons.info_outline_rounded, 'App Version',
                        'v1.0.0'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchCard({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      blur: false,
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(),
    );
  }

  Widget _navTile(IconData icon, String title, String? trailing) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: AppColors.subText, size: 22),
              const SizedBox(width: 14),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              if (trailing != null)
                Text(
                  trailing,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 13,
                  ),
                ),
              const SizedBox(width: 6),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.muted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
