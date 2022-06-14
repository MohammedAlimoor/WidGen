import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/core/wid_gen.dart';
import 'package:wid_gen/widgets/ff_scaffold.dart';
import 'dart:async';

final StreamController<bool> dragDropStreamController =
    StreamController<bool>.broadcast();

class BoardController extends GetxController with StateMixin {
  var widTree = {"scafold": FFScaffold(keyID: "mainKeyScafold")}.obs;

  WidGen? selectedWidget;
  setSelectedWidget(WidGen selectedWidget) {
    this.selectedWidget = selectedWidget;
    update();
  }

  String prettyJson(dynamic json) {
    return getPrettyJSONString(jsonEncode(jsonDecode(json)));

    // var spaces = ' ' * 4;
    // var encoder = JsonEncoder.withIndent(spaces);
    // return encoder.convert(json);
  }

  String getPrettyJSONString(jsonObject) {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(jsonObject);
  }

  void removeWidgetTree(WidGen root, WidGen del) {
    print("start remove ${del.keyID}");

    var reg = Get.isRegistered<WidGenController>(tag: root.keyID);

    if (reg) {
      print("start remove 2 ${del.keyID}");
      root.controller.widgetsValues.forEach((key, value) {
        if (value is WidGen) {
          if (value.keyID == del.keyID) {
            root.controller.widgetsValues[key] = null;
            root.refreshWidget();
            print("Found ${del.keyID}");
          }
          removeWidgetTree(value, del);
        } else if (value is List<Widget>) {
          var index = 0;
          (value as List<WidGen>)
              .removeWhere((element) => element.keyID == del.keyID);
          root.refreshWidget();

          for (var element in value as List<WidGen>) {
            if (element.keyID == del.keyID) {
              // value.removeAt(index);
              // root.refreshWidget();
            } else {
              removeWidgetTree(element, del);
            }
            index++;
          }
        }
      });
    }

    update();
  }

  String get json {
    var mainWidget = widTree["scafold"];

    var reg = Get.isRegistered<WidGenController>(tag: mainWidget!.keyID);

    if (reg) {
      return mainWidget.json!;
    }
    return "{}";
  }

  Widget? get tree => getWidgetTree(widTree["scafold"]!, firstTime: true);

  Widget? getWidgetTree(WidGen wid, {firstTime = false}) {
    List<Widget> list = [];

    if (firstTime) {
      list.add(Text(wid.name!));
    }

    var reg = Get.isRegistered<WidGenController>(tag: wid.keyID);

    if (reg) {
      if (firstTime) {
        print(prettyJson(wid.json));
      }
      ;

      wid.controller.widgetsValues.forEach((key, value) {
        if (value is WidGen) {
          list.add(
            wrapWithClick(Text("[$key]" + value.name!), value),
          );
          list.add(Padding(
            padding: const EdgeInsets.only(left: 10),
            child: getWidgetTree(value) ?? Container(),
          ));
        } else if (value is List<Widget>) {
          for (var element in value as List<WidGen>) {
            list.add(
              wrapWithClick(Text("[$key]" + element.name!), element),
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

  Widget wrapWithClick(Widget widget, WidGen widGen) {
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
