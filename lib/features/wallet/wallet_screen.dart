import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';

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
      const SnackBar(
        content: Text('Withdrawal request submitted'),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
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
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: AppColors.greenGradient,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.account_balance_wallet_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Wallet Balance',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      '₹3,800',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                label: 'Withdraw',
                icon: Icons.arrow_downward_rounded,
                onPressed: () => _withdraw(context),
              ),
              const SizedBox(height: 28),
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 14),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _transactions.length,
                separatorBuilder: (_, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final tx = _transactions[index];
                  final bool credit = tx['credit'] as bool;
                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.cardBorder),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: (credit
                                    ? AppColors.primary
                                    : Colors.redAccent)
                                .withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            tx['icon'] as IconData,
                            color:
                                credit ? AppColors.primary : Colors.redAccent,
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
                                  color: AppColors.subText,
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
                            color:
                                credit ? AppColors.primary : Colors.redAccent,
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
    );
  }
}
