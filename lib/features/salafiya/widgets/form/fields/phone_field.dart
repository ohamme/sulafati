import 'package:flutter/material.dart';


class PhoneField extends StatelessWidget {

  final TextEditingController controller;


  const PhoneField({
    super.key,
    required this.controller,
  });



  @override
  Widget build(BuildContext context) {

    return TextFormField(

      controller: controller,

      keyboardType:
          TextInputType.phone,


      textDirection:
          TextDirection.rtl,


      decoration: InputDecoration(

        labelText: "رقم الهاتف",

        hintText:
            "مثال: 07701234567",


        prefixIcon: const Icon(
          Icons.phone,
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


          return "يرجى إدخال رقم الهاتف";

        }



        final phone =
            value.trim();



        if (phone.length < 10) {


          return "رقم الهاتف غير صحيح";

        }



        return null;

      },

    );

  }

}