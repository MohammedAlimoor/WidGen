// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/widgets/item_properties.dart';

class ColorProperties extends StatelessWidget {
  ColorProperties(
      {Key? key, required this.selectColor,  this.currentColor,this.title = "Color"})
      : super(key: key);

  final Function(Color ?) selectColor;
  Color ?currentColor;
  String title;
  //
  @override
  Widget build(BuildContext context) {
    return ItemProperties(
        title: title,
        child: GestureDetector(
            onTap: () => showColorPicker(context),
            child: Container(
                // width: 50,
                // height: 20,
                decoration: BoxDecoration(
              color: currentColor,
              borderRadius: BorderRadius.circular(5),
            ))));
  }

  showColorPicker(BuildContext context) {
    Get.defaultDialog(
      content: ColorPicker(
        pickerColor: currentColor  ?? Colors.white,
        onColorChanged: (color) {
          currentColor = color;
        },
      ),
      title: "Select Color",
      // confirmTextColor: Text("Select"),
      // cancel: ,
      textCancel: "Cancel",
      onConfirm: () {
        selectColor(currentColor);
        Get.back();
      },
      backgroundColor: Colors.white,
    );
  }
}
