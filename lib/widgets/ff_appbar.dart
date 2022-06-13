import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:uuid/uuid.dart';
import 'package:wid_gen/core/widgets/place_holder.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/properties/bool_properties.dart';
import 'package:wid_gen/properties/color_properties.dart';
import 'package:wid_gen/properties/cross_axis_alignment_properties.dart';
import 'package:wid_gen/properties/int_properties.dart';
import 'package:wid_gen/wid_gen.dart';

import '../properties/main_axis_alignment_properties.dart';

class FFActionBar extends WidGen {
  FFActionBar({Key? key, this.height, required keyID})
      : super(key: key, keyID: keyID);
  String? get name => "AppBar";
  @override
  String? get json => genJson();

  @override
  Widget get widgetProperties => BootstrapPanel(
        header: SelectableText('Style'),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ColorProperties(
              title: "Background Color",
              currentColor: controller.getProperty("backgroundColor") ??
                  Color(0xff443a49),
              selectColor: (c) {
                Get.find<WidGenController>(tag: keyID)
                    .setProperty("backgroundColor", c);
                refreshWidget();
              },
            ),
            Gap(4),
            BoolProperties(
              title: "Center Title",
              value: controller.getProperty("centerTitle") ?? false,
              onSubmitted: (c) {
                Get.find<WidGenController>(tag: keyID)
                    .setProperty("centerTitle", c);
                refreshWidget();
              },
            ),
            Gap(4),
            IntProperties(
              title: "Elevation",
              value: controller.getProperty("elevation"),
              onSubmitted: (c) {
                Get.find<WidGenController>(tag: keyID)
                    .setProperty("elevation", c);
                refreshWidget();
              },
            ),
          ],
        ),
      );

  // Widget? widTitle;
  // Widget? widLeading;
  double? height;
  @override
  Widget build(BuildContext context) {
    putController(context);
    return controller.obx((_) => GestureDetector(
          onTap: () => itemClick(),
          child: AppBar(
            elevation: controller.getProperty("elevation"),
            centerTitle: controller.getProperty("centerTitle"),
            backgroundColor: controller.getProperty("backgroundColor"),
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
                    : DragPlaceholder(
                        title: "Drag",
                      );
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
                    : DragPlaceholder();
              },
            ),
          ),
        ));
  }
}
