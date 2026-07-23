import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_section_title.dart';
import '../../salafiya/screens/salafiya_form_screen.dart';
import 'quick_action_card.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const AppSectionTitle(
          title: "الإجراءات السريعة",
        ),

        const SizedBox(height: 15),

        Row(
          children: [

            QuickActionCard(
              title: "سلفة جديدة",
              icon: Icons.add_card,
              color: AppColors.primary,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const SalafiyaFormScreen()
                  ),
                );
              },
            ),

            const SizedBox(width: 12),

            QuickActionCard(
              title: "إضافة عضو",
              icon: Icons.person_add,
              color: Colors.blue,
              onTap: () {},
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [

            QuickActionCard(
              title: "دفعة",
              icon: Icons.payments,
              color: Colors.green,
              onTap: () {},
            ),

            const SizedBox(width: 12),

            QuickActionCard(
              title: "قرعة",
              icon: Icons.casino,
              color: Colors.orange,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}