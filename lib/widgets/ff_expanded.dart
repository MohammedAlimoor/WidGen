import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/widgets/place_holder.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/properties/color_properties.dart';
import 'package:wid_gen/properties/edgeinsets_properties.dart';
import 'package:wid_gen/properties/int_properties.dart';
import 'package:wid_gen/properties/text_align_properties.dart';
import 'package:wid_gen/wid_gen.dart';

class FFExpanded extends WidGen {
  FFExpanded({Key? key, required keyID}) : super(key: key, keyID: keyID);

  @override
  String? get name => "Expanded";

  @override
  String? get json => genJson();

  @override
  Widget get widgetProperties => Column(
        children: [
          BootstrapPanel(
            header: SelectableText('Style'),
            body: Column(
              children: [
                const Gap(4),
                IntProperties(
                  title: "flex",
                  onSubmitted: (value) {
                    Get.find<WidGenController>(tag: keyID)
                        .setProperty("flex", value);
                    refreshWidget();
                  },
                  value: controller.getProperty("flex"),
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    putController(context);
    return controller.obx((_) => Expanded(
          flex: int.tryParse(controller.getProperty("flex").toString()) ?? 1,
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
              return GestureDetector(
                onTap: () => itemClick(),
                child: controller.getValue<WidGen?>("child") != null
                    ? controller.getValue<WidGen?>("child")!
                    : DragPlaceholder(),
              );
            },
          ),
        ));
  }
}
