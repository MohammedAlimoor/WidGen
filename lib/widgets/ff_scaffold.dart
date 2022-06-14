import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:wid_gen/core/widgets/place_holder.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/properties/bool_properties.dart';
import 'package:wid_gen/properties/color_properties.dart';
import 'package:wid_gen/core/wid_gen.dart';
import 'package:wid_gen/widgets/ff_appbar.dart';
import 'package:wid_gen/widgets/ff_container.dart';

class FFScaffold extends WidGen {
  FFScaffold({Key? key, required String keyID}) : super(key: key, keyID: keyID);
  @override
  String? get name => "Scaffold";

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
              title: "Background Color",
              currentColor: controller.getProperty("backgroundColor"),
              selectColor: (c) {
                Get.find<WidGenController>(tag: keyID)
                    .setProperty("backgroundColor", c);
                refreshWidget();
              },
            ),
            Gap(4),
            BoolProperties(
              title: "Show Appbar",
              value: controller.getProperty("showAppbar") ?? true,
              onSubmitted: (c) {
                Get.find<WidGenController>(tag: keyID)
                    .setProperty("showAppbar", c);
                refreshWidget();
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    putController(context);
    return controller.obx((state) => GestureDetector(
        onTap: () => itemClick(),
        child: Scaffold(
          backgroundColor: controller.getProperty("backgroundColor"),
          body: controller.getValue<WidGen?>("body") != null
              ? controller.getValue<WidGen?>("body")!
              : DragTarget<WidGen>(
                  onWillAccept: (v) {
                    return controller.getValue<WidGen?>("body") != null
                        ? false
                        : true;
                  },
                  onAccept: (value) {
                    controller.setValue<WidGen>("body", value);
                  },
                  onLeave: (value) {
                    print("Leave");
                  },
                  builder: (_, candidateData, rejectedData) {
                    return controller.getValue<WidGen?>("body") != null
                        ? controller.getValue<WidGen?>("body")!
                        : DragPlaceholder();
                  },
                ),
          appBar: (controller.getProperty("showAppbar") ?? true)
              ? PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: controller.getValue<WidGen?>("appBar") != null
                      ? controller.getValue<WidGen?>("appBar")!
                      : DragTarget<WidGen>(
                          onWillAccept: (v) {
                            if (v is FFActionBar &&
                                controller.getValue<WidGen?>("appBar") ==
                                    null) {
                              return true;
                            } else {
                              return false;
                            }
                          },
                          onAccept: (value) {
                            controller.setValue<WidGen>("appBar", value);
                          },
                          onLeave: (value) {
                            print("Leave");
                          },
                          builder: (_, candidateData, rejectedData) {
                            return controller.getValue<WidGen?>("appBar") !=
                                    null
                                ? controller.getValue<WidGen?>("appBar")!
                                : DragPlaceholder(
                                    title: "Drag appBar here",
                                  );
                          },
                        ))
              : null,
        )));
  }
}
