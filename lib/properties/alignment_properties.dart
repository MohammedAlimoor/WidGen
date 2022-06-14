// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wid_gen/core/widgets/item_properties.dart';

class AlignmentProperties extends StatelessWidget {
  AlignmentProperties({Key? key, required this.onSubmitted, this.alignment})
      : super(key: key);

  Function(Alignment?)? onSubmitted;
  Alignment? alignment;

  static String getTitle(Alignment alignment) {
    if (alignment.x == -1.0 && alignment.y == -1.0) return 'Alignment.topLeft';
    if (alignment.x == 0.0 && alignment.y == -1.0) return 'Alignment.topCenter';
    if (alignment.x == 1.0 && alignment.y == -1.0) return 'Alignment.topRight';
    if (alignment.x == -1.0 && alignment.y == 0.0) return 'Alignment.centerLeft';
    if (alignment.x == 0.0 && alignment.y == 0.0) return 'Alignment.center';
    if (alignment.x == 1.0 && alignment.y == 0.0) return 'Alignment.centerRight';
    if (alignment.x == -1.0 && alignment.y == 1.0) return 'Alignment.bottomLeft';
    if (alignment.x == 0.0 && alignment.y == 1.0) return 'Alignment.bottomCenter';
    if (alignment.x == 1.0 && alignment.y == 1.0) return 'Alignment.bottomRight';
    return 'Alignment(${alignment.x.toStringAsFixed(1)}, '
        '${alignment.y.toStringAsFixed(1)})';
  }

  static String getValue(Alignment alignment) {
    if (alignment.x == -1.0 && alignment.y == -1.0) return 'topLeft';
    if (alignment.x == 0.0 && alignment.y == -1.0) return 'topCenter';
    if (alignment.x == 1.0 && alignment.y == -1.0) return 'topRight';
    if (alignment.x == -1.0 && alignment.y == 0.0) return 'centerLeft';
    if (alignment.x == 0.0 && alignment.y == 0.0) return 'center';
    if (alignment.x == 1.0 && alignment.y == 0.0) return 'centerRight';
    if (alignment.x == -1.0 && alignment.y == 1.0) return 'bottomLeft';
    if (alignment.x == 0.0 && alignment.y == 1.0) return 'bottomCenter';
    if (alignment.x == 1.0 && alignment.y == 1.0) return 'bottomRight';
    return 'Alignment(${alignment.x.toStringAsFixed(1)}, '
        '${alignment.y.toStringAsFixed(1)})';
  }

  @override
  Widget build(BuildContext context) {
    return ItemProperties(
        title: "Alignment",
        child: DropdownButton<Alignment>(
          value: alignment,
          isDense: true,
          isExpanded: true,
          items: <Alignment>[
            Alignment.center,
            Alignment.bottomCenter,
            Alignment.bottomLeft,
            Alignment.bottomRight,
            Alignment.centerLeft,
            Alignment.centerRight,
            Alignment.topCenter,
            Alignment.topLeft,
            Alignment.topRight,
          ].map((Alignment value) {
            return DropdownMenuItem<Alignment>(
              value: value,
              // enabled: false,
              child: Text(getTitle(value),
                  style:const TextStyle(
                      color:  Color.fromARGB(255, 73, 72, 72), fontSize: 15)),
            );
          }).toList(),
          onChanged: (select) {
            if (select != null) {
              onSubmitted?.call(select);
            }
          },
        ));
  }
}
