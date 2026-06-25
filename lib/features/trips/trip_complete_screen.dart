import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/info_tile.dart';
import '../home/home_screen.dart';

class TripCompleteScreen extends StatelessWidget {
  const TripCompleteScreen({super.key});

  void _backToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.success.withValues(alpha: 0.32),
                          AppColors.success.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.successGradient,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.success.withValues(alpha: 0.5),
                              blurRadius: 30,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 56,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  'Trip Completed Successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Great job! Your earnings have been added.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.subText, fontSize: 14),
                ),
                const SizedBox(height: 32),
                GlassCard(
                  child: Column(
                    children: const [
                      InfoTile(
                        icon: Icons.currency_rupee_rounded,
                        label: 'Fare',
                        value: '₹420',
                        iconColor: AppColors.success,
                      ),
                      SizedBox(height: 18),
                      InfoTile(
                        icon: Icons.route_rounded,
                        label: 'Distance',
                        value: '12 km',
                        iconColor: AppColors.accent,
                      ),
                      SizedBox(height: 18),
                      InfoTile(
                        icon: Icons.timer_outlined,
                        label: 'Duration',
                        value: '24 min',
                        iconColor: AppColors.warning,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                CustomButton(
                  label: 'Back To Home',
                  icon: Icons.home_rounded,
                  onPressed: () => _backToHome(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
