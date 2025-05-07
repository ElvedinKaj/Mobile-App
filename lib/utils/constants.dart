import 'package:flutter/material.dart';

// API Constants
const String kBaseUrl = 'https://api.example.com';

// Theme Colors
class AppColors {
  static const primaryColor = Color(0xFF1976D2);
  static const accentColor = Color(0xFF64B5F6);
  static const backgroundColor = Color(0xFFF5F5F5);
  static const textColor = Color(0xFF333333);
  static const errorColor = Color(0xFFE53935);
  static const successColor = Color(0xFF4CAF50);
}

// Text Styles
class AppTextStyles {
  static const heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  
  static const heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  
  static const body = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );
  
  static const caption = TextStyle(
    fontSize: 14,
    color: Color(0xFF757575),
  );
}

// Sizes and Dimensions
class AppSizes {
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 12.0;
} 