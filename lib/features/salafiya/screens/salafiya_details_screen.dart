import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../members/screens/member_list_screen.dart';
import '../../payments/screens/payment_list_screen.dart';
import '../models/salafiya.dart';

class SalafiyaDetailsScreen extends StatelessWidget {
  final Salafiya salafiya;

  const SalafiyaDetailsScreen({
    super.key,
    required this.salafiya,
  });

  String formatDate(String date) {
    try {
      return DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
    } catch (_) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(salafiya.name),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard),
                text: "نظرة عامة",
              ),
              Tab(
                icon: Icon(Icons.people),
                text: "الأعضاء",
              ),
              Tab(
                icon: Icon(Icons.payments),
                text: "الدفعات",
              ),
              Tab(
                icon: Icon(Icons.casino),
                text: "القرعة",
              ),
              Tab(
                icon: Icon(Icons.bar_chart),
                text: "التقارير",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _OverviewTab(
              salafiya: salafiya,
              formatDate: formatDate,
            ),
            MemberListScreen(
              salafiya: salafiya,
            ),
            PaymentListScreen(
              salafiyaId: salafiya.id,
            ),
            const _LotteryTab(),
            const _ReportsTab(),
          ],
        ),
      ),
    );
  }
}

class _OverviewTab extends StatelessWidget {
  final Salafiya salafiya;
  final String Function(String) formatDate;

  const _OverviewTab({
    required this.salafiya,
    required this.formatDate,
  });

  Widget item(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff211F26),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
            color: const Color(0xff14B8A6),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        item(
          Icons.person,
          "المسؤول",
          salafiya.adminName,
        ),
        item(
          Icons.phone,
          "الهاتف",
          salafiya.adminPhone,
        ),
        item(
          Icons.account_balance_wallet,
          "إجمالي المبلغ",
          "${salafiya.totalAmount.toStringAsFixed(0)} د.ع",
        ),
        item(
          Icons.payments,
          "قيمة الاشتراك",
          "${salafiya.monthlyPayment.toStringAsFixed(0)} د.ع",
        ),
        item(
          Icons.groups,
          "عدد الأعضاء",
          salafiya.members.toString(),
        ),
        item(
          Icons.calendar_month,
          "تاريخ البداية",
          formatDate(salafiya.startDate),
        ),
        item(
          Icons.calendar_today,
          "تاريخ النهاية",
          formatDate(salafiya.endDate),
        ),
        item(
          Icons.repeat,
          "الشهر الحالي",
          salafiya.currentMonth.toString(),
        ),
        item(
          Icons.info,
          "الحالة",
          salafiya.status,
        ),
                if (salafiya.notes.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xff211F26),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "الملاحظات",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  salafiya.notes,
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _LotteryTab extends StatelessWidget {
  const _LotteryTab();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "سيتم إنشاء نظام القرعة قريباً",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}

class _ReportsTab extends StatelessWidget {
  const _ReportsTab();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "سيتم إنشاء التقارير قريباً",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}