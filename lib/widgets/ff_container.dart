// created by Moammed Alimoor
// ameral.java@gmail.com
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/property_json_factory.dart';
import 'package:wid_gen/core/widgets/place_holder.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/properties/alignment_properties.dart';
import 'package:wid_gen/properties/color_properties.dart';
import 'package:wid_gen/properties/edgeinsets_properties.dart';
import 'package:wid_gen/properties/int_properties.dart';
import 'package:wid_gen/wid_gen.dart';

class FFContainer extends WidGen {
  FFContainer({Key? key, required keyID}) : super(key: key, keyID: keyID);

  GlobalKey keyK = GlobalKey();

  @override
  String? get json => genJson();

  @override
  String? get name => "Container";

  @override
  Widget get widgetProperties => Column(
        children: [
          BootstrapPanel(
            header: SelectableText('Style'),
            body: Column(
              children: [
                const Gap(4),
                IntProperties(
                  title: "width",
                  onSubmitted: (value) {
                    Get.find<WidGenController>(tag: keyID)
                        .setProperty("width", value);
                    refreshWidget();
                  },
                  value: controller.getProperty("width"),
                ),
                const Gap(4),
                IntProperties(
                  title: "height",
                  onSubmitted: (value) {
                    Get.find<WidGenController>(tag: keyID)
                        .setProperty("height", value);
                    refreshWidget();
                  },
                  value: controller.getProperty("height"),
                ),
                const Gap(4),
                EdgeInsetsProperties(
                  title: "Padding",
                  current: controller.getProperty("padding"),
                  selected: (value) {
                    Get.find<WidGenController>(tag: keyID)
                        .setProperty("padding", value);
                    refreshWidget();
                  },
                ),
                const Gap(4),
                EdgeInsetsProperties(
                  title: "Margin",
                  current: controller.getProperty("margin"),
                  selected: (value) {
                    Get.find<WidGenController>(tag: keyID)
                        .setProperty("margin", value);
                    refreshWidget();
                  },
                ),
                const Gap(4),
                AlignmentProperties(
                  alignment: controller
                      .getProperty("alignment"), // ??Alignment.center,
                  onSubmitted: (value) {
                    Get.find<WidGenController>(tag: keyID)
                        .setProperty("alignment", value);
                    refreshWidget();
                  },
                )
              ],
            ),
          ),
          BootstrapPanel(
              header: const SelectableText('Decoration'),
              body: Column(children: [
                ColorProperties(
                  currentColor: controller.getProperty("color") ?? Colors.white,
                  selectColor: (c) {
                    Get.find<WidGenController>(tag: keyID)
                        .setProperty("color", c);
                    refreshWidget();
                  },
                ),
                const Gap(4),
                BootstrapPanel(
                    header: SelectableText('Border'),
                    body: Column(
                      children: [
                        ColorProperties(
                          currentColor: controller.getProperty("BorderColor") ??
                              Colors.white,
                          selectColor: (c) {
                            Get.find<WidGenController>(tag: keyID)
                                .setProperty("BorderColor", c);
                            refreshWidget();
                          },
                        ),
                        const Gap(4),
                        IntProperties(
                          title: "Top",
                          onSubmitted: (value) {
                            Get.find<WidGenController>(tag: keyID)
                                .setProperty("BorderTop", value);
                            refreshWidget();
                          },
                          value: controller.getProperty("BorderTop"),
                        ),
                        const Gap(4),
                        IntProperties(
                          title: "Bottom",
                          onSubmitted: (value) {
                            Get.find<WidGenController>(tag: keyID)
                                .setProperty("BorderBottom", value);
                            refreshWidget();
                          },
                          value: controller.getProperty("BorderBottom"),
                        ),
                        const Gap(4),
                        IntProperties(
                          title: "Left",
                          onSubmitted: (value) {
                            Get.find<WidGenController>(tag: keyID)
                                .setProperty("BorderLeft", value);
                            refreshWidget();
                          },
                          value: controller.getProperty("BorderLeft"),
                        ),
                        const Gap(4),
                        IntProperties(
                          title: "Right",
                          onSubmitted: (value) {
                            Get.find<WidGenController>(tag: keyID)
                                .setProperty("BorderRight", value);
                            refreshWidget();
                          },
                          value: controller.getProperty("BorderRight"),
                        ),
                      ],
                    )),
                const Gap(4),

                //               topLeft: Radius.circular(controller.getProperty("BorderTopLeft")),
                // topRight: Radius.circular(controller.getProperty("")),
                // bottomLeft: Radius.circular(controller.getProperty("")),
                // bottomRight: Radius.circular(controller.getProperty("")),
                BootstrapPanel(
                    header: SelectableText('Radius'),
                    body: Column(
                      children: [
                        IntProperties(
                          title: "TopLeft",
                          onSubmitted: (value) {
                            Get.find<WidGenController>(tag: keyID)
                                .setProperty("BorderTopLeft", value);
                            refreshWidget();
                          },
                          value: controller.getProperty("BorderTopLeft"),
                        ),
                        const Gap(4),
                        IntProperties(
                          title: "TopRight",
                          onSubmitted: (value) {
                            Get.find<WidGenController>(tag: keyID)
                                .setProperty("BorderTopRight", value);
                            refreshWidget();
                          },
                          value: controller.getProperty("BorderTopRight"),
                        ),
                        const Gap(4),
                        IntProperties(
                          title: "BottomLeft",
                          onSubmitted: (value) {
                            Get.find<WidGenController>(tag: keyID)
                                .setProperty("BorderBottomLeft", value);
                            refreshWidget();
                          },
                          value: controller.getProperty("BorderBottomLeft"),
                        ),
                        const Gap(4),
                        IntProperties(
                          title: "BottomRight",
                          onSubmitted: (value) {
                            Get.find<WidGenController>(tag: keyID)
                                .setProperty("BorderBottomRight", value);
                            refreshWidget();
                          },
                          value: controller.getProperty("BorderBottomRight"),
                        ),
                      ],
                    ))
              ]))
        ],
      );

