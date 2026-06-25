import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'glass_card.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.iconColor,
    this.gradient,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color? iconColor;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final Color accent = iconColor ?? AppColors.primary;
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  gradient: gradient,
                  color: gradient == null
                      ? accent.withValues(alpha: 0.16)
                      : null,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: gradient == null
                      ? null
                      : [
                          BoxShadow(
                            color: accent.withValues(alpha: 0.35),
                            blurRadius: 14,
                            offset: const Offset(0, 6),
                          ),
                        ],
                ),
                child: Icon(
                  icon,
                  color: gradient == null ? accent : Colors.white,
                  size: 21,
                ),
              ),
              Icon(
                Icons.north_east_rounded,
                color: AppColors.muted,
                size: 16,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  maxLines: 1,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.subText,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
