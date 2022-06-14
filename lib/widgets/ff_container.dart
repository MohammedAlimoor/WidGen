// created by Moammed Alimoor
// ameral.java@gmail.com
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/widgets/place_holder.dart';
import 'package:wid_gen/properties/alignment_properties.dart';
import 'package:wid_gen/properties/color_properties.dart';
import 'package:wid_gen/properties/edgeinsets_properties.dart';
import 'package:wid_gen/properties/int_properties.dart';
import 'package:wid_gen/core/wid_gen.dart';

class FFContainer extends WidGen {
  FFContainer({Key? key, required keyID}) : super(key: key, keyID: keyID);

  GlobalKey keyK = GlobalKey();

  @override
  String? get json => genJson();

  @override
  String? get name => "container";

  @override
  Widget get widgetProperties => Column(
        children: [
          BootstrapPanel(
            header: const SelectableText('Style'),
            body: Column(
              children: [
                const Gap(4),
                IntProperties(
                  title: "width",
                  onSubmitted: (value) {
                    controller.setProperty("width", value);
                    refreshWidget();
                  },
                  value: controller.getProperty("width"),
                ),
                const Gap(4),
                IntProperties(
                  title: "height",
                  onSubmitted: (value) {
                    controller.setProperty("height", value);
                    refreshWidget();
                  },
                  value: controller.getProperty("height"),
                ),
                const Gap(4),
                EdgeInsetsProperties(
                  title: "Padding",
                  current: controller.getProperty("padding"),
                  selected: (value) {
                    controller.setProperty("padding", value);
                    refreshWidget();
                  },
                ),
                const Gap(4),
                EdgeInsetsProperties(
                  title: "Margin",
                  current: controller.getProperty("margin"),
                  selected: (value) {
                    controller.setProperty("margin", value);
                    refreshWidget();
                  },
                ),
                const Gap(4),
                AlignmentProperties(
                  alignment: controller
                      .getProperty("alignment"), // ??Alignment.center,
                  onSubmitted: (value) {
                    controller.setProperty("alignment", value);
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
                  currentColor: getDecoration.color,
                  selectColor: (c) {
                    controller.setProperty(
                        "decoration", getDecoration.copyWith(color: c));
                    refreshWidget();
                  },
                ),
                const Gap(4),
                BootstrapPanel(
                    header: const SelectableText('Border'),
                    body: Column(
                      children: [
                        ColorProperties(
                          currentColor: getDecoration.border?.bottom.color ??
                              Colors.white,
                          selectColor: (c) {
                            if (c == null) return;
                            if (getDecoration.border?.top != null) {
                                   var top = (getDecoration.border as Border).top;
                              controller.setProperty(
                                  "decoration",getDecoration.copyWith(border: Border.all(color: c,width: top.width)));
                            } else {
                              controller.setProperty(
                                  "decoration",
                                  getDecoration.copyWith(
                                      border: Border.all(color: c, width: 1)));
                            }

                            refreshWidget();
                          },
                        ),
                        const Gap(4),
                        IntProperties(
                          title: "Border Width",
                          onSubmitted: (c) {
                            if (c == null) return;

                            if (getDecoration.border?.top != null) {
                              var top = (getDecoration.border as Border).top;
                              controller.setProperty(
                                  "decoration",getDecoration.copyWith(border: Border.all(color: top.color,width: c)));
                            } else {
                              controller.setProperty(
                                  "decoration",
                                  getDecoration.copyWith(
                                      border: Border.all(
                                          color: Colors.transparent,
                                          width: c)));
                            }
                            refreshWidget();
                          },
                          value: controller.getProperty("BorderWidth"),
                        ),
                      ],
                    )),
                const Gap(4),
                BootstrapPanel(
                    header: const SelectableText('Radius'),
                    body: Column(
                      children: [
                        IntProperties(
                          title: "TopLeft",
                          onSubmitted: (value) {
                            if (value == null) return;

                            if (getDecoration.borderRadius != null &&
                                getDecoration.borderRadius is BorderRadius) {
                              var dec = getDecoration.copyWith(
                                  borderRadius: (getDecoration.borderRadius
                                          as BorderRadius)
                                      .copyWith(
                                          topLeft: Radius.circular(value)));
                              controller.setProperty("decoration", dec);
                            } else {
                              var dec = getDecoration.copyWith(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(value)));
                              controller.setProperty("decoration", dec);
                            }

                            refreshWidget();
                          },
                          value: (getDecoration.borderRadius as BorderRadius?)
                                  ?.topLeft
                                  .x ??
                              0,
                        ),
                        const Gap(4),
                        IntProperties(
                          title: "TopRight",
                          onSubmitted: (value) {
                            if (value == null) return;

                            if (getDecoration.borderRadius != null &&
                                getDecoration.borderRadius is BorderRadius) {
                              var dec = getDecoration.copyWith(
                                  borderRadius: (getDecoration.borderRadius
                                          as BorderRadius)
                                      .copyWith(
                                          topRight: Radius.circular(value)));
                              controller.setProperty("decoration", dec);
                            } else {
                              var dec = getDecoration.copyWith(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(value)));
                              controller.setProperty("decoration", dec);
                            }
                          },
                          value: (getDecoration.borderRadius as BorderRadius?)
                                  ?.topRight
                                  .x ??
                              0,
                        ),
                        const Gap(4),
                        IntProperties(
                          title: "BottomLeft",
                          onSubmitted: (value) {
                            if (value == null) return;

                            if (getDecoration.borderRadius != null &&
                                getDecoration.borderRadius is BorderRadius) {
                              var dec = getDecoration.copyWith(
                                  borderRadius: (getDecoration.borderRadius
                                          as BorderRadius)
                                      .copyWith(
                                          bottomLeft: Radius.circular(value)));
                              controller.setProperty("decoration", dec);
                            } else {
                              var dec = getDecoration.copyWith(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(value)));
                              controller.setProperty("decoration", dec);
                            }
                          },
                          value: (getDecoration.borderRadius as BorderRadius?)
                                  ?.bottomLeft
                                  .x ??
                              0,
                        ),
                        const Gap(4),
                        IntProperties(
                          title: "BottomRight",
                          onSubmitted: (value) {
                            if (value == null) return;

                            if (getDecoration.borderRadius != null &&
                                getDecoration.borderRadius is BorderRadius) {
                              var dec = getDecoration.copyWith(
                                  borderRadius: (getDecoration.borderRadius
                                          as BorderRadius)
                                      .copyWith(
                                          bottomRight: Radius.circular(value)));
                              controller.setProperty("decoration", dec);
                            } else {
                              var dec = getDecoration.copyWith(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(value)));
                              controller.setProperty("decoration", dec);
                            }
                          },
                          value: (getDecoration.borderRadius as BorderRadius?)
                                  ?.bottomRight
                                  .x ??
                              0,
                        ),
                      ],
                    ))
              ]))
        ],
      );

  BoxDecoration get getDecoration =>
      controller.getProperty<BoxDecoration?>("decoration") ??
      const BoxDecoration();

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

              decoration: getDecoration,
              child: controller.getValue<WidGen?>("child") != null
                  ? controller.getValue<WidGen?>("child")!
                  : const DragPlaceholder(),
            );
          },
        ),
      ),
    );
  }
}
