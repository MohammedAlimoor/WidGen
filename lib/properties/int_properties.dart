import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/widgets/item_properties.dart';

class IntProperties extends StatelessWidget {
  IntProperties(
      {Key? key,
      required this.onSubmitted,
       this.value,
      this.title = "Size"})
      : super(key: key);

  Function(double?)? onSubmitted;
  double ? value;
  final String title;
  //
  @override
  Widget build(BuildContext context) {
    final TextEditingController? controller =
        TextEditingController(text: value?.toString());

    return ItemProperties(
      title: title,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        onSubmitted: (text) {
          onSubmitted?.call(double.tryParse(text));
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: '...',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
          filled: true,
          fillColor: Colors.white70,
          border: InputBorder.none,
          isDense: true,

        ),
      ),
    );
  }
}
