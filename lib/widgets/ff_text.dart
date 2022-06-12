import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/properties/color_properties.dart';
import 'package:wid_gen/properties/int_properties.dart';
import 'package:wid_gen/properties/string_properties.dart';
import 'package:wid_gen/properties/text_align_properties.dart';
import 'package:wid_gen/properties/text_style_properties.dart';
import 'package:wid_gen/properties/text_weight_properties.dart';
import 'package:wid_gen/wid_gen.dart';

class FFText extends WidGen {
  FFText({Key? key, required String keyID, this.text})
      : super(key: key, keyID: keyID);

  @override
  String? get json {
    var code = "";

    var eee = controller.widgetsValues.entries
        .map((val) => '"${val.key}": ${val.value.json} ,')
        .toList();

    code = '''
        {
          "type": "$name",
          "data": "${(controller.getProperty<String?>("text") ?? "")}",
          "maxLines":${(controller.getProperty<double?>("maxLines") ?? 1)}
          "style": {
                "color":"#${(controller.getProperty<Color?>("textColor") ?? Colors.white).value.toRadixString(16)}",
                "fontSize":${(controller.getProperty<double?>("textSize") ?? 15)}
                "fontFamily":"${getStyle.fontFamily}"
              }
        ''';
    eee.forEach((element) {
      code += element + "\n";
    });

    code += " }";

    return code.replaceAll(RegExp(r'\,(?=\s*?[\}\]])'), '');
  }

  String? text;
  @override
  String? get name => "Text";
  @override
  Widget get widgetProperties => Column(
        children: [
          BootstrapPanel(
              header: SelectableText('Data'),
              body: Column(
                children: [
                  StringProperties(
                    onSubmitted: (value) {
                      Get.find<WidGenController>(tag: keyID)
                          .setProperty("text", value);
                      refreshWidget();
                    },
                    currentString: controller.getProperty("text") ?? '',
                  ),
                  Gap(4),
                  IntProperties(
                      title: "Max Lines",
                      onSubmitted: (value) {
                        Get.find<WidGenController>(tag: keyID)
                            .setProperty("maxLines", value);
                        refreshWidget();
                      },
                      value: controller.getProperty("maxLines")),
                ],
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
                TextWeightProperties(
                  value: controller.getProperty("textWeight"),
                  onSubmitted: (c) {
                    Get.find<WidGenController>(tag: keyID)
                        .setProperty("textWeight", c);
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
