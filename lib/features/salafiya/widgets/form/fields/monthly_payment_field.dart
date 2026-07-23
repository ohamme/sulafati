import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MonthlyPaymentField extends StatelessWidget {

  final TextEditingController controller;

  final Function(String)? onChanged;


  const MonthlyPaymentField({
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
            "قيمة الاشتراك الشهري",


        hintText:
            "مثال: 50000",


        prefixIcon:
            const Icon(
              Icons.payments,
            ),


        suffixText:
            "د.ع",


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
              "يرجى إدخال قيمة الاشتراك";

        }



        final amount =
            double.tryParse(
              value,
            );



        if (amount == null ||
            amount <= 0) {


          return
              "القيمة يجب أن تكون أكبر من صفر";

        }



        return null;

      },

    );

  }

}