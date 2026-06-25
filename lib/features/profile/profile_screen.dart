import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/glass_card.dart';
import '../auth/login_screen.dart';
import '../wallet/wallet_screen.dart';
import 'documents_screen.dart';
import 'help_support_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _logout(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  void _open(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(),
              const SizedBox(height: 20),
              _buildStatsRow(),
              const SizedBox(height: 16),
              _buildVehicleCard(),
              const SizedBox(height: 16),
              _buildMenu(context),
              const SizedBox(height: 24),
              CustomButton(
                label: 'Logout',
                icon: Icons.logout_rounded,
                outlined: true,
                color: AppColors.danger,
                onPressed: () => _logout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return GlassCard(
      padding: const EdgeInsets.all(22),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
            ),
            child: const CircleAvatar(
              radius: 46,
              backgroundColor: AppColors.surface,
              child: Icon(
                Icons.person_rounded,
                color: AppColors.primary,
                size: 54,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Rahul Sharma',
            style: TextStyle(
              color: AppColors.text,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '+91 9876543210',
            style: TextStyle(color: AppColors.subText, fontSize: 14),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: AppColors.goldGradient,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: AppColors.warning.withValues(alpha: 0.4),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.workspace_premium_rounded,
                    color: Colors.white, size: 18),
                SizedBox(width: 6),
                Text(
                  'Gold Captain',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(
          child: _miniStat(
            icon: Icons.star_rounded,
            value: '4.9',
            label: 'Rating',
            color: AppColors.warning,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _miniStat(
            icon: Icons.check_circle_rounded,
            value: '1.2k',
            label: 'Trips',
            color: AppColors.success,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _miniStat(
            icon: Icons.verified_rounded,
            value: '2 yr',
            label: 'Member',
            color: AppColors.accent,
          ),
        ),
      ],
    );
  }

  Widget _miniStat({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      blur: false,
      child: Column(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(color: AppColors.muted, fontSize: 11.5),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleCard() {
    return GlassCard(
      blur: false,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: AppColors.blueGradient,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.directions_car_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vehicle Number',
                  style: TextStyle(color: AppColors.muted, fontSize: 12.5),
                ),
                SizedBox(height: 3),
                Text(
                  'DL01AB1234',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Sedan',
              style: TextStyle(
                color: AppColors.success,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(vertical: 6),
      blur: false,
      child: Column(
        children: [
          _menuTile(
            icon: Icons.account_balance_wallet_rounded,
            color: AppColors.primary,
            title: 'My Wallet',
            onTap: () => _open(context, const WalletScreen()),
          ),
          _divider(),
          _menuTile(
            icon: Icons.description_rounded,
            color: AppColors.accent,
            title: 'Documents',
            onTap: () => _open(context, const DocumentsScreen()),
          ),
          _divider(),
          _menuTile(
            icon: Icons.help_outline_rounded,
            color: AppColors.warning,
            title: 'Help & Support',
            onTap: () => _open(context, const HelpSupportScreen()),
          ),
          _divider(),
          _menuTile(
            icon: Icons.settings_rounded,
            color: AppColors.subText,
            title: 'Settings',
            onTap: () => _open(context, const SettingsScreen()),
          ),
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

  Widget _menuTile({
    required IconData icon,
    required Color color,
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
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
