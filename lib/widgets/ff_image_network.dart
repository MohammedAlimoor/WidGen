import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wid_gen/properties/box_fit_properties.dart';
import 'package:wid_gen/properties/int_properties.dart';
import 'package:wid_gen/properties/string_properties.dart';
import 'package:wid_gen/core/wid_gen.dart';

class FFImageNetwork extends WidGen {
  FFImageNetwork({Key? key, required keyID}) : super(key: key, keyID: keyID);
  String? get name => "NetworkImage";

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
            StringProperties(
              title: "Src",
              currentString: controller.getProperty("src") ?? defaultUrl,
              onSubmitted: (c) {
                controller.setProperty("src", c);
                refreshWidget();
              },
            ),
            Gap(4),
            BoxFitProperties(
              value: controller.getProperty("fit"),
              onSubmitted: (c) {
             controller.setProperty("fit", c);
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
              title: "width",
              value: controller.getProperty("width"),
              onSubmitted: (c) {
               controller.setProperty("width", c);
                refreshWidget();
              },
            ),
          ],
        ),
      );

  // Widget? widTitle;
  // Widget? widLeading;

  GlobalKey keyK = GlobalKey();

  get defaultUrl =>
      "https://iconape.com/wp-content/files/yb/61798/png/flutter-logo.png";
  @override
  Widget build(BuildContext context) {
    putController(context);
    return controller.obx((_) => GestureDetector(
          onTap: () => itemClick(),
          child: Image.network(
            controller.getProperty("src") ?? defaultUrl,
            fit: controller.getProperty("fit"),
            height: controller.getProperty("height"),
            width: controller.getProperty("width"),
          ),
        ));
  }
}
