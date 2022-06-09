import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/properties/color_properties.dart';
import 'package:wid_gen/properties/int_properties.dart';
import 'package:wid_gen/properties/string_properties.dart';
import 'package:wid_gen/properties/text_align_properties.dart';
import 'package:wid_gen/wid_gen.dart';

class FFText extends WidGen {
  FFText({Key? key, required String keyID, this.text})
      : super(key: key, keyID: keyID);

  @override
  String? get json => "";
  String? text;
  @override
  // TODO: implement name
  String? get name => "Text";
  @override
  Widget get widgetProperties => Container(
        child: Column(
          children: [
            StringProperties(
              onSubmitted: (value) {
                Get.find<WidGenController>(tag: keyID)
                    .setProperty("text", value);
                refreshWidget();
              },
              currentString: controller.getProperty("text") ?? '',
            ),
            SizedBox(
              height: 10,
            ),
            IntProperties(
              onSubmitted: (value) {
                Get.find<WidGenController>(tag: keyID)
                    .setProperty("textSize", value);
                refreshWidget();
              },
              currentString: controller.getProperty("textSize") ?? 10,
            ),
            SizedBox(
              height: 10,
            ),
            ColorProperties(
              currentColor:
                  controller.getProperty("textColor") ?? Color(0xff443a49),
              selectColor: (c) {
                Get.find<WidGenController>(tag: keyID)
                    .setProperty("textColor", c);
                refreshWidget();
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextAlignProperties(
              textAlign:
                  controller.getProperty("textAlign") ,
              onSubmitted: (c) {
                Get.find<WidGenController>(tag: keyID)
                    .setProperty("textAlign", c);
                refreshWidget();
              },
            ),
          ],
        ),
      );

  BuildContext? context;

  @override
  Widget build(BuildContext context) {
    putController(context);

    return GestureDetector(
      onTap: () {
        print("Click");
        itemClick();
      },
      child: GetBuilder<WidGenController>(
          init: controller,
          initState: (_) {},
          builder: (_) {
            return Text(
              controller.getProperty("text") ?? "test text ${TimeOfDay.now()}",
              textAlign: controller.getProperty("textAlign"),
              style: TextStyle(

                  color: controller.getProperty("textColor"),
                  fontSize: controller.getProperty("textSize")),
            );
          }),
    );
  }
  

}
