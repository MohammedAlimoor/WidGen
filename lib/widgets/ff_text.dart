import 'package:flutter/material.dart';
import 'package:wid_gen/wid_gen.dart';

class FFText extends WidGen {
  FFText({Key? key, required String keyID, this.text})
      : super(key: key, keyID: keyID);

  @override
  String? get json => "";
  String? text;

  @override
  Widget get wiget => Container(
        child: widChild,
      );

  Widget? widChild;
  @override
  Widget build(BuildContext context) {
    return Text(text ?? "test text");
  }
}
