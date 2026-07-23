import 'package:flutter/material.dart';

import '../../salafiya/screens/salafiya_form_screen.dart';

class CreateSalafiyaButton extends StatelessWidget {
  const CreateSalafiyaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: FilledButton.icon(
        icon: const Icon(Icons.add),
        label: const Text(
          "إنشاء سلفة جديدة",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const SalafiyaFormScreen(),
            ),
          );
        },
      ),
    );
  }
}