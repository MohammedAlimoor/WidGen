// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wid_gen/core/widgets/place_holder.dart';
import 'package:wid_gen/properties/bool_properties.dart';
import 'package:wid_gen/properties/color_properties.dart';
import 'package:wid_gen/properties/int_properties.dart';
import 'package:wid_gen/core/wid_gen.dart';


class FFActionBar extends WidGen {
  FFActionBar({Key? key, this.height, required keyID})
      : super(key: key, keyID: keyID);
  @override
  String? get name => "app_bar";
  @override
  String? get json => genJson();

  @override
  Widget get widgetProperties => BootstrapPanel(
        header: const SelectableText('Style'),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ColorProperties(
              title: "Background Color",
              currentColor: controller.getProperty("backgroundColor") ??
                  const Color(0xff443a49),
              selectColor: (c) {
                controller
                    .setProperty("backgroundColor", c);
                refreshWidget();
              },
            ),
            const Gap(4),
            BoolProperties(
              title: "Center Title",
              value: controller.getProperty("centerTitle") ?? false,
              onSubmitted: (c) {
                controller
                    .setProperty("centerTitle", c);
                refreshWidget();
              },
            ),
            const Gap(4),
            IntProperties(
              title: "Elevation",
              value: controller.getProperty("elevation"),
              onSubmitted: (c) {
                controller
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
                    : const DragPlaceholder(
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

                controller.setValue("title", value);
              },
              builder: (_, candidateData, rejectedData) {
                return controller.getValue<Widget?>("title") != null
                    ? controller.getValue<Widget?>("title")!
                    : const DragPlaceholder();
              },
            ),
          ),
        ));
  }
}