  @override
  Widget build(BuildContext context) {
    putController(context);
    return controller.obx(
      (_) => GestureDetector(
        onTap: () => itemClick(),
        child: DragTarget<WidGen>(
          onWillAccept: (v) {
            return controller.getValue<WidGen?>("child") != null ? false : true;
          },
          onAccept: (value) {
            controller.setValue("child", value);
          },
          builder: (_, candidateData, rejectedData) {
            return Container(
              key: keyK,
              alignment:
                  controller.getProperty("alignment"), // ??Alignment.center,
              width: controller.getProperty("width"),
              height: controller.getProperty("height"),
              padding: controller.getProperty("padding"),
              margin: controller.getProperty("margin"),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      controller.getProperty("BorderTopLeft") ?? 0),
                  topRight: Radius.circular(
                      controller.getProperty("BorderTopRight") ?? 0),
                  bottomLeft: Radius.circular(
                      controller.getProperty("BorderBottomLeft") ?? 0),
                  bottomRight: Radius.circular(
                      controller.getProperty("BorderBottomRight") ?? 0),
                ),
                color: controller.getProperty("color"),
                border: Border(
                    right: BorderSide(
                      color: controller.getProperty("BorderColor") ??
                          Colors.transparent,
                      width: controller.getProperty("BorderRight") ?? 0,
                    ),
                    bottom: BorderSide(
                      color: controller.getProperty("BorderColor") ??
                          Colors.transparent,
                      width: controller.getProperty("BorderBottom") ?? 0,
                    ),
                    left: BorderSide(
                      color: controller.getProperty("BorderColor") ??
                          Colors.transparent,
                      width: controller.getProperty("BorderLeft") ?? 0,
                    ),
                    top: BorderSide(
                      color: controller.getProperty("BorderColor") ??
                          Colors.transparent,
                      width: controller.getProperty("BorderTop") ?? 0,
                    )),
              ),
              child: controller.getValue<WidGen?>("child") != null
                  ? controller.getValue<WidGen?>("child")!
                  : DragPlaceholder(),
            );
          },
        ),
      ),
    );
  }
}
