import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/stat_card.dart';
import '../wallet/wallet_screen.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  static const List<Map<String, dynamic>> _weekData = [
    {'day': 'Mon', 'factor': 0.55},
    {'day': 'Tue', 'factor': 0.7},
    {'day': 'Wed', 'factor': 0.45},
    {'day': 'Thu', 'factor': 0.85},
    {'day': 'Fri', 'factor': 1.0},
    {'day': 'Sat', 'factor': 0.9},
    {'day': 'Sun', 'factor': 0.6},
  ];

  void _openWallet(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const WalletScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Earnings'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => _openWallet(context),
            icon: const Icon(Icons.account_balance_wallet_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: AppColors.greenGradient,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Total Balance Earned',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '₹62,400',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Keep driving to earn more rewards',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.5,
                children: const [
                  StatCard(
                    title: 'Today Earnings',
                    value: '₹2,450',
                    icon: Icons.today_rounded,
                  ),
                  StatCard(
                    title: 'Weekly Earnings',
                    value: '₹15,900',
                    icon: Icons.calendar_view_week_rounded,
                    iconColor: Colors.blueAccent,
                  ),
                  StatCard(
                    title: 'Monthly Earnings',
                    value: '₹62,400',
                    icon: Icons.calendar_month_rounded,
                    iconColor: Colors.orangeAccent,
                  ),
                  StatCard(
                    title: 'Avg / Trip',
                    value: '₹136',
                    icon: Icons.trending_up_rounded,
                    iconColor: Colors.purpleAccent,
                  ),
                ],
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'This Week',
                      style: TextStyle(
                        color: AppColors.text,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 160,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: _weekData.map((data) {
                          final double factor = data['factor'] as double;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 22,
                                height: 120 * factor,
                                decoration: BoxDecoration(
                                  color: AppColors.primary
                                      .withValues(alpha: 0.4 + factor * 0.6),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                data['day'] as String,
                                style: const TextStyle(
                                  color: AppColors.subText,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                label: 'View Wallet',
                icon: Icons.account_balance_wallet_rounded,
                onPressed: () => _openWallet(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
