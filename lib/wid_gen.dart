// ignore_for_file: must_be_immutable

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/property_json_factory.dart';
import 'package:wid_gen/features/controllers/board_controller.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';

abstract class WidGen extends GetView<WidGenController> {
  WidGen({Key? key, required this.keyID}) : super(key: key);
  Widget get widgetProperties;
  String? get json;
  String? get name;
  final String keyID;
  @override
  String? get tag => keyID;
  WidGenController putController(BuildContext context) {
    _context = context;
    return Get.put(WidGenController(), permanent: false, tag: keyID);
  }

  BuildContext? _context;

  String genJson() {
    var code = "";

    // var widgetsList = controller.widgetsValues.entries
    //     .where((element) => element.value != null)
    //     .map((val) => '"${val.key}": ${val.value.json},')
    //     .toList();
   var widgetsList = controller.widgetsValues.entries
   
   .map((val) {
      if (val.value is WidGen) {
        return '"${val.key}": ${val.value.json},';
      } else if ((val.value is List<Widget>)) {
        var childrenJson =
            (val.value as List<WidGen>).map((val2) => '${val2.json},').toList();

        return '"${val.key}": ${childrenJson}';
      }
    }).toList();
    var pList = controller.widgetProperties.entries
        .where((element) => element.value != null)
        .map((val) => PropertyJsonFactory.toJson(val.key, val.value))
        .toList();

    code = '''
        {
          "type": "$name",
      
        ''';

    for (var element in pList) {
      code += element + "\n";
    }

    for (var element in widgetsList) {
      code += (element ??"" )+ "\n";
    }

    code += " }";

    return code.replaceAll(RegExp(r'\,(?=\s*?[\}\]])'), '').replaceAll(",,", ",");
  }

  itemClick() {
    Get.find<BoardController>().setSelectedWidget(this);
  }

  refreshWidget() {
    Get.find<BoardController>().setSelectedWidget(this);
    if (_context == null) return;

    (_context as Element).markNeedsBuild();
  }
}
