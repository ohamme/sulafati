import 'package:flutter/material.dart';
import 'salafiya_form_screen.dart';

class SalafiyaListScreen extends StatelessWidget {
  const SalafiyaListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("السلفيات"), centerTitle: true),
      body: const Center(
        child: Text(
          "لا توجد سلفيات حالياً",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SalafiyaFormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
