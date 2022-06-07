import 'package:flutter/material.dart';
import 'package:wid_gen/wid_gen.dart';

class FFIcon extends WidGen {
  FFIcon({Key? key, required String keyID})
      : super(key: key, keyID: keyID);

  @override
  String? get json => "";

  @override
  Widget get wiget => Container(
        child: widChild,
      );

  Widget? widChild;
  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.add);
  }
}
