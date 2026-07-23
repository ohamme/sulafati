import 'package:flutter/material.dart';

class AddMemberButton extends StatelessWidget {

  final VoidCallback onPressed;

  const AddMemberButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      width: double.infinity,

      height: 55,

      child: ElevatedButton.icon(

        onPressed: onPressed,

        icon: const Icon(Icons.person_add),

        label: const Text(
          "إضافة عضو",
        ),

      ),

    );

  }

}