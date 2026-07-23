import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [

        Icon(
          Icons.savings,
          size: 70,
          color: Color(0xff0F766E),
        ),

        SizedBox(height: 15),

        Text(
          "إنشاء سلفة جديدة",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 8),

        Text(
          "أدخل بيانات السلفة وسيتم حساب رأس المال تلقائياً",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}