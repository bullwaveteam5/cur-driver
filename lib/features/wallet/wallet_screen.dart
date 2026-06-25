import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/section_header.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  static const List<Map<String, dynamic>> _transactions = [
    {
      'title': 'Ride Earning',
      'subtitle': 'Airport Terminal 2 → Railway Station',
      'amount': '+ ₹420',
      'credit': true,
      'icon': Icons.directions_car_rounded,
    },
    {
      'title': 'Withdrawal',
      'subtitle': 'To Bank Account ****1234',
      'amount': '- ₹2,000',
      'credit': false,
      'icon': Icons.account_balance_rounded,
    },
    {
      'title': 'Ride Earning',
      'subtitle': 'City Mall → Sector 18',
      'amount': '+ ₹260',
      'credit': true,
      'icon': Icons.directions_car_rounded,
    },
    {
      'title': 'Incentive Bonus',
      'subtitle': 'Weekly target achieved',
      'amount': '+ ₹500',
      'credit': true,
      'icon': Icons.card_giftcard_rounded,
    },
    {
      'title': 'Ride Earning',
      'subtitle': 'Tech Park → Downtown Plaza',
      'amount': '+ ₹540',
      'credit': true,
      'icon': Icons.directions_car_rounded,
    },
  ];

  void _withdraw(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Withdrawal request submitted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
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
                          const Icon(
                            Icons.account_balance_wallet_rounded,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Wallet Balance',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.more_horiz_rounded,
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '₹3,800',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          _heroChip(Icons.arrow_upward_rounded, 'Sent ₹2,000'),
                          const SizedBox(width: 10),
                          _heroChip(
                              Icons.arrow_downward_rounded, 'Earned ₹5,800'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                CustomButton(
                  label: 'Withdraw to Bank',
                  icon: Icons.arrow_downward_rounded,
                  onPressed: () => _withdraw(context),
                ),
                const SizedBox(height: 28),
                const SectionHeader(title: 'Recent Transactions'),
                const SizedBox(height: 14),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _transactions.length,
                  separatorBuilder: (_, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final tx = _transactions[index];
                    final bool credit = tx['credit'] as bool;
                    final Color color =
                        credit ? AppColors.success : AppColors.danger;
                    return GlassCard(
                      padding: const EdgeInsets.all(14),
                      blur: false,
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.16),
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(
                                color: color.withValues(alpha: 0.25),
                              ),
                            ),
                            child: Icon(
                              tx['icon'] as IconData,
                              color: color,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tx['title'] as String,
                                  style: const TextStyle(
                                    color: AppColors.text,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  tx['subtitle'] as String,
                                  style: const TextStyle(
                                    color: AppColors.muted,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            tx['amount'] as String,
                            style: TextStyle(
                              color: color,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _heroChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 13),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
