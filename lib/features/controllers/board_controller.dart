import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/wid_gen.dart';
import 'package:wid_gen/widgets/ff_scaffold.dart';

class BoardController extends GetxController with StateMixin {
  var widTree = {"scafold": FFScaffold(keyID: "mainKeyScafold")}.obs;

  WidGen? selectedWidget;
  setSelectedWidget(WidGen selectedWidget) {
    print("selected widget  ${selectedWidget.keyID}");
    this.selectedWidget = selectedWidget;
    update();
  }

  Widget? get tree => getWidgetTree(widTree["scafold"]!);

  Widget? getWidgetTree(WidGen wid) {
    List<Widget> list = [];

    var reg = Get.isRegistered<WidGenController>(tag: wid.keyID);
    print("Controller is $reg  ${wid.keyID} ");
    print("tree k ${wid.name}");

    if (reg) {
      wid.controller.widgetsValues.forEach((key, value) {
        if (value is WidGen) {
          print("tree ${value.name!}");
          list.add(Row(
            children: [
              Text(value.name! + "dddd"),
              // Text(key),
              getWidgetTree(value) ?? Container()
            ],
          ));
        } else {
          print("tree k ${key}");
        }
      });
    }

    if (list.isEmpty) {
      return Container(
        child: Text("none"),
      );
    }
    Column(children: list);
  }

  unSelectedWidget() {
    selectedWidget = null;
    update();
  }
}
