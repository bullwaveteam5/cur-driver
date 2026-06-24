import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.primary,
                    size: 88,
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
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Column(
                  children: const [
                    InfoTile(
                      icon: Icons.currency_rupee_rounded,
                      label: 'Fare',
                      value: '₹420',
                      iconColor: AppColors.primary,
                    ),
                    SizedBox(height: 18),
                    InfoTile(
                      icon: Icons.route_rounded,
                      label: 'Distance',
                      value: '12 km',
                      iconColor: Colors.blueAccent,
                    ),
                    SizedBox(height: 18),
                    InfoTile(
                      icon: Icons.timer_outlined,
                      label: 'Duration',
                      value: '24 min',
                      iconColor: Colors.orangeAccent,
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
    );
  }
}
