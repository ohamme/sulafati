import 'package:flutter/material.dart';
import '../models/member.dart';

class MemberStatistics extends StatelessWidget {

  final List<Member> members;

  const MemberStatistics({
    super.key,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {

    final total = members.length;

    final winners =
        members.where((e) => e.hasWon).length;

    final waiting = total - winners;

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: Row(

          mainAxisAlignment:
              MainAxisAlignment.spaceAround,

          children: [

            _item(
              "الأعضاء",
              total.toString(),
              Colors.blue,
            ),

            _item(
              "استلموا",
              winners.toString(),
              Colors.green,
            ),

            _item(
              "بانتظار",
              waiting.toString(),
              Colors.orange,
            ),

          ],

        ),

      ),

    );

  }

  Widget _item(
    String title,
    String value,
    Color color,
  ) {

    return Column(

      children: [

        Text(
          value,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),

        const SizedBox(height: 6),

        Text(title),

      ],

    );

  }

}