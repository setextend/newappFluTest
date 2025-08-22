import 'package:flutter/material.dart';

extension AppColors on ColorScheme {
  Color get success => const Color(0xFF4CAF50);
  Color get warning => const Color(0xFFFF9800);
  Color get error => const Color(0xFFF44336);
  Color get info => const Color(0xFF2196F3);
  Color get cardBackground => brightness == Brightness.dark
      ? const Color(0xFF2C2C2C)
      : const Color(0xFFFFFFFF);
      
  Color get textSecondary => brightness == Brightness.dark 
      : Colors.grey.shade400 
      : Colors.grey.shade600;
}