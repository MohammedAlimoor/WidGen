import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/properties/cross_axis_alignment_properties.dart';
import 'package:wid_gen/properties/main_axis_alignment_properties.dart';
import 'package:wid_gen/wid_gen.dart';

class FFRow extends WidGen {
  FFRow({Key? key, required keyID}) : super(key: key, keyID: keyID);

  @override
  String? get json => "";
  @override
  String? get name => "Row";

  @override
  Widget get widgetProperties => BootstrapPanel(
        header: SelectableText('Style'),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            MainAxisAlignmentProperties(
              alignment: controller.getProperty("mainAxisAlignment"),
              onSubmitted: (c) {
                Get.find<WidGenController>(tag: keyID)
                    .setProperty("mainAxisAlignment", c);
                refreshWidget();

                print("Changed mainAxisAlignment to $c");
              },
            ),
            SizedBox(
              height: 10,
            ),
            CrossAxisAlignmentProperties(
              alignment: controller.getProperty("crossAxisAlignment"),
              onSubmitted: (c) {
                Get.find<WidGenController>(tag: keyID)
                    .setProperty("crossAxisAlignment", c);
                refreshWidget();
                print("Changed  crossAxisAlignment  to $c");
              },
            ),
          ],
        ),
      );

  bool get hasChildren =>
      controller.hasValue("children") &&
      controller.getValue<List<Widget>>("children")!.isNotEmpty;
  @override
  Widget build(BuildContext context) {
    putController(context);
    return controller.obx((state) {
      return GestureDetector(
        onTap: () => itemClick(),
        child: GetBuilder<WidGenController>(
          init: controller,
          initState: (_) {},
          builder: (_) {
            return DragTarget<WidGen>(onWillAccept: (v) {
              return true;
            }, onAccept: (it) {
              List<WidGen> list = [];
              if (hasChildren) {
                list = controller.getValue<List<WidGen>?>("children")!;
              }
              list.add(it);
              controller.setValue<List<WidGen>>("children", list);

              refreshWidget();
            }, builder: (_, candidateData, rejectedData) {
              return Row(
                mainAxisAlignment: controller
                        .getProperty<MainAxisAlignment?>('mainAxisAlignment') ??
                    MainAxisAlignment.center,
                crossAxisAlignment: controller.getProperty<CrossAxisAlignment?>(
                        'crossAxisAlignment') ??
                    CrossAxisAlignment.center,
                children: !hasChildren
                    ? [
                        Container(
                          color: Colors.red,
                          child: Text("Add them to $name"),
                        )
                      ]
                    : controller.getValue<List<WidGen>>("children")!,
              );
            });
          },
        ),
      );
    });
  }
}