import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/salafiya.dart';
import '../providers/salafiya_provider.dart';


class SalafiyaInfoController {


  final formKey = GlobalKey<FormState>();


  final nameController =
      TextEditingController();


  final adminNameController =
      TextEditingController();


  final phoneController =
      TextEditingController();


  final monthlyPaymentController =
      TextEditingController();


  final membersController =
      TextEditingController();


  final notesController =
      TextEditingController();



  DateTime startDate =
      DateTime.now();



  //--------------------------------------------------
  // قيمة الاشتراك الشهري
  //--------------------------------------------------

  double get monthlyPayment {

    return double.tryParse(
          monthlyPaymentController.text,
        ) ??
        0;

  }



  //--------------------------------------------------
  // عدد الأعضاء
  //--------------------------------------------------

  int get members {

    return int.tryParse(
          membersController.text,
        ) ??
        0;

  }



  //--------------------------------------------------
  // المبلغ الكلي
  //--------------------------------------------------

  double get totalAmount {

    return monthlyPayment * members;

  }



  //--------------------------------------------------
  // تاريخ النهاية
  //--------------------------------------------------

  DateTime get endDate {

    return DateTime(
      startDate.year,
      startDate.month + members,
      startDate.day,
    );

  }



  String get formattedEndDate {

    return DateFormat(
      'yyyy-MM-dd',
    ).format(endDate);

  }



  //--------------------------------------------------
  // حفظ السلفة
  //--------------------------------------------------

  Future<bool> save(
    BuildContext context,
  ) async {


    if (!formKey.currentState!.validate()) {

      return false;

    }



    final now =
        DateTime.now().toIso8601String();



    final salafiya =
        Salafiya(

          name:
              nameController.text.trim(),


          adminName:
              adminNameController.text.trim(),


          adminPhone:
              phoneController.text.trim(),


          monthlyPayment:
              monthlyPayment,


          members:
              members,


          totalAmount:
              totalAmount,


          startDate:
              startDate.toIso8601String(),


          endDate:
              endDate.toIso8601String(),


          colorHex:
              "#0F766E",


          iconCode:
              "savings",


          status:
              "نشطة",


          currentMonth:
              1,


          notes:
              notesController.text.trim(),


          createdAt:
              now,


          updatedAt:
              now,

        );



    await context
        .read<SalafiyaProvider>()
        .addSalafiya(
          salafiya,
        );


    return true;

  }




  //--------------------------------------------------
  // تنظيف الذاكرة
  //--------------------------------------------------

  void dispose(){

    nameController.dispose();

    adminNameController.dispose();

    phoneController.dispose();

    monthlyPaymentController.dispose();

    membersController.dispose();

    notesController.dispose();

  }

}