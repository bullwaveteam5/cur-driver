import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

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
      appBar: AppBar(
        title: const Text('Trips History'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          itemCount: 10,
          itemBuilder: (context, index) {
            final int rideNumber = index + 1;
            final int day = 24 - index;
            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.check_circle_rounded,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
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
                          Text(
                            'June $day, 2026',
                            style: const TextStyle(
                              color: AppColors.subText,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        _fares[index],
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Divider(),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(
                        Icons.my_location_rounded,
                        color: AppColors.primary,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _pickups[index],
                          style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: Colors.redAccent,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _drops[index],
                          style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
