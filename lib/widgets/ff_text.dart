// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wid_gen/properties/color_properties.dart';
import 'package:wid_gen/properties/int_properties.dart';
import 'package:wid_gen/properties/string_properties.dart';
import 'package:wid_gen/properties/text_align_properties.dart';
import 'package:wid_gen/properties/text_style_properties.dart';
import 'package:wid_gen/properties/text_weight_properties.dart';
import 'package:wid_gen/core/wid_gen.dart';

class FFText extends WidGen {
  FFText({Key? key, required String keyID, this.text})
      : super(key: key, keyID: keyID);

  @override
  String? get json => genJson();

  String? text;
  @override
  String? get name => "Text";
  @override
  Widget get widgetProperties => Column(
        children: [
          BootstrapPanel(
              header: const SelectableText('Data'),
              body: Column(
                children: [
                  StringProperties(
                    onSubmitted: (value) {
                      controller
                          .setProperty("text", value);
                      refreshWidget();
                    },
                    currentString: controller.getProperty("text") ?? '',
                  ),
                  const Gap(4),
                  IntProperties(
                      title: "Max Lines",
                      onSubmitted: (value) {
                        controller
                            .setProperty("maxLines", value);
                        refreshWidget();
                      },
                      value: controller.getProperty("maxLines")),
                ],
              )),
          BootstrapPanel(
            header: const SelectableText('Style'),
            body: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                IntProperties(
                  onSubmitted: (value) {
                    controller.setProperty(
                        "style", getStyle.copyWith(fontSize: value));
                    refreshWidget();
                  },
                  value: getStyle.fontSize ?? 15,
                ),
                const SizedBox(
                  height: 10,
                ),
                ColorProperties(
                  currentColor: getStyle.color ?? Colors.black,
                  selectColor: (c) {
                    controller
                        .setProperty("style", getStyle.copyWith(color: c));

                    refreshWidget();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextWeightProperties(
                  value: getStyle.fontWeight ?? FontWeight.normal,
                  onSubmitted: (c) {
                    controller
                        .setProperty("style", getStyle.copyWith(fontWeight: c));

                    refreshWidget();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextAlignProperties(
                  textAlign: controller.getProperty("textAlign"),
                  onSubmitted: (c) {
                    controller
                        .setProperty("textAlign", c);
                    refreshWidget();
                  },
                ),
              ],
            ),
          ),
          TextStyleProperties(
            textStyle: getStyle,
            enableGoogleFonts:
                controller.getProperty("EnableGoogleFonts") ?? false,
            onSubmitted: (c) {
              controller.setProperty(
                  "style",
                  c.copyWith(
                      fontSize: getStyle.fontSize,
                      color: getStyle.color,
                      fontWeight: getStyle.fontWeight));

              refreshWidget();
            },
            onSubmittedEnableGoogleFonts: (enable) {
              controller
                  .setProperty("EnableGoogleFonts", enable);
              refreshWidget();
            },
          ),
        ],
      );

  BuildContext? context;

  TextStyle get getStyle =>
      controller.getProperty<TextStyle?>("style") ??
      const TextStyle();

  @override
  Widget build(BuildContext context) {
    putController(context);

    if (!controller.hasProperty("style")) {
      controller.setProperty("text", "test text");
      controller.setProperty(
          "style",
          const TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400));
    }
    return controller.obx((_) => GestureDetector(
          onTap: () => itemClick(),
          child: Text(controller.getProperty("text") ?? "test text",
              textAlign: controller.getProperty("textAlign"),
              maxLines: controller.getProperty("maxLines"),
              style: getStyle.copyWith(
                  fontWeight: controller.getProperty("textWeight"),
                  color: controller.getProperty("textColor"),
                  fontSize: controller.getProperty("textSize"))),
        ));
  }
}
