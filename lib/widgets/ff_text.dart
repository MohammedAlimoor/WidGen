
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/wid_gen.dart';

class FFText extends WidGen {
  FFText({Key? key, required String keyID, this.text})
      : super(key: key, keyID: keyID);

  @override
  String? get json => "";
  String? text;

  @override
  Widget get widgetProperties => Container(
        child: Column(
          children: [
            TextField(onSubmitted: (value) {
              Get.find<WidGenController>(tag: keyID).setProperty("text", value);
              print("updated item");
            
              // (context as Element).markNeedsBuild();
            })
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    putController();

    return GestureDetector(
      onTap: () {
        print("Click");
        itemClick();
      },
      child: GetBuilder<WidGenController>(
          init: controller,
          initState: (_) {},
          builder: (_) {
            return Text(controller.getProperty("text") ??
                "test text ${TimeOfDay.now()}");
          }),
    );
  }
}
