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
  // TODO: implement tag
  String? get tag => this.keyID;
  WidGenController putController(BuildContext context) {

    print("Controller put ${keyID}");
    _context = context;

    // return controller;
    return Get.put(WidGenController(), permanent: false, tag: keyID);
  }

  BuildContext? _context;

  // WidGenController get controller => Get.find<WidGenController>(tag: keyID);

  itemClick() {
    Get.find<BoardController>().setSelectedWidget(this);
  }

  refreshWidget() {
    Get.find<BoardController>().setSelectedWidget(this);

    if (_context == null) return;

    (_context as Element).markNeedsBuild();
  }
}
