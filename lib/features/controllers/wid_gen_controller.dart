import 'package:get/get_state_manager/get_state_manager.dart';

class WidGenController extends GetxController with StateMixin {
  late Map<String, dynamic> widgetsValues = {};
  late Map<String, dynamic> widgetProperties = {};
  void setValue<K>(String key, K value) {
    widgetsValues[key] = value;
    update();
  }

  K? getValue<K>(String key) {
    if (!widgetsValues.containsKey(key)) return null;
    return widgetsValues[key];
  }

  void setProperty<K>(String key, K value) {
    widgetProperties[key] = value;
    update();
    refresh();
  }

  K? getProperty<K>(String key) {
    if (!widgetProperties.containsKey(key)) return null;
    return widgetProperties[key];
  }
}
