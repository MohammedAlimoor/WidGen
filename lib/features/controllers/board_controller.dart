import 'package:get/get.dart';
import 'package:wid_gen/wid_gen.dart';
import 'package:wid_gen/widgets/ff_scaffold.dart';

class BoardController extends GetxController with StateMixin {
  Map<String, WidGen> widTree = {
    "mainKeyScafold": FFScaffold(keyID: "mainKeyScafold")
  };

  WidGen? selectedWidget;
  setSelectedWidget(WidGen selectedWidget) {
    print("selected widget ");
    this.selectedWidget = selectedWidget;
    update();
  }

  unSelectedWidget() {
    selectedWidget = null;
    update();
  }
}
