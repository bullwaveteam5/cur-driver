import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/glass_card.dart';

class TripsHistoryScreen extends StatelessWidget {
  const TripsHistoryScreen({super.key});

  static const List<String> _pickups = [
    'Airport Terminal 2',
    'City Mall',
    'Tech Park',
    'Green Avenue',
    'Lake View Road',
    'Central Station',
    'Sunrise Apartments',
    'Hospital Road',
    'Market Square',
    'Bus Stand',
  ];

  static const List<String> _drops = [
    'Railway Station',
    'Sector 18',
    'Downtown Plaza',
    'University Gate',
    'Riverside Colony',
    'Airport Terminal 1',
    'Metro Station',
    'Business Hub',
    'Stadium Road',
    'Old Town',
  ];

  static const List<String> _fares = [
    '₹420',
    '₹260',
    '₹540',
    '₹180',
    '₹310',
    '₹620',
    '₹150',
    '₹480',
    '₹230',
    '₹390',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Trips History'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        bottom: false,
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
          itemCount: 10,
          itemBuilder: (context, index) {
            final int rideNumber = index + 1;
            final int day = 24 - index;
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: GlassCard(
                padding: const EdgeInsets.all(16),
                blur: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            gradient: AppColors.blueGradient,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: const Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ride #$rideNumber',
                                style: const TextStyle(
                                  color: AppColors.text,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  _badge(
                                    'June $day',
                                    AppColors.muted,
                                    Icons.calendar_today_rounded,
                                  ),
                                  const SizedBox(width: 6),
                                  _badge(
                                    'Completed',
                                    AppColors.success,
                                    Icons.check_circle_rounded,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.success.withValues(alpha: 0.16),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.success.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            _fares[index],
                            style: const TextStyle(
                              color: AppColors.success,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Divider(),
                    const SizedBox(height: 12),
                    _locationRow(
                      Icons.my_location_rounded,
                      AppColors.primary,
                      _pickups[index],
                    ),
                    const SizedBox(height: 10),
                    _locationRow(
                      Icons.location_on_rounded,
                      AppColors.danger,
                      _drops[index],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _badge(String text, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 11),
          const SizedBox(width: 3),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _locationRow(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: AppColors.text, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
