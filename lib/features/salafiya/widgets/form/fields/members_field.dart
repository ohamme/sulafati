import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MembersField extends StatelessWidget {

  final TextEditingController controller;

  final Function(String)? onChanged;


  const MembersField({
    super.key,
    required this.controller,
    this.onChanged,
  });



  @override
  Widget build(BuildContext context) {

    return TextFormField(

      controller: controller,


      keyboardType:
          TextInputType.number,


      inputFormatters: [

        FilteringTextInputFormatter
            .digitsOnly,

      ],


      textDirection:
          TextDirection.rtl,


      onChanged: onChanged,


      decoration: InputDecoration(

        labelText:
            "عدد الأعضاء",


        hintText:
            "مثال: 10",


        prefixIcon:
            const Icon(
              Icons.groups,
            ),


        suffixText:
            "شخص",


        border:
            OutlineInputBorder(

              borderRadius:
                  BorderRadius.circular(15),

            ),


        filled:
            true,

      ),



      validator: (value) {


        if (value == null ||
            value.trim().isEmpty) {


          return
              "يرجى إدخال عدد الأعضاء";

        }



        final count =
            int.tryParse(value);



        if (count == null ||
            count < 2) {


          return
              "يجب أن يكون العدد شخصين أو أكثر";

        }



        if (count > 1000) {


          return
              "العدد كبير جداً";

        }



        return null;

      },

    );

  }

}