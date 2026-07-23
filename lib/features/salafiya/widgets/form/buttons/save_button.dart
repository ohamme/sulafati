import 'package:flutter/material.dart';


class SaveButton extends StatelessWidget {

  final VoidCallback onPressed;


  const SaveButton({
    super.key,
    required this.onPressed,
  });



  @override
  Widget build(BuildContext context) {

    return SizedBox(

      height: 55,


      width: double.infinity,


      child: ElevatedButton.icon(

        onPressed: onPressed,


        icon: const Icon(
          Icons.save,
          color: Colors.white,
        ),


        label: const Text(

          "حفظ السلفة",

          style: TextStyle(

            fontSize: 17,

            fontWeight: FontWeight.bold,

            color: Colors.white,

          ),

        ),


        style: ElevatedButton.styleFrom(

          backgroundColor:
              const Color(0xff0F766E),


          shape:
              RoundedRectangleBorder(

            borderRadius:
                BorderRadius.circular(15),

          ),

        ),

      ),

    );

  }

}