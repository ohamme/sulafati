import 'package:flutter/material.dart';
import '../controllers/salafiya_info_controller.dart';

import '../widgets/form/form_header.dart';
import '../widgets/form/fields/name_field.dart';
import '../widgets/form/fields/admin_name_field.dart';
import '../widgets/form/fields/phone_field.dart';
import '../widgets/form/fields/monthly_payment_field.dart';
import '../widgets/form/fields/members_field.dart';
import '../widgets/form/fields/start_date_field.dart';
import '../widgets/form/fields/notes_field.dart';

import '../widgets/form/cards/summary_card.dart';
import '../widgets/form/buttons/save_button.dart';

class SalafiyaFormScreen extends StatefulWidget {
  const SalafiyaFormScreen({super.key});

  @override
  State<SalafiyaFormScreen> createState() => _SalafiyaFormScreenState();
}

class _SalafiyaFormScreenState extends State<SalafiyaFormScreen> {
  late SalafiyaInfoController controller;

  @override
  void initState() {
    super.initState();

    controller = SalafiyaInfoController();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إنشاء سلفة جديدة"), centerTitle: true),

      body: Directionality(
        textDirection: TextDirection.rtl,

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Form(
            key: controller.formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                const FormHeader(),

                const SizedBox(height: 20),

                NameField(controller: controller.nameController),

                const SizedBox(height: 15),

                AdminNameField(controller: controller.adminNameController),

                const SizedBox(height: 15),

                PhoneField(controller: controller.phoneController),

                const SizedBox(height: 15),

                MonthlyPaymentField(
                  controller: controller.monthlyPaymentController,
                  onChanged: (_) {
                    setState(() {});
                  },
                ),

                const SizedBox(height: 15),

                MembersField(
                  controller: controller.membersController,

                  onChanged: (_) {
                    setState(() {});
                  },
                ),

                const SizedBox(height: 15),

                StartDateField(
                  selectedDate: controller.startDate,

                  onChanged: (date) {
                    setState(() {
                      controller.startDate = date;
                    });
                  },
                ),

                const SizedBox(height: 15),

                NotesField(controller: controller.notesController),

                const SizedBox(height: 20),

                SummaryCard(
                  monthlyPayment: controller.monthlyPayment,

                  members: controller.members,

                  totalAmount: controller.totalAmount,

                  endDate: controller.endDate,
                ),

                const SizedBox(height: 25),

                SaveButton(
                  onPressed: () async {
                    final result = await controller.save(context);

                    if (result && context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
