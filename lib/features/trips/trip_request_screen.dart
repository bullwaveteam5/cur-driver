import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: AppColors.greenGradient,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Estimated Fare',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '₹420',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Airport Terminal 2  →  Railway Station',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
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
                      label: 'Distance',
                      value: '12 km',
                      iconColor: Colors.blueAccent,
                    ),
                    SizedBox(height: 16),
                    InfoTile(
                      icon: Icons.timer_outlined,
                      label: 'Estimated Time',
                      value: '22 min',
                      iconColor: Colors.orangeAccent,
                    ),
                    SizedBox(height: 16),
                    InfoTile(
                      icon: Icons.currency_rupee_rounded,
                      label: 'Fare',
                      value: '₹420',
                      iconColor: AppColors.primary,
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
                color: Colors.redAccent,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
