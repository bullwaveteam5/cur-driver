import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
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
      const SnackBar(
        content: Text('Trip started'),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
      ),
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.background,
                      child: Icon(
                        Icons.person_rounded,
                        color: AppColors.primary,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Passenger',
                          style: TextStyle(
                            color: AppColors.subText,
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
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.call_rounded,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
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
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.5),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Status',
                          style: TextStyle(
                            color: AppColors.subText,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          _tripStarted
                              ? 'Trip In Progress'
                              : 'Passenger Picked Up',
                          style: const TextStyle(
                            color: AppColors.text,
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
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Column(
                  children: const [
                    InfoTile(
                      icon: Icons.directions_car_rounded,
                      label: 'Vehicle',
                      value: 'Sedan',
                      iconColor: Colors.blueAccent,
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
                      iconColor: Colors.redAccent,
                    ),
                    SizedBox(height: 16),
                    InfoTile(
                      icon: Icons.route_rounded,
                      label: 'Distance Remaining',
                      value: '7.4 km',
                      iconColor: Colors.orangeAccent,
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
                onPressed: _completeTrip,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
