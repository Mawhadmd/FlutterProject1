import 'package:flutter/material.dart';
import 'package:uniproject/Widgets/gradeinput.dart';
import 'package:uniproject/Widgets/weightinput.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.textControllers,
    required this.index,
    required this.removeitem,
  });
  final List<Map<String, TextEditingController>> textControllers;
  final int index;
  final void Function(int) removeitem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Grade ${index + 1}',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (textControllers.length > 1)
              IconButton(
                color: Colors.red,
                onPressed: () {
                  removeitem(index);
                },
                icon: Icon(
                  Icons.remove_circle_outline_rounded,
                  color: Colors.red,
                ),
              ),
          ],
        ),
        Row(
          children: [
            const SizedBox(width: 10),
            Gradeinput(textControllers: textControllers, index: index),
            const SizedBox(width: 10),
            Weightinput(textControllers: textControllers, index: index),
          ],
        ),
      ],
    );
  }
}
