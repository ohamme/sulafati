import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/salafiya_provider.dart';
import 'salafiya_form_screen.dart';

class SalafiyaListScreen extends StatefulWidget {
  const SalafiyaListScreen({super.key});

  @override
  State<SalafiyaListScreen> createState() => _SalafiyaListScreenState();
}

class _SalafiyaListScreenState extends State<SalafiyaListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<SalafiyaProvider>().loadSalafiyat();
    });
  }

  Future<void> _openAddScreen() async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => const SalafiyaFormScreen(),
      ),
    );

    if (!mounted) return;

    if (result == true) {
      await context.read<SalafiyaProvider>().loadSalafiyat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("السلفيات"),
        centerTitle: true,
      ),
      body: Consumer<SalafiyaProvider>(
        builder: (context, provider, child) {
          if (provider.salafiyat.isEmpty) {
            return const Center(
              child: Text(
                "لا توجد سلفيات حالياً",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: provider.salafiyat.length,
            itemBuilder: (context, index) {
              final salafiya = provider.salafiyat[index];

              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.groups),
                  ),
                  title: Text(
                    salafiya.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "قيمة القسط: ${salafiya.amount}\n"
                    "عدد المشتركين: ${salafiya.members}",
                  ),
                  isThreeLine: true,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      if (salafiya.id == null) return;

                      await provider.deleteSalafiya(salafiya.id!);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddScreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}