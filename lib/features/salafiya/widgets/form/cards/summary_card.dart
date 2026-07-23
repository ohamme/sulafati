import 'package:flutter/material.dart';
import '../../../../../../core/utils/currency_formatter.dart';


class SummaryCard extends StatelessWidget {

  final double monthlyPayment;

  final int members;

  final double totalAmount;

  final DateTime endDate;


  const SummaryCard({
    super.key,
    required this.monthlyPayment,
    required this.members,
    required this.totalAmount,
    required this.endDate,
  });



  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 3,


      shape: RoundedRectangleBorder(

        borderRadius:
            BorderRadius.circular(18),

      ),


      child: Padding(

        padding:
            const EdgeInsets.all(18),


        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,


          children: [


            Row(

              children: const [

                Icon(
                  Icons.calculate,
                  color: Color(0xff0F766E),
                ),


                SizedBox(width: 10),


                Text(

                  "ملخص السلفة",

                  style: TextStyle(

                    fontSize: 18,

                    fontWeight:
                        FontWeight.bold,

                  ),

                ),

              ],

            ),



            const SizedBox(height: 20),



            _SummaryRow(

              title:
                  "الاشتراك الشهري",

              value:
                  "${CurrencyFormatter.format(monthlyPayment)} د.ع",

              icon:
                  Icons.payments,

            ),



            const Divider(),



            _SummaryRow(

              title:
                  "عدد الأعضاء",

              value:
                  "$members شخص",

              icon:
                  Icons.groups,

            ),



            const Divider(),



            _SummaryRow(

              title:
                  "إجمالي مبلغ السلفة",

              value:
                  "${CurrencyFormatter.format(totalAmount)} د.ع",

              icon:
                  Icons.account_balance_wallet,

            ),



            const Divider(),



            _SummaryRow(

              title:
                  "تاريخ النهاية",

              value:
                  "${endDate.year}-${endDate.month}-${endDate.day}",

              icon:
                  Icons.event_available,

            ),


          ],

        ),

      ),

    );

  }

}




class _SummaryRow extends StatelessWidget {


  final String title;

  final String value;

  final IconData icon;



  const _SummaryRow({

    required this.title,

    required this.value,

    required this.icon,

  });



  @override
  Widget build(BuildContext context) {


    return Row(

      children: [


        Icon(

          icon,

          size: 22,

          color:
              Colors.grey.shade700,

        ),


        const SizedBox(width: 12),



        Expanded(

          child: Text(

            title,

            style:
                const TextStyle(

              fontSize: 15,

            ),

          ),

        ),



        Text(

          value,

          style:
              const TextStyle(

            fontWeight:
                FontWeight.bold,

          ),

        ),


      ],

    );

  }

}