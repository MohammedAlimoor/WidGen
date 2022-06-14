import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/controllers/wid_gen_controller.dart';
import 'package:wid_gen/properties/color_properties.dart';
import 'package:wid_gen/properties/int_properties.dart';
import 'package:wid_gen/properties/string_properties.dart';
import 'package:wid_gen/core/wid_gen.dart';

class FFDivider extends WidGen {
  FFDivider({Key? key, required String keyID}) : super(key: key, keyID: keyID);

  @override
  String? get name => "Divider";

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
              title: "Color",
              currentColor: controller.getProperty("color"),
              selectColor: (c) {
                controller.setProperty("color", c);
                refreshWidget();
              },
            ),
            Gap(4),
            IntProperties(
              title: "height",
              value: controller.getProperty("height"),
              onSubmitted: (c) {
                controller.setProperty("height", c);
                refreshWidget();
              },
            ),
            Gap(4),
            IntProperties(
              title: "thickness",
              value: controller.getProperty("thickness"),
              onSubmitted: (c) {
                controller
                    .setProperty("thickness", c);
                refreshWidget();
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    putController(context);

    return controller.obx((_) => Divider(
          height: controller.getProperty("height"),
          thickness: controller.getProperty("thickness"),
          color: controller.getProperty("color"),
        ));
  }
}
