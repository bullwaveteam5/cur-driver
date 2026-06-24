import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color primary = Colors.green;
  static const Color text = Colors.white;
  static const Color subText = Colors.white70;

  static const Color cardBorder = Color(0xFF2A2A2A);
  static const Color divider = Color(0xFF2C2C2C);

  static const LinearGradient greenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1B5E20),
      Color(0xFF2E7D32),
      Color(0xFF43A047),
    ],
  );
}
