import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _buildSectionTitle('Notifications'),
            const SizedBox(height: 12),
            _buildSwitchCard(
              icon: Icons.notifications_active_rounded,
              title: 'Push Notifications',
              subtitle: 'Receive app notifications',
              value: _pushNotifications,
              onChanged: (v) => setState(() => _pushNotifications = v),
            ),
            const SizedBox(height: 12),
            _buildSwitchCard(
              icon: Icons.directions_car_rounded,
              title: 'Ride Alerts',
              subtitle: 'New ride request sounds',
              value: _rideAlerts,
              iconColor: Colors.blueAccent,
              onChanged: (v) => setState(() => _rideAlerts = v),
            ),
            const SizedBox(height: 12),
            _buildSwitchCard(
              icon: Icons.volume_up_rounded,
              title: 'Sound Effects',
              subtitle: 'In-app sounds and feedback',
              value: _soundEffects,
              iconColor: Colors.orangeAccent,
              onChanged: (v) => setState(() => _soundEffects = v),
            ),
            const SizedBox(height: 28),
            _buildSectionTitle('Privacy'),
            const SizedBox(height: 12),
            _buildSwitchCard(
              icon: Icons.my_location_rounded,
              title: 'Location Sharing',
              subtitle: 'Share live location while online',
              value: _locationSharing,
              onChanged: (v) => setState(() => _locationSharing = v),
            ),
            const SizedBox(height: 28),
            _buildSectionTitle('Appearance'),
            const SizedBox(height: 12),
            _buildSwitchCard(
              icon: Icons.dark_mode_rounded,
              title: 'Dark Mode',
              subtitle: 'Use dark theme',
              value: _darkMode,
              iconColor: Colors.purpleAccent,
              onChanged: (v) => setState(() => _darkMode = v),
            ),
            const SizedBox(height: 28),
            _buildSectionTitle('General'),
            const SizedBox(height: 12),
            _buildNavCard(
              icon: Icons.language_rounded,
              title: 'Language',
              trailing: 'English',
            ),
            const SizedBox(height: 12),
            _buildNavCard(
              icon: Icons.privacy_tip_rounded,
              title: 'Privacy Policy',
            ),
            const SizedBox(height: 12),
            _buildNavCard(
              icon: Icons.description_rounded,
              title: 'Terms & Conditions',
            ),
            const SizedBox(height: 12),
            _buildNavCard(
              icon: Icons.info_outline_rounded,
              title: 'App Version',
              trailing: 'v1.0.0',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.subText,
        fontSize: 13,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildSwitchCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    Color? iconColor,
  }) {
    final Color accent = iconColor ?? AppColors.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: accent, size: 20),
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
                    color: AppColors.subText,
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

  Widget _buildNavCard({
    required IconData icon,
    required String title,
    String? trailing,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColors.primary, size: 22),
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
                    color: AppColors.subText,
                    fontSize: 13,
                  ),
                ),
              const SizedBox(width: 6),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.subText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
