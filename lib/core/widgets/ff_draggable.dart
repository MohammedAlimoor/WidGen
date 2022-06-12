

import 'package:flutter/cupertino.dart';

class FFDraggable<T extends Object> extends Draggable  {
  FFDraggable({required Widget child, required Widget feedback}) : super(child: child, feedback: feedback);
}