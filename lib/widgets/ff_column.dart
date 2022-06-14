// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/controllers/board_controller.dart';
import 'package:wid_gen/core/widgets/place_holder.dart';
import 'package:wid_gen/properties/cross_axis_alignment_properties.dart';
import 'package:wid_gen/properties/main_axis_alignment_properties.dart';
import 'package:wid_gen/core/wid_gen.dart';

class FFColumn extends WidGen {
  FFColumn({Key? key, required keyID}) : super(key: key, keyID: keyID);

  @override
  String? get name => "column";
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
            MainAxisAlignmentProperties(
              alignment: controller.getProperty("mainAxisAlignment"),
              onSubmitted: (c) {
                controller.setProperty("mainAxisAlignment", c);
                refreshWidget();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CrossAxisAlignmentProperties(
              alignment: controller.getProperty("crossAxisAlignment"),
              onSubmitted: (c) {
                controller.setProperty("crossAxisAlignment", c);
                refreshWidget();
              },
            ),
          ],
        ),
      );

  bool get hasChildren =>
      controller.hasValue("children") &&
      controller.getValue<List<Widget>>("children")!.isNotEmpty;

  getChildren() {
    List<Widget> list = [];
    controller.getValue<List<Widget>>("children");

    if (hasChildren) {
      list = controller.getValue<List<Widget>>("children")!;
    }

    // if (controller.isStartDarg.value) {
    //   list.add( DragPlaceholder( title: "add item to $name",color: Colors.blue));
    // }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    putController(context);
    return controller.obx((_) {
      return GestureDetector(
        onTap: () => itemClick(),
        child: DragTarget<WidGen>(onWillAccept: (v) {
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
          return StreamBuilder<bool>(
              stream: dragDropStreamController.stream,
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: controller.getProperty<MainAxisAlignment?>(
                          'mainAxisAlignment') ??
                      MainAxisAlignment.center,
                  crossAxisAlignment:
                      controller.getProperty<CrossAxisAlignment?>(
                              'crossAxisAlignment') ??
                          CrossAxisAlignment.center,
                  children: (!hasChildren|| snapshot.data == true)
                      ? [
                          const DragPlaceholder(color: Colors.black45),
                        ]
                      : getChildren(),
                );
              });
        }),
      );
    });
  }
}
