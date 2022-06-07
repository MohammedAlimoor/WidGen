import 'package:flutter/widgets.dart';

abstract class WidGen extends StatelessWidget {
  WidGen({Key? key, required this.keyID}) {
  }
  Widget get wiget;
  String? get json;
  final String keyID;
}
