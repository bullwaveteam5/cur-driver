import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/info_tile.dart';
import 'active_trip_screen.dart';

class TripRequestScreen extends StatelessWidget {
  const TripRequestScreen({super.key});

  void _acceptRide(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ActiveTripScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Request'),
        leading: const BackButton(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.35),
                        blurRadius: 26,
                        offset: const Offset(0, 14),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'NEW REQUEST',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Estimated Fare',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        '₹420',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Airport Terminal 2  →  Railway Station',
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                GlassCard(
                  child: Column(
                    children: const [
                      InfoTile(
                        icon: Icons.my_location_rounded,
                        label: 'Pickup',
                        value: 'Airport Terminal 2',
                      ),
                      SizedBox(height: 16),
                      InfoTile(
                        icon: Icons.location_on_rounded,
                        label: 'Drop',
                        value: 'Railway Station',
                        iconColor: AppColors.danger,
                      ),
                      SizedBox(height: 16),
                      InfoTile(
                        icon: Icons.route_rounded,
                        label: 'Distance',
                        value: '12 km',
                        iconColor: AppColors.accent,
                      ),
                      SizedBox(height: 16),
                      InfoTile(
                        icon: Icons.timer_outlined,
                        label: 'Estimated Time',
                        value: '22 min',
                        iconColor: AppColors.warning,
                      ),
                      SizedBox(height: 16),
                      InfoTile(
                        icon: Icons.currency_rupee_rounded,
                        label: 'Fare',
                        value: '₹420',
                        iconColor: AppColors.success,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  label: 'Accept Ride',
                  icon: Icons.check_circle_rounded,
                  onPressed: () => _acceptRide(context),
                ),
                const SizedBox(height: 12),
                CustomButton(
                  label: 'Decline',
                  icon: Icons.close_rounded,
                  outlined: true,
                  color: AppColors.danger,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
