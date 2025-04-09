import 'package:flutter/material.dart';

void preventOverflow100(
  String value,
  List<Map<String, TextEditingController>> textControllers,
  int index,
  BuildContext context,
  String type, //either grade or weight
) {
  if (value.isNotEmpty) {
    final number = int.tryParse(value);
    if (number != null && number > 100) {
      ScaffoldMessenger.of(context).showSnackBar(
        // Like an error message
        SnackBar(
          content: Text('${type.toUpperCase()} cannot be greater than 100'),
          backgroundColor: Colors.red,
        ),
      );
      textControllers[index][type]?.clear();
    }
  }
}
