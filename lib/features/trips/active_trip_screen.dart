import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/info_tile.dart';
import 'trip_complete_screen.dart';

class ActiveTripScreen extends StatefulWidget {
  const ActiveTripScreen({super.key});

  @override
  State<ActiveTripScreen> createState() => _ActiveTripScreenState();
}

class _ActiveTripScreenState extends State<ActiveTripScreen> {
  bool _tripStarted = false;

  void _startTrip() {
    setState(() => _tripStarted = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Trip started')),
    );
  }

  void _completeTrip() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const TripCompleteScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Trip'),
        automaticallyImplyLeading: false,
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
                GlassCard(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2.5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.primaryGradient,
                        ),
                        child: const CircleAvatar(
                          radius: 26,
                          backgroundColor: AppColors.surface,
                          child: Icon(
                            Icons.person_rounded,
                            color: AppColors.primary,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Passenger',
                              style: TextStyle(
                                color: AppColors.muted,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Amit Verma',
                              style: TextStyle(
                                color: AppColors.text,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _circleAction(Icons.call_rounded, AppColors.success),
                      const SizedBox(width: 10),
                      _circleAction(
                          Icons.chat_bubble_rounded, AppColors.accent),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.bolt_rounded, color: Colors.white),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Status',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            _tripStarted
                                ? 'Trip In Progress'
                                : 'Passenger Picked Up',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                GlassCard(
                  child: Column(
                    children: const [
                      InfoTile(
                        icon: Icons.directions_car_rounded,
                        label: 'Vehicle',
                        value: 'Sedan',
                        iconColor: AppColors.accent,
                      ),
                      SizedBox(height: 16),
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
                        label: 'Distance Remaining',
                        value: '7.4 km',
                        iconColor: AppColors.warning,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  label: 'Start Trip',
                  icon: Icons.play_arrow_rounded,
                  outlined: _tripStarted,
                  onPressed: _tripStarted ? () {} : _startTrip,
                ),
                const SizedBox(height: 12),
                CustomButton(
                  label: 'Complete Trip',
                  icon: Icons.flag_rounded,
                  gradient: AppColors.successGradient,
                  onPressed: _completeTrip,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _circleAction(IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, color: color, size: 20),
      ),
    );
  }
}
