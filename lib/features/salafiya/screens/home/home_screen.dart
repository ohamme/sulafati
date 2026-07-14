import 'package:flutter/material.dart';
import 'package:sulafati/features/salafiya/screens/salafiya_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget buildCard(
    BuildContext context,
    IconData icon,
    String title,
    Color color, {
    VoidCallback? onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text("سلفتي"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              buildCard(
                context,
                Icons.groups,
                "السلفيات",
                Colors.green,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SalafiyaListScreen(),
                    ),
                  );
                },
              ),
              buildCard(context, Icons.people, "المشتركون", Colors.blue),
              buildCard(context, Icons.payments, "الدفعات", Colors.orange),
              buildCard(context, Icons.casino, "القرعة", Colors.purple),
              buildCard(context, Icons.bar_chart, "التقارير", Colors.red),
              buildCard(context, Icons.settings, "الإعدادات", Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
