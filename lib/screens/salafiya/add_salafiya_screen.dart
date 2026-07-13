import 'package:flutter/material.dart';

class AddSalafiyaScreen extends StatefulWidget {
  const AddSalafiyaScreen({super.key});

  @override
  State<AddSalafiyaScreen> createState() => _AddSalafiyaScreenState();
}

class _AddSalafiyaScreenState extends State<AddSalafiyaScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final membersController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  int dueDay = 1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("إضافة سلفة"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [

                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "اسم السلفة",
                  ),
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "قيمة القسط",
                  ),
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: membersController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "عدد المشتركين",
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text("حفظ"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}