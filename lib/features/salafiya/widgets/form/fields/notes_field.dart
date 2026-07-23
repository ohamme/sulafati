import 'package:flutter/material.dart';


class NotesField extends StatelessWidget {

  final TextEditingController controller;


  const NotesField({
    super.key,
    required this.controller,
  });


  @override
  Widget build(BuildContext context) {

    return TextFormField(

      controller: controller,

      maxLines: 4,

      textDirection: TextDirection.rtl,

      decoration: InputDecoration(

        labelText: "الملاحظات",

        hintText:
            "أي ملاحظات إضافية",

        prefixIcon:
            const Icon(Icons.notes),

        border:
            OutlineInputBorder(

          borderRadius:
              BorderRadius.circular(15),

        ),

      ),

    );
  }
}