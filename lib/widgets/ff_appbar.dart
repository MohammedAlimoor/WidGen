import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wid_gen/wid_gen.dart';

class FFActionBar extends WidGen {
  FFActionBar({Key? key, this.height, required keyID})
      : super(key: key, keyID: keyID);

  @override
  String? get json => "";

  @override
  AppBar get wiget => AppBar(
        leading: widLeading,
        title: widTitle,
      );

  Widget? widTitle;
  Widget? widLeading;
  double? height;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: DragTarget<Widget>(
        onWillAccept: (v) {
          return widLeading != null ? false : true;
        },
        onAccept: (value) {
          widLeading = value;
          (context as Element).markNeedsBuild();
        },
        builder: (_, candidateData, rejectedData) {
          return widLeading != null ? widLeading! : Placeholder();
        },
      ),
      title: DragTarget<Widget>(
        onWillAccept: (v) {
          return widTitle != null ? false : true;
        },
        onAccept: (value) {

          print("title accept");
          widTitle = value;
          (context as Element).markNeedsBuild();
        },
        builder: (_, candidateData, rejectedData) {
          return  widTitle != null ? widTitle! : Placeholder() ;
        },
      ),
    );
  }
}
