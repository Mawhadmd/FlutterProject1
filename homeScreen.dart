import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  List<Map<String, TextEditingController>> _textControllers = [
    {'name': TextEditingController(), 'weight': TextEditingController()},
    {'name': TextEditingController(), 'weight': TextEditingController()},
  ];
  final String _receivedData = 'No data received yet';

  @override
  void dispose() {
    _textController.dispose();
    for (var controller in _textControllers) {
      for (var value in controller.values) {
        value.dispose();
      }
    }
    super.dispose();
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
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _textControllers.length + 1, // +1 for the button
          itemBuilder: (context, index) {
            if (index == _textControllers.length) {
              // Last item is the Calculate button
              return Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      developer.log('Text Controllers: $_textControllers');
                    },
                    child: const Text('Calculate'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              );
            }
            // Regular grade input row
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Text('Grade ${index + 1}'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _textControllers[index]['name'],
                      style: const TextStyle(color: Colors.green),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          final number = int.tryParse(value);
                          if (number != null && number > 100) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Grade cannot be greater than 100',
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                            _textControllers[index]['name']?.clear();
                          }
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Enter Grade',
                        hintText: '0-100',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _textControllers[index]['weight'],
                      style: const TextStyle(color: Colors.green),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          final number = int.tryParse(value);
                          if (number != null && number > 100) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Percentage cannot be greater than 100',
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                            _textControllers[index]['weight']?.clear();
                          }
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Enter Percentage',
                        hintText: '0-100',

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _textControllers.add({
              'name': TextEditingController(),
              'weight': TextEditingController(),
            });
          });
        },
        label: const Text('Add Another Grade'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
