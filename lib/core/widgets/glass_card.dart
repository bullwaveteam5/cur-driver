import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.radius = 24,
    this.gradient,
    this.color,
    this.borderColor,
    this.blur = true,
    this.onTap,
    this.glow,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Gradient? gradient;
  final Color? color;
  final Color? borderColor;
  final bool blur;
  final VoidCallback? onTap;
  final Color? glow;

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      padding: padding,
      decoration: BoxDecoration(
        gradient: color == null ? (gradient ?? AppColors.glassGradient) : null,
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor ?? AppColors.glassBorder),
      ),
      child: child,
    );

    if (blur) {
      content = ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: content,
        ),
      );
    } else {
      content = ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: content,
      );
    }

    Widget result = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: (glow ?? Colors.black).withValues(alpha: glow == null ? 0.35 : 0.25),
            blurRadius: glow == null ? 24 : 30,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: content,
    );

    if (onTap != null) {
      result = Stack(
        children: [
          result,
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(radius),
                onTap: onTap,
              ),
            ),
          ),
        ],
      );
    }

    return result;
  }
}
