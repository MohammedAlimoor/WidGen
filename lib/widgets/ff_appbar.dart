import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:uuid/uuid.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/wid_gen.dart';

class FFActionBar extends WidGen {
  FFActionBar({Key? key, this.height, required keyID})
      : super(key: key, keyID: keyID);
  String? get name => "ActionBar";
  @override
  String? get json => "";

  @override
  AppBar get widgetProperties => AppBar(
      // leading: widLeading,
      // title: widTitle,
      );

  // Widget? widTitle;
  // Widget? widLeading;
  double? height;
  @override
  Widget build(BuildContext context) {
    putController(context);
    return GetBuilder<WidGenController>(
        init: controller,
        initState: (_) {},
        builder: (_) {
          return AppBar(
            leading: DragTarget<Widget>(
              onWillAccept: (v) {
                return controller.getValue<Widget?>("leading") != null
                    ? false
                    : true;
              },
              onAccept: (value) {
                controller.setValue("leading", value);
              },
              builder: (_, candidateData, rejectedData) {
                return controller.getValue<Widget?>("leading") != null
                    ? controller.getValue<Widget?>("leading")!
                    : Placeholder();
              },
            ),
            title: DragTarget<Widget>(
              onWillAccept: (v) {
                return controller.getValue<Widget?>("title") != null
                    ? false
                    : true;
              },
              onAccept: (value) {
                print("title accept");

                controller.setValue("title", value);
              },
              builder: (_, candidateData, rejectedData) {
                return controller.getValue<Widget?>("title") != null
                    ? controller.getValue<Widget?>("title")!
                    : Placeholder();
              },
            ),
          );
        });
  }
}
