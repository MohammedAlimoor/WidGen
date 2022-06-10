import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/widgets/item_properties.dart';

class IntProperties extends StatelessWidget {
  IntProperties({Key? key, required this.onSubmitted, required this.value})
      : super(key: key);

  Function(double)? onSubmitted;
  double value;
  //
  @override
  Widget build(BuildContext context) {
    final TextEditingController? controller =
        new TextEditingController(text: value.toString());

    return ItemProperties(
      title: "Size",
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        onSubmitted: (text) {
          onSubmitted?.call(double.tryParse(text) ?? 10);
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: 'Type number Here...',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
          filled: true,
          fillColor: Colors.white70,
          border: InputBorder.none,
          isDense: true, // Added this

          // ),
        ),
      ),
    );
  }
}
