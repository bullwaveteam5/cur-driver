import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFF0B1020);
  static const Color backgroundAlt = Color(0xFF121A2D);
  static const Color surface = Color(0xFF18233B);
  static const Color surfaceAlt = Color(0xFF1E2A44);

  static const Color primary = Color(0xFF7B61FF);
  static const Color primaryDeep = Color(0xFF6A5AE0);
  static const Color primarySoft = Color(0xFF8B5CF6);
  static const Color accent = Color(0xFF4F8CFF);

  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);

  static const Color text = Color(0xFFFFFFFF);
  static const Color subText = Color(0xFFB8C1D9);
  static const Color muted = Color(0xFF7D89A7);

  static const Color cardBorder = Color(0x14FFFFFF);
  static const Color glassBorder = Color(0x1FFFFFFF);
  static const Color divider = Color(0x14FFFFFF);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6A5AE0),
      Color(0xFF7B61FF),
      Color(0xFF8B5CF6),
    ],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF6A5AE0),
      Color(0xFF4F8CFF),
    ],
  );

  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF4F8CFF),
      Color(0xFF6A5AE0),
    ],
  );

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF16A34A),
      Color(0xFF22C55E),
    ],
  );

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFF59E0B),
      Color(0xFFFBBF24),
    ],
  );

  static const LinearGradient glassGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x14FFFFFF),
      Color(0x05FFFFFF),
    ],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0B1020),
      Color(0xFF101730),
      Color(0xFF0B1020),
    ],
  );
}
