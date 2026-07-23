import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../salafiya/providers/salafiya_provider.dart';
import 'statistics_card.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<SalafiyaProvider>();

    final totalSalafiyat =
        provider.salafiyat.length;

    final active =
        provider.salafiyat
            .where(
              (e) =>
                  e.status == "active",
            )
            .length;

    final finished =
        provider.salafiyat
            .where(
              (e) =>
                  e.status ==
                  "completed",
            )
            .length;

    final totalMoney =
        provider.salafiyat.fold<double>(
      0,
      (sum, item) =>
          sum + item.totalAmount,
    );

    return Column(
      children: [

        Row(
          children: [

            StatisticsCard(
              title: "السلف",
              value:
                  totalSalafiyat.toString(),
              icon: Icons.groups,
              color:
                  AppColors.dashboardMembers,
            ),

            const SizedBox(width: 12),

            StatisticsCard(
              title: "النشطة",
              value: active.toString(),
              icon: Icons.check_circle,
              color:
                  AppColors.dashboardActive,
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [

            StatisticsCard(
              title: "المنتهية",
              value:
                  finished.toString(),
              icon:
                  Icons.flag_circle,
              color:
                  AppColors.dashboardFinished,
            ),

            const SizedBox(width: 12),

            StatisticsCard(
              title: "إجمالي الأموال",
              value:
                  totalMoney.toStringAsFixed(
                      0),
              icon:
                  Icons.payments,
              color:
                  AppColors.dashboardMoney,
            ),
          ],
        ),
      ],
    );
  }
}