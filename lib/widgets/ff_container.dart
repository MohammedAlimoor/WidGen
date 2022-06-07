import 'package:flutter/material.dart';
import 'package:wid_gen/wid_gen.dart';

class FFContainer extends WidGen {
  FFContainer({Key? key, this.width, this.color, required keyID})
      : super(key: key, keyID: keyID);

  @override
  String? get json => "";

  @override
  Widget get wiget => Container(
        child: widChild,
        color: color,
      );

  Widget? widChild;
  Color? color;
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      child: DragTarget<Widget>(
        onWillAccept: (v) {
          return widChild != null ? false : true;
        },
        onAccept: (value) {
          widChild = value;
          (context as Element).markNeedsBuild();
        },
        builder: (_, candidateData, rejectedData) {
          return Container(
            // color: Colors.red,
            alignment: Alignment.center,
            child: widChild != null ? widChild! : Placeholder(),
            
          );
        },
      ),
    );
  }

 
}
