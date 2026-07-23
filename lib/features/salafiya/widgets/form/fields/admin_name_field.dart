import 'package:flutter/material.dart';


class AdminNameField extends StatelessWidget {

  final TextEditingController controller;


  const AdminNameField({
    super.key,
    required this.controller,
  });



  @override
  Widget build(BuildContext context) {

    return TextFormField(

      controller: controller,


      textDirection: TextDirection.rtl,


      decoration: InputDecoration(

        labelText: "اسم المسؤول",

        hintText: "مثال: محمد صالح",

        prefixIcon: const Icon(
          Icons.person,
        ),


        border: OutlineInputBorder(

          borderRadius:
              BorderRadius.circular(15),

        ),


        filled: true,

      ),



      validator: (value) {


        if (value == null ||
            value.trim().isEmpty) {

          return "يرجى إدخال اسم المسؤول";

        }


        return null;

      },

    );

  }

}