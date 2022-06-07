import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class ColorProperties extends StatelessWidget {
  ColorProperties(
      {Key? key, required this.selectColor, required this.currentColor})
      : super(key: key);

  final Function(Color) selectColor;
  Color currentColor;

  //
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showColorPicker(context),
      child: Container(
        child: Row(
          children: [
            Text("Color"),
            SizedBox(width: 10),
            Container(
                width: 50,
                height: 25,
                decoration: BoxDecoration(
                  color: currentColor,
                  borderRadius: BorderRadius.circular(5),
                )),
          ],
        ),
      ),
    );
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
