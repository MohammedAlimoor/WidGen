import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/board_controller.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';

abstract class WidGen extends StatelessWidget {
  WidGen({Key? key, required this.keyID}) : super(key: key);
  Widget get widgetProperties;
  String? get json;
  final String keyID;
  WidGenController putController() {
    return Get.put(WidGenController(), permanent: true, tag: keyID);
  }

  WidGenController get controller => Get.find<WidGenController>(tag: keyID);

  itemClick() {
    Get.find<BoardController>().setSelectedWidget(this);
  }
}
