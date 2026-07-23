import 'package:flutter/material.dart';
import '../models/member.dart';

class MemberCard extends StatelessWidget {
  final Member member;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const MemberCard({
    super.key,
    required this.member,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final Color statusColor =
        member.hasWon ? Colors.green : Colors.orange;

    final String statusText =
        member.hasWon ? "استلم السلفة" : "بانتظار القرعة";

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.teal.shade100,
          child: const Icon(
            Icons.person,
            color: Colors.teal,
          ),
        ),

        title: Text(
          member.fullName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 4),

            Text(member.phone),

            const SizedBox(height: 6),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                statusText,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),

        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == "edit") {
              onEdit?.call();
            } else {
              onDelete?.call();
            }
          },
          itemBuilder: (_) => const [

            PopupMenuItem(
              value: "edit",
              child: Text("تعديل"),
            ),

            PopupMenuItem(
              value: "delete",
              child: Text("حذف"),
            ),
          ],
        ),
      ),
    );
  }
}