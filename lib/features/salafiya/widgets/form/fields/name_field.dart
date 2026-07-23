import 'package:flutter/material.dart';


class NameField extends StatelessWidget {

  final TextEditingController controller;


  const NameField({
    super.key,
    required this.controller,
  });



  @override
  Widget build(BuildContext context) {

    return TextFormField(

      controller: controller,


      textDirection: TextDirection.rtl,


      decoration: InputDecoration(

        labelText: "اسم السلفة",

        hintText: "مثال: سلفة الموظفين",

        prefixIcon: const Icon(
          Icons.savings,
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


          return "يرجى إدخال اسم السلفة";

        }


        if (value.trim().length < 3) {

          return "اسم السلفة قصير جداً";

        }


        return null;

      },

    );

  }

}