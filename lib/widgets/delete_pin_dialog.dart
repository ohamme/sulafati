import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

class DeletePinDialog extends StatefulWidget {
  const DeletePinDialog({super.key});

  @override
  State<DeletePinDialog> createState() => _DeletePinDialogState();
}

class _DeletePinDialogState extends State<DeletePinDialog> {
  final _controller = TextEditingController();

  bool _error = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _confirm() {
    if (_controller.text == AppConstants.defaultDeletePin.toString()) {
      Navigator.pop(context, true);
    } else {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("تأكيد الحذف"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "أدخل رمز الحذف المكون من 4 أرقام",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            obscureText: true,
            maxLength: 4,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              errorText: _error ? "رمز غير صحيح" : null,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text("إلغاء"),
        ),
        FilledButton(
          onPressed: _confirm,
          child: const Text("حذف"),
        ),
      ],
    );
  }
}