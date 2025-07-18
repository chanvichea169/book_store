import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  // Text styles
  static const TextStyle appTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle heading1 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    color: AppColors.secondaryText,
  );

  static const TextStyle bookTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
  );

  static const TextStyle bookAuthor = TextStyle(
    fontSize: 12,
    color: AppColors.secondaryText,
  );

  static const TextStyle bookPrice = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  // Promo styles
  static const TextStyle promoTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle promoSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle promoText = TextStyle(
    fontSize: 14,
    color: Colors.white,
  );

  // Shadow
  static const BoxShadow shadow = BoxShadow(
    color: AppColors.shadow,
    spreadRadius: 1,
    blurRadius: 8,
    offset: Offset(0, 2),
  );
}