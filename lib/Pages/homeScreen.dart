import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:flutter/services.dart';
import 'package:uniproject/Widgets/CalculateButton.dart';
import 'package:uniproject/Pages/ResultsPage.dart';
import 'package:uniproject/Widgets/ListViewItem.dart';
import 'package:uniproject/Widgets/MinimumPassGradeDropdown.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  int passmin = 60; //default pass minimum
  final List<Map<String, TextEditingController>> textControllers = [
    {'grade': TextEditingController(), 'weight': TextEditingController()},
  ];

  final String receivedData = 'No data received yet';

  @override
  void dispose() {
    _textController.dispose();
    for (var controller in textControllers) {
      for (var value in controller.values) {
        value.dispose();
      }
    }
    super.dispose();
  }

  void removeitem(int index) {
    setState(() {
      textControllers.removeAt(index);
    });
  }

  void calculateResults() {
 
    for (var controller in textControllers) {
      for (var value in controller.entries) {
        if (value.value.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('All fields must be filled')),
          );
          return;
        }
      }
    }

    int sumofweights = 0;

    for (var controller in textControllers) {
      for (var value in controller.entries) {
        if (value.key == 'weight') {
          sumofweights += int.parse(value.value.text);
        }
      }
    }
    if (sumofweights != 100) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'The weights of the grades must be strictly equal to 100%',
          ),
        ),
      );
      return;
    }
  
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                Resultspage(results: textControllers, passmin: passmin),
      ),
    );
  }

  void changepassmin(int val) {
    setState(() {
      passmin = val;
    });
  }

  void CreateNewController() {
    setState(() {
      textControllers.add({
        'grade': TextEditingController(),
        'weight': TextEditingController(),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Calculator'),
        foregroundColor: Colors.green,
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: 80,
        ),

        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: textControllers.length, // +1 for the button
                itemBuilder: (context, index) {
                  // Regular grade input row
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListViewItem(
                      textControllers: textControllers,
                      index: index,
                      removeitem: removeitem,
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                Calculatebutton(calculateResults: calculateResults),
                const SizedBox(height: 10),
                Text(
                  'Minimum passing grade:',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Minimumpassgradedropdown(
                  passmin: passmin,
                  changepassmin: changepassmin,
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          CreateNewController();
        },
        label: const Text('Add Another Grade'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
