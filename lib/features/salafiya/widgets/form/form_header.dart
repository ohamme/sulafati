import 'package:flutter/material.dart';


class FormHeader extends StatelessWidget {

  const FormHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),


      child: Padding(

        padding:
            const EdgeInsets.all(20),


        child: Column(

          children: [


            Container(

              height: 70,

              width: 70,

              decoration: BoxDecoration(

                color:
                    const Color(0xff0F766E)
                        .withValues(alpha: 0.15),

                shape:
                    BoxShape.circle,

              ),


              child: const Icon(

                Icons.savings,

                size: 38,

                color:
                    Color(0xff0F766E),

              ),

            ),



            const SizedBox(height: 12),



            const Text(

              "بيانات السلفة الجديدة",

              style: TextStyle(

                fontSize: 20,

                fontWeight:
                    FontWeight.bold,

              ),

            ),



            const SizedBox(height: 8),



            const Text(

              "أدخل معلومات السلفة وسيتم حساب المبلغ النهائي تلقائياً",

              textAlign:
                  TextAlign.center,

              style: TextStyle(

                color:
                    Colors.grey,

                fontSize: 14,

              ),

            ),


          ],

        ),

      ),

    );

  }

}