import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/payment.dart';
import '../providers/payment_provider.dart';



class PaymentFormScreen extends StatefulWidget {


  final int salafiyaId;

  final int memberId;



  const PaymentFormScreen({

    super.key,

    required this.salafiyaId,

    required this.memberId,

  });



  @override
  State<PaymentFormScreen> createState() =>
      _PaymentFormScreenState();

}




class _PaymentFormScreenState
    extends State<PaymentFormScreen> {



  final _formKey =
      GlobalKey<FormState>();


  final installmentController =
      TextEditingController();



  final amountController =
      TextEditingController();



  final notesController =
      TextEditingController();




  DateTime dueDate =
      DateTime.now();



  DateTime? paymentDate;



  String status =
      "غير مدفوع";



  bool loading = false;





  @override
  void dispose(){

    installmentController.dispose();

    amountController.dispose();

    notesController.dispose();

    super.dispose();

  }







  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar:
          AppBar(

        title:
            const Text(
              "إضافة دفعة",
            ),

        centerTitle:
            true,

      ),




      body:
          Directionality(

        textDirection:
            TextDirection.rtl,


        child:
            Form(

          key:
              _formKey,


          child:
              ListView(

            padding:
                const EdgeInsets.all(
                  20,
                ),



            children: [



              TextFormField(

                controller:
                    installmentController,


                keyboardType:
                    TextInputType.number,


                decoration:
                    const InputDecoration(

                  labelText:
                      "رقم القسط",

                  prefixIcon:
                      Icon(
                        Icons.numbers,
                      ),

                ),



                validator:(value){

                  if(value == null ||
                     value.isEmpty){

                    return
                      "أدخل رقم القسط";

                  }


                  return null;

                },

              ),





              const SizedBox(
                height: 15,
              ),





              TextFormField(

                controller:
                    amountController,


                keyboardType:
                    TextInputType.number,


                decoration:
                    const InputDecoration(

                  labelText:
                      "المبلغ",

                  suffixText:
                      "د.ع",


                  prefixIcon:
                      Icon(
                        Icons.payments,
                      ),

                ),



                validator:(value){

                  if(value == null ||
                     value.isEmpty){

                    return
                      "أدخل المبلغ";

                  }


                  return null;

                },

              ),






              const SizedBox(
                height: 20,
              ),





              _dateTile(

                title:
                    "تاريخ الاستحقاق",

                date:
                    dueDate,


                onTap:
                    () async {


                  final result =
                      await _pickDate(
                        context,
                        dueDate,
                      );


                  if(result != null){

                    setState((){

                      dueDate =
                          result;

                    });

                  }


                },

              ),






              const SizedBox(
                height: 15,
              ),






              DropdownButtonFormField<String>(

                initialValue:
                    status,


                decoration:
                    const InputDecoration(

                  labelText:
                      "حالة الدفع",

                ),



                items:
                    const [


                  DropdownMenuItem(

                    value:
                        "مدفوع",

                    child:
                        Text(
                          "مدفوع",
                        ),

                  ),



                  DropdownMenuItem(

                    value:
                        "غير مدفوع",

                    child:
                        Text(
                          "غير مدفوع",
                        ),

                  ),



                ],



                onChanged:(value){

                  if(value == null)
                    return;


                  setState((){

                    status =
                        value;


                    if(status ==
                       "غير مدفوع"){

                      paymentDate =
                          null;

                    }


                  });


                },

              ),






              if(status == "مدفوع")

                _dateTile(

                  title:
                      "تاريخ الدفع",

                  date:
                      paymentDate,


                  onTap:
                      () async {


                    final result =
                        await _pickDate(

                      context,

                      paymentDate ??
                          DateTime.now(),

                    );



                    if(result != null){

                      setState((){

                        paymentDate =
                            result;

                      });

                    }


                  },

                ),






              const SizedBox(
                height: 15,
              ),






              TextFormField(

                controller:
                    notesController,


                maxLines:
                    3,


                decoration:
                    const InputDecoration(

                  labelText:
                      "ملاحظات",

                  prefixIcon:
                      Icon(
                        Icons.notes,
                      ),

                ),

              ),






              const SizedBox(
                height: 30,
              ),






              FilledButton.icon(

                icon:
                    const Icon(
                      Icons.save,
                    ),



                label:
                    const Text(
                      "حفظ الدفعة",
                    ),




                onPressed:
                    loading
                        ? null
                        : _save,

              ),




            ],

          ),

        ),

      ),

    );


  }








  Future<DateTime?> _pickDate(

      BuildContext context,

      DateTime initial,

      ) async {


    return await showDatePicker(

      context:
          context,


      initialDate:
          initial,


      firstDate:
          DateTime(2020),


      lastDate:
          DateTime(2100),

    );


  }









  Widget _dateTile({

    required String title,

    required DateTime? date,

    required VoidCallback onTap,

  }){


    return ListTile(

      onTap:
          onTap,


      leading:
          const Icon(
            Icons.calendar_month,
          ),


      title:
          Text(title),



      subtitle:
          Text(

        date == null

            ? "اختيار التاريخ"

            : "${date.year}-${date.month}-${date.day}",

      ),


    );


  }









  Future<void> _save() async {


    if(!_formKey.currentState!
        .validate()){

      return;

    }



    setState((){

      loading =
          true;

    });




    final now =
        DateTime.now()
            .toIso8601String();





    final payment =
        Payment(


      salafiyaId:
          widget.salafiyaId,



      memberId:
          widget.memberId,



      installmentNumber:
          int.parse(
            installmentController.text,
          ),



      amount:
          double.parse(
            amountController.text,
          ),



      dueDate:
          dueDate.toIso8601String(),



      paymentDate:
          paymentDate
              ?.toIso8601String()
              ??
              "",



      status:
          status,



      notes:
          notesController.text.trim(),



      createdAt:
          now,



      updatedAt:
          now,

    );





    await context
        .read<PaymentProvider>()
        .addPayment(payment);





    if(!mounted)
      return;



    Navigator.pop(context);

  }



}