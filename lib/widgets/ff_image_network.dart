import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/properties/box_fit_properties.dart';
import 'package:wid_gen/properties/int_properties.dart';
import 'package:wid_gen/properties/string_properties.dart';
import 'package:wid_gen/wid_gen.dart';

class FFImageNetwork extends WidGen {
  FFImageNetwork({Key? key, this.height, required keyID})
      : super(key: key, keyID: keyID);
  String? get name => "Image.network";
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
            StringProperties(
              title: "Src",
              currentString: controller.getProperty("src") ?? defaultUrl,
              onSubmitted: (c) {
                Get.find<WidGenController>(tag: keyID).setProperty("src", c);
                refreshWidget();
              },
            ),
            Gap(4),
            BoxFitProperties(
              value: controller.getProperty("fit"),
              onSubmitted: (c) {
                Get.find<WidGenController>(tag: keyID).setProperty("fit", c);
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
              title: "width",
              value: controller.getProperty("width"),
              onSubmitted: (c) {
                Get.find<WidGenController>(tag: keyID).setProperty("width", c);
                refreshWidget();
              },
            ),
          ],
        ),
      );

  // Widget? widTitle;
  // Widget? widLeading;
  double? height;

  get defaultUrl =>
      "https://iconape.com/wp-content/files/yb/61798/png/flutter-logo.png";
  @override
  Widget build(BuildContext context) {
    putController(context);
    return GetBuilder<WidGenController>(
        init: controller,
        initState: (_) {},
        builder: (_) {
          return GestureDetector(
            onTap: () => itemClick(),
            child: Image.network(
              controller.getProperty("src") ?? defaultUrl,
              fit: controller.getProperty("fit"),
              height: controller.getProperty("height"),
              width: controller.getProperty("width"),
            ),
          );
        });
  }
}