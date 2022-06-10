import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/properties/color_properties.dart';
import 'package:wid_gen/properties/int_properties.dart';
import 'package:wid_gen/properties/string_properties.dart';
import 'package:wid_gen/properties/text_align_properties.dart';
import 'package:wid_gen/properties/text_style_properties.dart';
import 'package:wid_gen/wid_gen.dart';

class FFText extends WidGen {
  FFText({Key? key, required String keyID, this.text})
      : super(key: key, keyID: keyID);

  @override
  String? get json => "";
  String? text;
  @override
  String? get name => "Text";
  @override
  Widget get widgetProperties => Column(
        children: [
          BootstrapPanel(
              header: SelectableText('Data'),
              body: StringProperties(
                onSubmitted: (value) {
                  Get.find<WidGenController>(tag: keyID)
                      .setProperty("text", value);
                  refreshWidget();
                },
                currentString: controller.getProperty("text") ?? '',
              )),
          BootstrapPanel(
            header: SelectableText('Style'),
            body: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                IntProperties(
                  onSubmitted: (value) {
                    Get.find<WidGenController>(tag: keyID)
                        .setProperty("textSize", value);
                    refreshWidget();
                  },
                  value: controller.getProperty("textSize") ?? 15,
                ),
                SizedBox(
                  height: 10,
                ),
                ColorProperties(
                  currentColor:
                      controller.getProperty("textColor") ?? Color(0xff443a49),
                  selectColor: (c) {
                    Get.find<WidGenController>(tag: keyID)
                        .setProperty("textColor", c);
                    refreshWidget();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextAlignProperties(
                  textAlign: controller.getProperty("textAlign"),
                  onSubmitted: (c) {
                    Get.find<WidGenController>(tag: keyID)
                        .setProperty("textAlign", c);
                    refreshWidget();
                  },
                ),
              ],
            ),
          ),
          TextStyleProperties(
            textStyle: controller.getProperty("StyleGoogleFonts"),
            enableGoogleFonts:
                controller.getProperty("EnableGoogleFonts") ?? false,
            onSubmitted: (c) {
              Get.find<WidGenController>(tag: keyID)
                  .setProperty("StyleGoogleFonts", c);
              refreshWidget();
            },
            onSubmittedEnableGoogleFonts: (enable) {
              if (!enable) {
                Get.find<WidGenController>(tag: keyID)
                    .clearProperty("StyleGoogleFonts");
              }
              Get.find<WidGenController>(tag: keyID)
                  .setProperty("EnableGoogleFonts", enable);
              refreshWidget();
            },
          ),
        ],
      );

  BuildContext? context;

  TextStyle get getStyle =>
      Get.find<WidGenController>(tag: keyID)
          .getProperty<TextStyle?>("StyleGoogleFonts") ??
      const TextStyle();
  @override
  Widget build(BuildContext context) {
    putController(context);

    return GestureDetector(
      onTap: () => itemClick(),
      child: GetBuilder<WidGenController>(
          init: controller,
          initState: (_) {},
          builder: (_) {
            return Text(controller.getProperty("text") ?? "test text",
                textAlign: controller.getProperty("textAlign"),
                style: getStyle.copyWith(
                    color: controller.getProperty("textColor"),
                    fontSize: controller.getProperty("textSize")));
          }),
    );
  }
}
