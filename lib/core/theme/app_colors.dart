import 'package:flutter/material.dart';

/// جميع ألوان التطبيق
/// لا تستخدم Color مباشرة داخل الواجهات.
/// استخدم AppColors فقط.
class AppColors {
  AppColors._();

  //==============================
  // Primary
  //==============================

  static const Color primary = Color(0xFF0F766E);
  static const Color primaryLight = Color(0xFF14B8A6);
  static const Color primaryDark = Color(0xFF115E59);

  //==============================
  // Secondary
  //==============================

  static const Color secondary = Color(0xFF0EA5E9);

  //==============================
  // Success
  //==============================

  static const Color success = Color(0xFF22C55E);

  //==============================
  // Warning
  //==============================

  static const Color warning = Color(0xFFF59E0B);

  //==============================
  // Error
  //==============================

  static const Color error = Color(0xFFEF4444);

  //==============================
  // Info
  //==============================

  static const Color info = Color(0xFF3B82F6);

  //==============================
  // Background
  //==============================

  static const Color background = Color(0xFFF8FAFC);

  static const Color surface = Colors.white;

  static const Color card = Colors.white;

  //==============================
  // Text
  //==============================

  static const Color textPrimary = Color(0xFF0F172A);

  static const Color textSecondary = Color(0xFF64748B);

  static const Color textHint = Color(0xFF94A3B8);

  static const Color textWhite = Colors.white;

  //==============================
  // Border
  //==============================

  static const Color border = Color(0xFFE2E8F0);

  static const Color divider = Color(0xFFE5E7EB);

  //==============================
  // Status Colors
  //==============================

  static const Color active = success;

  static const Color completed = info;

  static const Color stopped = error;

  static const Color pending = warning;

  static const Color paid = success;

  static const Color unpaid = warning;

  static const Color late = error;

  //==============================
  // Dashboard
  //==============================

  static const Color dashboardMoney = Color(0xFF16A34A);

  static const Color dashboardMembers = Color(0xFF2563EB);

  static const Color dashboardActive = Color(0xFF0F766E);

  static const Color dashboardFinished = Color(0xFF9333EA);
}