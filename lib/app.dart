import 'package:flutter/material.dart';
import 'package:sulafati/features/salafiya/screens/home/home_screen.dart';

class SulafatiApp extends StatelessWidget {
  const SulafatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'سلفتي',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
