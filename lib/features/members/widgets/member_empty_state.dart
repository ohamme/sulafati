import 'package:flutter/material.dart';

class MemberEmptyState extends StatelessWidget {

  const MemberEmptyState({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(

      child: Padding(

        padding: const EdgeInsets.all(40),

        child: Column(

          mainAxisSize: MainAxisSize.min,

          children: const [

            Icon(
              Icons.people_outline,
              size: 70,
              color: Colors.grey,
            ),

            SizedBox(height: 20),

            Text(
              "لا يوجد أعضاء",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "ابدأ بإضافة أول عضو لهذه السلفة",
              textAlign: TextAlign.center,
            ),

          ],

        ),

      ),

    );

  }

}