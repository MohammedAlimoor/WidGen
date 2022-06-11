import 'package:flutter/material.dart';
import 'package:wid_gen/core/widgets/item_properties.dart';

class StringProperties extends StatelessWidget {
  StringProperties(
      {Key? key,
      required this.onSubmitted,
      required this.currentString,
      this.title = "Text"})
      : super(key: key);

  Function(String)? onSubmitted;
  String currentString;
  String title;
  @override
  Widget build(BuildContext context) {
    final TextEditingController? controller =
        new TextEditingController(text: currentString);

    return ItemProperties(
        title: title,
        child: TextField(
          controller: controller,
          autocorrect: true,
          onSubmitted: onSubmitted,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(1),
            isDense: true, // Added this
            border: InputBorder.none, //none

            hintText: 'Type Text Here...',
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
        ));
  }
}
