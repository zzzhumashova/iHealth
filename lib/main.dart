import 'package:flutter/material.dart';
import 'package:ihealthapp/features/splashPage/first_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstSplashScreen(),
    );
  }
}

