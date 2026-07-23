import 'package:flutter/widgets.dart';

class AppSpacing {
  AppSpacing._();

  // Padding
  static const EdgeInsets screen =
      EdgeInsets.symmetric(horizontal: 20, vertical: 16);

  static const EdgeInsets card =
      EdgeInsets.all(16);

  // SizedBox Heights
  static const SizedBox xs = SizedBox(height: 4);
  static const SizedBox sm = SizedBox(height: 8);
  static const SizedBox md = SizedBox(height: 12);
  static const SizedBox lg = SizedBox(height: 20);
  static const SizedBox xl = SizedBox(height: 30);

  // Width
  static const SizedBox wXs = SizedBox(width: 4);
  static const SizedBox wSm = SizedBox(width: 8);
  static const SizedBox wMd = SizedBox(width: 12);
  static const SizedBox wLg = SizedBox(width: 20);
}