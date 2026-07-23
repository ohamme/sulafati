import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentStatistics extends StatelessWidget {
  final double totalPaid;

  final int paidCount;

  final int pendingCount;

  const PaymentStatistics({
    super.key,

    required this.totalPaid,

    required this.paidCount,

    required this.pendingCount,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###");

    return Padding(
      padding: const EdgeInsets.all(16),

      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _card(
                  context,

                  title: "المبلغ المدفوع",

                  value: "${formatter.format(totalPaid)} د.ع",

                  icon: Icons.payments,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _card(
                  context,

                  title: "المدفوعة",

                  value: paidCount.toString(),

                  icon: Icons.check_circle,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          _card(
            context,

            title: "غير المدفوعة",

            value: pendingCount.toString(),

            icon: Icons.pending_actions,
          ),
        ],
      ),
    );
  }

  Widget _card(
    BuildContext context, {

    required String title,

    required String value,

    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,

        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            blurRadius: 8,

            spreadRadius: 1,

            color: Colors.black.withValues(alpha: 0.08),
          ),
        ],
      ),

      child: Row(
        children: [
          CircleAvatar(radius: 24, child: Icon(icon)),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(title, style: const TextStyle(fontSize: 14)),

                const SizedBox(height: 5),

                Text(
                  value,

                  style: const TextStyle(
                    fontSize: 18,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
