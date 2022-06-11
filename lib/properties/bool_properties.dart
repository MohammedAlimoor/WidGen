import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/widgets/item_properties.dart';

class BoolProperties extends StatelessWidget {
  BoolProperties(
      {Key? key, required this.onSubmitted, this.value, this.title = "Enable"})
      : super(key: key);

  Function(bool?)? onSubmitted;
  bool? value;
  final String title;
  //
  @override
  Widget build(BuildContext context) {
    return ItemProperties(
        title: title,
        child: Checkbox(value: value ?? false, onChanged: onSubmitted));
  }
}
