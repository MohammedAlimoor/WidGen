import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/properties/color_properties.dart';
import 'package:wid_gen/properties/int_properties.dart';
import 'package:wid_gen/properties/string_properties.dart';
import 'package:wid_gen/wid_gen.dart';

class FFDivider extends WidGen {
  FFDivider({Key? key, required String keyID}) : super(key: key, keyID: keyID);

  @override
  String? get name => "Divider";

  @override
  String? get json => "";

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
              currentColor: controller.getProperty("color") ,
              selectColor: (c) {
                Get.find<WidGenController>(tag: keyID).setProperty("color", c);
                refreshWidget();
              },
            ),
      
            Gap(4),
            IntProperties(
              title: "height",
              value: controller.getProperty("height"),
              onSubmitted: (c) {
                Get.find<WidGenController>(tag: keyID).setProperty("height", c);
                refreshWidget();
              },
            ),
            Gap(4),
            IntProperties(
              title: "thickness",
              value: controller.getProperty("thickness"),
              onSubmitted: (c) {
                Get.find<WidGenController>(tag: keyID).setProperty("thickness", c);
                refreshWidget();
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    putController(context);

    return  Divider(height: controller.getProperty("height"),thickness:controller.getProperty("thickness") , color: controller.getProperty("color") ,);
  }
}
