import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/section_header.dart';
import '../wallet/wallet_screen.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  static const List<Map<String, dynamic>> _breakdown = [
    {
      'label': 'Today',
      'amount': '₹2,450',
      'factor': 0.55,
      'gradient': AppColors.primaryGradient,
      'color': AppColors.primary,
    },
    {
      'label': 'Weekly',
      'amount': '₹15,900',
      'factor': 0.78,
      'gradient': AppColors.blueGradient,
      'color': AppColors.accent,
    },
    {
      'label': 'Monthly',
      'amount': '₹62,400',
      'factor': 1.0,
      'gradient': AppColors.successGradient,
      'color': AppColors.success,
    },
  ];

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
      backgroundColor: Colors.transparent,
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
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHero(),
              const SizedBox(height: 24),
              const SectionHeader(title: 'Earnings Breakdown'),
              const SizedBox(height: 14),
              ..._breakdown.map(_buildBreakdownCard),
              const SizedBox(height: 10),
              const SectionHeader(title: 'This Week'),
              const SizedBox(height: 14),
              _buildWeekChart(),
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

  Widget _buildHero() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.4),
            blurRadius: 30,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Total Balance Earned',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.trending_up_rounded,
                        color: Colors.white, size: 14),
                    SizedBox(width: 4),
                    Text(
                      '+12%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            '₹62,400',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Keep driving to earn more rewards',
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildBreakdownCard(Map<String, dynamic> data) {
    final Color color = data['color'] as Color;
    final Gradient gradient = data['gradient'] as Gradient;
    final double factor = data['factor'] as double;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GlassCard(
        padding: const EdgeInsets.all(18),
        blur: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.payments_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${data['label']} Earnings',
                  style: const TextStyle(
                    color: AppColors.subText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  data['amount'] as String,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: factor),
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOutCubic,
                builder: (context, value, _) {
                  return LinearProgressIndicator(
                    value: value,
                    minHeight: 8,
                    backgroundColor: AppColors.surfaceAlt,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekChart() {
    return GlassCard(
      child: SizedBox(
        height: 170,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _weekData.map((data) {
            final double factor = data['factor'] as double;
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: factor),
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, _) {
                    return Container(
                      width: 22,
                      height: 120 * value,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  data['day'] as String,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 12,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
