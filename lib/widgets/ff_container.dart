import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/wid_gen.dart';

class FFContainer extends WidGen {
  FFContainer({Key? key, this.width, this.color, required keyID})
      : super(key: key, keyID: keyID);

  @override
  String? get json => "";
  @override
  String? get name => "Container";

  @override
  Widget get widgetProperties => Container(
        color: color,
      );

  Color? color;
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    putController(context);
    return GestureDetector(
      onTap: () => itemClick(),
      child: GetBuilder<WidGenController>(
        init: controller,
        initState: (_) {},
        builder: (_) {
          return Container(
            width: width,
            height: height,
            color: color,
            child: DragTarget<Widget>(
              onWillAccept: (v) {
                return controller.getValue<Widget?>("child") != null
                    ? false
                    : true;
              },
              onAccept: (value) {
                controller.setValue("child", value);
              },
              builder: (_, candidateData, rejectedData) {
                return Container(
                  // color: Colors.red,
                  alignment: Alignment.center,
                  child: controller.getValue<Widget?>("child") != null
                      ? controller.getValue<Widget?>("child")!
                      : Placeholder(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
