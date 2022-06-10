import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/widgets/item_properties.dart';

class ColorProperties extends StatelessWidget {
  ColorProperties(
      {Key? key, required this.selectColor, required this.currentColor})
      : super(key: key);

  final Function(Color) selectColor;
  Color currentColor;

  //
  @override
  Widget build(BuildContext context) {
    return ItemProperties(
        title: "Color",
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
        pickerColor: currentColor,
        onColorChanged: (color) {
          currentColor = color;
        },
      ),
      title: "Select Color",
      // confirmTextColor: Text("Select"),
      // cancel: ,
      textCancel: "Cancel",
      onConfirm: () {
        print("Confirm");
        selectColor(currentColor);
        Get.back();
      },
      backgroundColor: Colors.white,
    );
  }
}
