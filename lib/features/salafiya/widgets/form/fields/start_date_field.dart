import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StartDateField extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onChanged;

  const StartDateField({
    super.key,
    required this.selectedDate,
    required this.onChanged,
  });

  Future<void> _pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      locale: const Locale('ar'),
    );

    if (date != null) {
      onChanged(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => _pickDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: "تاريخ بداية السلفة",
          prefixIcon: const Icon(Icons.calendar_month),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            DateFormat('yyyy-MM-dd').format(selectedDate),
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}