import 'package:flutter/material.dart';
import 'package:uniproject/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grade Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

