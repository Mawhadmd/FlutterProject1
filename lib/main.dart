import 'package:flutter/material.dart';
import 'package:uniproject/Pages/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grade Calculator',
      theme: ThemeData(primarySwatch: Colors.blue), // theme color for the app
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

