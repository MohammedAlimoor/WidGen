import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/wid_gen.dart';
import 'package:wid_gen/widgets/ff_scaffold.dart';

class BoardController extends GetxController with StateMixin {
  Map<String, WidGen> widTree = {
    "scafold": FFScaffold(keyID: "mainKeyScafold")
  };

  WidGen? selectedWidget;
  setSelectedWidget(WidGen selectedWidget) {
    print("selected widget  ${selectedWidget.keyID}");
    this.selectedWidget = selectedWidget;
    update();
  }

  Widget? get tree => getWidgetTree(widTree["scafold"]!);

  Widget? getWidgetTree(WidGen wid) {
    List<Widget> list = [];

    Get.find<WidGenController>(tag: wid.keyID)
        .widgetsValues
        .forEach((key, value) {
      if (value is WidGen) {
        list.add(Row(
          children: [
            Text(value.name ?? "none"),
            Text(key),
            getWidgetTree(value) ?? Container()
          ],
        ));
      }
    });
    if (list.isEmpty) {
      return Container();
    }
    Column(children: list);
  }

  unSelectedWidget() {
    selectedWidget = null;
    update();
  }
}
