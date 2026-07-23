import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/payment_provider.dart';

import '../widgets/payment_card.dart';
import '../widgets/payment_filter.dart';
import '../widgets/payment_statistics.dart';

import 'payment_form_screen.dart';



class PaymentListScreen extends StatefulWidget {


  final int? salafiyaId;

  final int? memberId;



  const PaymentListScreen({

    super.key,

    this.salafiyaId,

    this.memberId,

  });



  @override
  State<PaymentListScreen> createState() =>
      _PaymentListScreenState();

}





class _PaymentListScreenState
    extends State<PaymentListScreen> {



  final TextEditingController searchController =
      TextEditingController();



  @override
  void initState(){

    super.initState();


    WidgetsBinding.instance
        .addPostFrameCallback((_) async {


      final provider =
          context.read<PaymentProvider>();


      await _load(provider);


    });


  }





  Future<void> _load(
      PaymentProvider provider,
      ) async {



    if(widget.memberId != null){


      await provider.loadMemberPayments(
        widget.memberId!,
      );


    }

    else if(widget.salafiyaId != null){


      await provider.loadSalafiyaPayments(
        widget.salafiyaId!,
      );


    }

    else{


      await provider.loadPayments();


    }

  }





  @override
  void dispose(){

    searchController.dispose();

    super.dispose();

  }






  @override
  Widget build(BuildContext context){


    final provider =
        context.watch<PaymentProvider>();


    final payments =
        provider.filteredPayments;



    return Scaffold(


      appBar: AppBar(

        title:
            const Text(
              "الدفعات",
            ),

        centerTitle:true,

      ),





      floatingActionButton:
          FloatingActionButton.extended(



        icon:
            const Icon(
              Icons.add,
            ),



        label:
            const Text(
              "إضافة دفعة",
            ),



        onPressed: () async {



          if(widget.salafiyaId == null ||
              widget.memberId == null){

            return;

          }



          await Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>
                  PaymentFormScreen(

                salafiyaId:
                    widget.salafiyaId!,


                memberId:
                    widget.memberId!,


              ),

            ),

          );



          if(!mounted) return;


          await _load(provider);


        },

      ),





      body: Column(

        children: [




          FutureBuilder(

            future:
                Future.wait([

              provider.totalPaid(),

              provider.paidCount(),

              provider.pendingCount(),


            ]),



            builder:
                (context,snapshot){



              if(!snapshot.hasData){

                return const SizedBox();

              }



              final data =
                  snapshot.data!;



              return PaymentStatistics(


                totalPaid:
                    data[0] as double,


                paidCount:
                    data[1] as int,


                pendingCount:
                    data[2] as int,


              );



            },

          ),






          Padding(

            padding:
                const EdgeInsets.all(16),



            child: PaymentFilter(


              searchController:
                  searchController,


              selectedFilter:
                  provider.selectedFilter,


              onSearch:
                  provider.search,


              onFilterChanged:
                  provider.setFilter,


            ),

          ),






          Expanded(

            child:


            provider.isLoading


            ? const Center(

                child:
                    CircularProgressIndicator(),

              )



            : payments.isEmpty


            ? const Center(

                child:
                    Text(

                  "لا توجد دفعات",

                  style:
                      TextStyle(

                    fontSize:18,

                  ),

                ),

              )



            : RefreshIndicator(


                onRefresh: () async {

                  await _load(provider);

                },



                child:
                    ListView.builder(



                  padding:
                      const EdgeInsets.all(16),



                  itemCount:
                      payments.length,



                  itemBuilder:
                      (context,index){



                    final payment =
                        payments[index];



                    return PaymentCard(

                      payment:
                          payment,



                      memberName:
                          "عضو رقم ${payment.memberId}",



                      onToggleStatus:
                          () async {



                        if(payment.status ==
                            "مدفوع"){


                          await provider
                              .markAsPending(
                                payment,
                              );


                        }

                        else{


                          await provider
                              .markAsPaid(
                                payment,
                              );


                        }


                      },



                      onDelete:
                          () async {


                        if(payment.id != null){


                          await provider
                              .deletePayment(
                                payment.id!,
                              );


                        }


                      },


                    );


                  },


                ),

              ),


          ),



        ],

      ),



    );


  }



}