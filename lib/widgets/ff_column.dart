import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/properties/cross_axis_alignment_properties.dart';
import 'package:wid_gen/properties/main_axis_alignment_properties.dart';
import 'package:wid_gen/wid_gen.dart';

class FFColumn extends WidGen {
  FFColumn({Key? key, required keyID}) : super(key: key, keyID: keyID);

  @override
  String? get json => "";
  @override
  String? get name => "Column";

  @override
  Widget get widgetProperties => Container(
        child: Column(
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
              },
            ),
          ],
        ),
      );

  // List<WidGen> widgetsList = [];

  bool get hasChildren =>
      controller.hasValue("children") &&
      controller.getValue<List<Widget>>("children")!.isNotEmpty;
  @override
  Widget build(BuildContext context) {
    putController(context);
    return GestureDetector(
      onTap: () => itemClick(),
      child: GetBuilder<WidGenController>(
        init: controller,
        initState: (_) {},
        builder: (_) {
          return DragTarget<WidGen>(onWillAccept: (v) {
            return true;
          }, onAccept: (it) {
            List<Widget> list = [];
            if (hasChildren) {
              list = controller.getValue<List<Widget>?>("children")!;
            }
            list.add(it);
            controller.setValue("children", list);

            refreshWidget();
          }, builder: (_, candidateData, rejectedData) {
            return Column(
              mainAxisAlignment: controller.getValue('mainAxisAlignment') ??
                  MainAxisAlignment.start,
              crossAxisAlignment: controller.getValue('crossAxisAlignment') ??
                  CrossAxisAlignment.center,
              // mainAxisSize: widget.mainAxisSize,
              // verticalDirection: widget.verticalDirection,
              // textBaseline: widget.textBaseline,
              children: !hasChildren
                  ? [
                      Container(
                        width: double.infinity,
                        color: Colors.red,
                        // height: 10,
                        child: Text("Add them to $name"),
                      )
                    ]
                  : controller.getValue<List<Widget>>("children")!,
            );
            // return active
            //     ? widget.replacementActive
            //     : widget.replacementInactive;
          });
        },
      ),
    );
  }
}
