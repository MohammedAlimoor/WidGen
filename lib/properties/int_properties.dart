import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class IntProperties extends StatelessWidget {
  IntProperties(
      {Key? key, required this.onSubmitted, required this.currentString})
      : super(key: key);

  Function(double)? onSubmitted;
  double currentString;
  //
  @override
  Widget build(BuildContext context) {
    final TextEditingController? controller =
        new TextEditingController(text: currentString.toString());

    return Container(
        child: Row(
      children: [
        Text("Size"),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
            autocorrect: true,
            keyboardType: TextInputType.number,
            onSubmitted: (text) {
              onSubmitted?.call(double.tryParse(text) ?? 10);
            },
            decoration: const InputDecoration(
              hintText: 'Type number Here...',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white70,
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(12.0)),
              //   borderSide: BorderSide(color: Colors.grey, width: 1),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //   borderSide: BorderSide(color: Colors.grey),
              // ),
            ),
          ),
        )
      ],
    ));
  }
}
