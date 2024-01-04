import 'package:flutter/material.dart';
import 'package:ihealthapp/common_widgets/navigation.dart';
// import 'package:ihealthapp/features/homePage/home.dart';


// void main() => runApp(const MyApp()); 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iHealth App',
      theme: ThemeData(),
      home: const NavigationPage(), 
    );
  }
}
