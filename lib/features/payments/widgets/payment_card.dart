import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/payment.dart';



class PaymentCard extends StatelessWidget {


  final Payment payment;


  final String memberName;


  final VoidCallback? onEdit;


  final VoidCallback? onDelete;


  final VoidCallback? onToggleStatus;



  const PaymentCard({

    super.key,

    required this.payment,

    required this.memberName,

    this.onEdit,

    this.onDelete,

    this.onToggleStatus,

  });






  @override
  Widget build(BuildContext context) {



    final formatter =
        NumberFormat("#,###");



    final bool paid =
        payment.status == "مدفوع";



    return Card(



      elevation: 3,



      margin:
          const EdgeInsets.only(
            bottom:14,
          ),



      shape:
          RoundedRectangleBorder(

        borderRadius:
            BorderRadius.circular(18),

      ),



      child:
          Padding(

        padding:
            const EdgeInsets.all(16),



        child:
            Column(

          children: [





            Row(


              children: [



                CircleAvatar(


                  radius:26,


                  backgroundColor:
                      paid

                      ? Colors.green

                      : Colors.orange,



                  child:
                      Icon(

                    paid

                    ? Icons.check

                    : Icons.schedule,



                    color:
                        Colors.white,

                  ),


                ),




                const SizedBox(
                  width:14,
                ),





                Expanded(


                  child:
                      Column(


                    crossAxisAlignment:
                        CrossAxisAlignment.start,



                    children: [



                      Text(


                        memberName,



                        style:
                            const TextStyle(

                          fontSize:17,

                          fontWeight:
                              FontWeight.bold,

                        ),


                      ),





                      const SizedBox(
                        height:5,
                      ),





                      Text(

                        "القسط رقم ${payment.installmentNumber}",



                        style:
                            TextStyle(

                          color:
                              Colors.grey.shade600,

                        ),

                      ),



                    ],


                  ),


                ),





                PopupMenuButton<String>(


                  onSelected:
                      (value){



                    switch(value){



                      case "edit":

                        onEdit?.call();

                        break;



                      case "delete":

                        onDelete?.call();

                        break;



                      case "status":

                        onToggleStatus?.call();

                        break;


                    }



                  },



                  itemBuilder:
                      (_) => [



                    const PopupMenuItem(

                      value:"edit",

                      child:
                          Text(
                            "تعديل",
                          ),

                    ),





                    const PopupMenuItem(

                      value:"status",

                      child:
                          Text(
                            "تغيير الحالة",
                          ),

                    ),





                    const PopupMenuItem(

                      value:"delete",

                      child:
                          Text(
                            "حذف",
                          ),

                    ),


                  ],


                ),


              ],



            ),





            const Divider(
              height:30,
            ),






            Row(


              children: [



                const Icon(
                  Icons.payments,
                ),



                const SizedBox(
                  width:10,
                ),



                Text(



                  "${formatter.format(payment.amount)} د.ع",



                  style:
                      const TextStyle(

                    fontSize:17,

                    fontWeight:
                        FontWeight.bold,

                  ),


                ),


              ],



            ),






            const SizedBox(
              height:12,
            ),






            Row(


              children: [



                const Icon(

                  Icons.calendar_today,

                  size:18,

                ),



                const SizedBox(
                  width:8,
                ),




                Expanded(

                  child:
                      Text(

                    "الاستحقاق : ${_formatDate(payment.dueDate)}",



                  ),

                ),


              ],



            ),







            if(paid)

              Padding(


                padding:
                    const EdgeInsets.only(
                      top:12,
                    ),



                child:
                    Row(


                  children: [



                    const Icon(

                      Icons.event_available,

                      size:18,

                    ),



                    const SizedBox(
                      width:8,
                    ),



                    Expanded(

                      child:
                          Text(

                        "الدفع : ${_formatDate(payment.paymentDate)}",


                      ),

                    ),



                  ],


                ),


              ),







            const SizedBox(
              height:16,
            ),





            Align(


              alignment:
                  Alignment.centerRight,



              child:
                  Chip(



                backgroundColor:
                    paid

                    ? Colors.green.shade100

                    : Colors.orange.shade100,



                label:
                    Text(


                  payment.status,



                  style:
                      TextStyle(


                    color:
                        paid

                        ? Colors.green

                        : Colors.orange,



                    fontWeight:
                        FontWeight.bold,


                  ),


                ),



              ),



            ),



          ],


        ),



      ),


    );


  }





  String _formatDate(String value){


    try{


      return DateFormat(
        "yyyy-MM-dd",
      ).format(
        DateTime.parse(value),
      );


    }catch(e){


      return value;


    }


  }


}