import 'package:flutter/material.dart';

import '../../../core/utils/currency_formatter.dart';
import '../models/salafiya.dart';

class SalafiyaDetailsScreen extends StatelessWidget {
  final Salafiya salafiya;

  const SalafiyaDetailsScreen({
    super.key,
    required this.salafiya,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(salafiya.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.payments,
                        color: Colors.green,
                      ),
                      title: const Text("قيمة القسط"),
                      trailing: Text(
                        CurrencyFormatter.format(salafiya.amount),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.people,
                        color: Colors.blue,
                      ),
                      title: const Text("عدد المشتركين"),
                      trailing: Text(
                        "${salafiya.members}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  // سيتم ربط شاشة المشتركين لاحقاً
                },
                icon: const Icon(Icons.people),
                label: const Text("إدارة المشتركين"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}