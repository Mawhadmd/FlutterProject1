import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uniproject/utils/PreventOverflow100.dart';

class Weightinput extends StatelessWidget {
  const Weightinput({super.key, required this.textControllers, required this.index});
  final List<Map<String, TextEditingController>> textControllers;
  final int index;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
                        child: TextField(
                          controller: textControllers[index]['weight'],
                          style: const TextStyle(color: Colors.green),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            preventOverflow100(value, textControllers, index, context, 'weight');
                          },
                          decoration: const InputDecoration(
                            labelText: 'Enter Percentage',
                            hintText: '0-100',

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      );
  }
}