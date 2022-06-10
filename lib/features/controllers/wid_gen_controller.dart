import 'package:get/get_state_manager/get_state_manager.dart';

class WidGenController extends GetxController with StateMixin {
  late Map<String, dynamic> widgetsValues = {};
  late Map<String, dynamic> widgetProperties = {};
  void setValue<K>(String key, K value) {
    widgetsValues[key] = value;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    change(null, status: RxStatus.success());
  }

  K? getValue<K>(String key) {
    if (!widgetsValues.containsKey(key)) return null;
    return widgetsValues[key];
  }

  bool hasValue(String key) {
    return widgetsValues.containsKey(key);
  }

  void setProperty<K>(String key, K value) {
    widgetProperties[key] = value;
    update();
    change(null, status: RxStatus.success());
  }

  void clearProperty<K>(String key) {
    widgetProperties.remove(key);
    update();
    change(null, status: RxStatus.success());
  }

  K? getProperty<K>(String key) {
    if (!widgetProperties.containsKey(key)) return null;
    return widgetProperties[key];
  }
}
