import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../salafiya/providers/salafiya_provider.dart';

import '../widgets/create_salafiya_button.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/quick_actions_section.dart';
import '../widgets/salafiya_card.dart';
import '../widgets/statistics_section.dart';



class HomeScreen extends StatefulWidget {

  const HomeScreen({
    super.key,
  });



  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();

}





class _HomeScreenState
    extends State<HomeScreen> {



  @override
  void initState() {

    super.initState();



    WidgetsBinding.instance
        .addPostFrameCallback((_) {


      if(!mounted) return;



      context
          .read<SalafiyaProvider>()
          .loadSalafiyat();



    });


  }





  @override
  Widget build(BuildContext context) {



    final provider =
        context.watch<SalafiyaProvider>();




    return Scaffold(



      appBar:
          AppBar(



        title:
            const Text(
              "سلفتي",
            ),



        centerTitle:
            true,



        elevation:
            0,



      ),





      floatingActionButton:
          const CreateSalafiyaButton(),





      body:
          RefreshIndicator(



        onRefresh: () async {



          await provider
              .loadSalafiyat();



        },



        child:
            ListView(



          padding:
              const EdgeInsets.all(20),




          children: [





            const DashboardHeader(),




            const SizedBox(
              height:25,
            ),





            const StatisticsSection(),




            const SizedBox(
              height:25,
            ),





            const QuickActionsSection(),




            const SizedBox(
              height:30,
            ),





            Row(



              children: [



                const Icon(
                  Icons.account_balance_wallet_outlined,
                ),



                const SizedBox(
                  width:8,
                ),



                Text(



                  "السلف",



                  style:
                      Theme.of(context)
                          .textTheme
                          .titleLarge,



                ),




                const Spacer(),





                Text(



                  provider
                      .salafiyat
                      .length
                      .toString(),



                  style:
                      Theme.of(context)
                          .textTheme
                          .titleMedium,



                ),



              ],



            ),





            const SizedBox(
              height:15,
            ),






            if(provider.salafiyat.isEmpty)



              Card(



                elevation:
                    0,



                shape:
                    RoundedRectangleBorder(

                  borderRadius:
                      BorderRadius.circular(18),

                ),




                child:
                    const Padding(



                  padding:
                      EdgeInsets.symmetric(

                    vertical:50,

                    horizontal:20,

                  ),




                  child:
                      Column(



                    children: [




                      Icon(

                        Icons.inbox_outlined,

                        size:70,

                        color:
                            Colors.grey,

                      ),





                      SizedBox(
                        height:15,
                      ),




                      Text(



                        "لا توجد سلفيات حتى الآن",



                        style:
                            TextStyle(

                          fontSize:18,

                          fontWeight:
                              FontWeight.bold,

                        ),



                      ),






                      SizedBox(
                        height:8,
                      ),






                      Text(



                        "اضغط على زر (+) لإضافة أول سلفة.",



                        textAlign:
                            TextAlign.center,



                      ),




                    ],



                  ),



                ),



              ),








            if(provider.salafiyat.isNotEmpty)



              ...provider.salafiyat.map(



                (salafiya) => Padding(



                  padding:
                      const EdgeInsets.only(
                        bottom:15,
                      ),




                  child:
                      SalafiyaCard(



                    salafiya:
                        salafiya,



                  ),




                ),



              ),






            const SizedBox(
              height:100,
            ),



          ],



        ),



      ),



    );


  }



}