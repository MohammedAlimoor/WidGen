// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/widgets/place_holder.dart';
import 'package:wid_gen/properties/edgeinsets_properties.dart';
import 'package:wid_gen/core/wid_gen.dart';

class FFSingleChildScrollView extends WidGen {
  FFSingleChildScrollView({Key? key, required keyID})
      : super(key: key, keyID: keyID);

  @override
  String? get name => "single_child_scroll_view";

  @override
  String? get json => genJson();

  @override
  Widget get widgetProperties => Column(
        children: [
          BootstrapPanel(
            header: const SelectableText('Style'),
            body: Column(
              children: [
                const Gap(4),
                EdgeInsetsProperties(
                  title: "Padding",
                  current: controller.getProperty("padding"),
                  selected: (value) {
                    controller.setProperty("padding", value);
                    refreshWidget();
                  },
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    putController(context);
    return controller.obx((_) => GestureDetector(
        onTap: () => itemClick(),
        child: SingleChildScrollView(
          padding: controller.getProperty("padding"),
          child: DragTarget<WidGen>(
            onWillAccept: (v) {
              return controller.getValue<WidGen?>("child") != null
                  ? false
                  : true;
            },
            onAccept: (value) {
              controller.setValue("child", value);
            },
            builder: (_, candidateData, rejectedData) {
              return controller.getValue<WidGen?>("child") != null
                  ? controller.getValue<WidGen?>("child")!
                  : const DragPlaceholder();
            },
          ),
        )));
  }
}
