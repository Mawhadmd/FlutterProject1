import 'package:flutter/material.dart';

class Minimumpassgradedropdown extends StatelessWidget {
  const Minimumpassgradedropdown({super.key, required this.passmin, required this.changepassmin});
  final int passmin;
  final void Function(int) changepassmin;

  @override
  Widget build(BuildContext context) {
    return  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButton(
                      padding: EdgeInsets.only(left: 10),
                      value: passmin,
                      items:
                          [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].map((
                            int value,
                          ) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                '$value%',
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                      onChanged: (val) {
                        changepassmin(val!);
                      },
                      style: TextStyle(color: Colors.green),
                    ),
                  );
  }
}