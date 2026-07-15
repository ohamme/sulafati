import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/currency_formatter.dart';
import '../../../widgets/delete_pin_dialog.dart';
import '../providers/salafiya_provider.dart';
import 'salafiya_details_screen.dart';
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

  Future<void> _deleteSalafiya(int id) async {
    final provider = context.read<SalafiyaProvider>();

    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const DeletePinDialog(),
    );

    if (!mounted) return;

    if (confirmed == true) {
      await provider.deleteSalafiya(id);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("تم حذف السلفة بنجاح"),
          backgroundColor: Colors.green,
        ),
      );
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
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
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
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.groups,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                salafiya.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              tooltip: "حذف",
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                if (salafiya.id == null) return;

                                _deleteSalafiya(salafiya.id!);
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            const Icon(
                              Icons.payments,
                              color: Colors.green,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              CurrencyFormatter.format(
                                salafiya.amount,
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            const Icon(
                              Icons.people,
                              color: Colors.blue,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "${salafiya.members} مشترك",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddScreen,
        icon: const Icon(Icons.add),
        label: const Text("إضافة"),
      ),
    );
  }
}