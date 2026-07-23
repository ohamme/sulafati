import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../salafiya/models/salafiya.dart';
import '../../salafiya/screens/salafiya_details_screen.dart';

class SalafiyaCard extends StatelessWidget {
  final Salafiya salafiya;

  const SalafiyaCard({
    super.key,
    required this.salafiya,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###");

    Color statusColor;

    IconData statusIcon;

    switch (salafiya.status) {
      case "نشطة":
      case "active":
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;

      case "مكتملة":
      case "completed":
        statusColor = Colors.blue;
        statusIcon = Icons.flag_circle;
        break;

      case "متوقفة":
      case "stopped":
        statusColor = Colors.red;
        statusIcon = Icons.pause_circle;
        break;

      default:
        statusColor = Colors.grey;
        statusIcon = Icons.help;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 18),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SalafiyaDetailsScreen(
                salafiya: salafiya,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [

              Row(
                children: [

                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xff0F766E),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.savings,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          salafiya.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "${salafiya.members} أعضاء",
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: .12),
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Icon(
                          statusIcon,
                          size: 16,
                          color: statusColor,
                        ),

                        const SizedBox(width: 4),

                        Text(
                          salafiya.status,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              const Divider(),

              const SizedBox(height: 10),

              Row(
                children: [

                  Expanded(
                    child: _InfoItem(
                      icon: Icons.payments,
                      title: "الاشتراك",
                      value:
                          formatter.format(
                        salafiya.monthlyPayment,
                      ),
                    ),
                  ),

                  Expanded(
                    child: _InfoItem(
                      icon:
                          Icons.account_balance_wallet,
                      title: "الإجمالي",
                      value:
                          formatter.format(
                        salafiya.totalAmount,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            SalafiyaDetailsScreen(
                          salafiya: salafiya,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.visibility,
                  ),
                  label: const Text(
                    "عرض التفاصيل",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Icon(
          icon,
          color: const Color(0xff0F766E),
        ),

        const SizedBox(height: 8),

        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}