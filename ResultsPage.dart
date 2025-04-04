import 'package:flutter/material.dart';

class Resultspage extends StatefulWidget {
  const Resultspage({super.key});

  @override
  State<Resultspage> createState() => _ResultspageState();
}

class _ResultspageState extends State<Resultspage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Results Page'),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('Results Page')),
    );
  }
}
