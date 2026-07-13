import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';

class SulafatiApp extends StatelessWidget {
  const SulafatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'سلفتي',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}