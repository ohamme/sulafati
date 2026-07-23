import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class AppSectionTitle extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const AppSectionTitle({
    super.key,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.title,
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}
