import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';


import 'app.dart';

import 'features/salafiya/providers/salafiya_provider.dart';

import 'features/members/providers/member_provider.dart';

import 'features/payments/providers/payment_provider.dart';





Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();




  // تهيئة التاريخ باللغة العربية

  await initializeDateFormatting(
    'ar',
  );




  runApp(



    MultiProvider(



      providers: [




        ChangeNotifierProvider(

          create: (_) =>
              SalafiyaProvider(),

        ),





        ChangeNotifierProvider(

          create: (_) =>
              MemberProvider(),

        ),






        ChangeNotifierProvider(

          create: (_) =>
              PaymentProvider(),

        ),



      ],




      child:
          const SulafatiApp(),



    ),



  );


}