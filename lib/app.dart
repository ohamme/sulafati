import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/theme/app_theme.dart';
import 'features/splash/screens/splash_screen.dart';



class SulafatiApp extends StatelessWidget {


  const SulafatiApp({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


    return MaterialApp(



      title: "سلفتي",



      debugShowCheckedModeBanner: false,



      theme:
          AppTheme.light,



      darkTheme:
          AppTheme.dark,



      themeMode:
          ThemeMode.system,





      // اللغة الافتراضية

      locale:
          const Locale('ar'),





      // اللغات المدعومة

      supportedLocales: const [


        Locale('ar'),


        Locale('en'),


      ],






      // دعم Material بالعربي

      localizationsDelegates: const [


        GlobalMaterialLocalizations.delegate,


        GlobalWidgetsLocalizations.delegate,


        GlobalCupertinoLocalizations.delegate,


      ],






      // اتجاه التطبيق

      builder:
          (context, child){



        return Directionality(


          textDirection:
              TextDirection.rtl,


          child:
              child!,


        );


      },






      home:
          const SplashScreen(),



    );


  }


}