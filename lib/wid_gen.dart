// ignore_for_file: must_be_immutable

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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

  itemClick() {
    Get.find<BoardController>().setSelectedWidget(this);
  }

  refreshWidget() {
    Get.find<BoardController>().setSelectedWidget(this);
    if (_context == null) return;

    (_context as Element).markNeedsBuild();
  }
}
