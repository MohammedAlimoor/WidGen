// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wid_gen/properties/box_fit_properties.dart';
import 'package:wid_gen/properties/int_properties.dart';
import 'package:wid_gen/properties/string_properties.dart';
import 'package:wid_gen/core/wid_gen.dart';

class FFSVGNetwork extends WidGen {
  FFSVGNetwork({Key? key, required keyID}) : super(key: key, keyID: keyID);
  @override
  String? get name => "svg";

  @override
  String? get json => genJson();

  @override
  Widget get widgetProperties => BootstrapPanel(
        header: const SelectableText('Style'),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            StringProperties(
              title: "Url",
              currentString: controller.getProperty("url") ?? defaultUrl,
              onSubmitted: (c) {
                controller.setProperty("url", c);
                refreshWidget();
              },
            ),
            const Gap(4),
            BoxFitProperties(
              value: controller.getProperty("fit"),
              onSubmitted: (c) {
                controller.setProperty("fit", c);
                refreshWidget();
              },
            ),
            const Gap(4),
            IntProperties(
              title: "height",
              value: controller.getProperty("height"),
              onSubmitted: (c) {
                controller.setProperty("height", c);
                refreshWidget();
              },
            ),
            const Gap(4),
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
      "https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/google.svg";
  @override
  Widget build(BuildContext context) {
    putController(context);
        if (!controller.hasValue("url")) controller.setProperty("url", defaultUrl);

    return controller.obx((_) => GestureDetector(
          onTap: () => itemClick(),
          child: SvgPicture.network(
            controller.getProperty("url") ?? defaultUrl,
            fit: controller.getProperty("fit") ?? BoxFit.contain,
            height: controller.getProperty("height"),
            width: controller.getProperty("width"),
          ),
        ));
  }
}
