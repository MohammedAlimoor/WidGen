import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/wid_gen.dart';
import 'package:wid_gen/widgets/ff_scaffold.dart';
import 'dart:async';

 final StreamController<bool> dragDropStreamController = StreamController<bool>.broadcast();
class BoardController extends GetxController with StateMixin {
  var widTree = {"scafold": FFScaffold(keyID: "mainKeyScafold")}.obs;

  WidGen? selectedWidget;
  setSelectedWidget(WidGen selectedWidget) {
    print("selected widget  ${selectedWidget.keyID}");
    this.selectedWidget = selectedWidget;
    update();
  }

  Widget? get tree => getWidgetTree(widTree["scafold"]!, firstTime: true);

  Widget? getWidgetTree(WidGen wid, {firstTime = false}) {
    List<Widget> list = [];

    if (firstTime) list.add(Text(wid.name!));

    var reg = Get.isRegistered<WidGenController>(tag: wid.keyID);
    if (reg) {
      wid.controller.widgetsValues.forEach((key, value) {
        if (value is WidGen) {
          list.add(
           wrapWithClick(  Text("[$key]" + value.name!),value ),
          );
          list.add(Padding(
            padding: const EdgeInsets.only(left: 10),
            child: getWidgetTree(value) ?? Container(),
          ));
        } else if (value is List<Widget>) {
          for (var element in value as List<WidGen>) {
            list.add(
             wrapWithClick( Text( "[$key]" + element.name!),element),
            );
            list.add(Padding(
              padding: const EdgeInsets.only(left: 10),
              child: getWidgetTree(element) ?? Container(),
            ));
          }
        } else {
          value.runtimeType.toString();
        }
      });
    }

    if (list.isEmpty) {
      return Container(
          // child: Text("none"),
          );
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
  }

  Widget wrapWithClick(Widget widget,WidGen widGen) {
    return GestureDetector(
      onTap: () => setSelectedWidget(widGen),
      child: widget,
    );
  }

  unSelectedWidget() {
    selectedWidget = null;
    update();
  }
}
