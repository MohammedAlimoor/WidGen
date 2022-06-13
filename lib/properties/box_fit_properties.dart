import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:wid_gen/core/widgets/item_properties.dart';

class BoxFitProperties extends StatelessWidget {
  BoxFitProperties({Key? key, required this.onSubmitted, this.value})
      : super(key: key);

  Function(BoxFit)? onSubmitted;
  BoxFit? value;

  static String getValue(BoxFit? box) {
    if (box == null) return "none";
    switch (box) {
      case BoxFit.fill:
        return "fill";
      case BoxFit.contain:
        return "contain";
      case BoxFit.cover:
        return "cover";
      case BoxFit.fitHeight:
        return "fitHeight";
      case BoxFit.fitWidth:
        return "fitWidth";
      case BoxFit.none:
        return "none";
      case BoxFit.scaleDown:
        return "scaleDown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ItemProperties(
        title: "Box Fit",
        child: DropdownButton<BoxFit>(
          value: value,
          isDense: true,
          isExpanded: true,
          items: <BoxFit>[
            BoxFit.fill,
            BoxFit.contain,
            BoxFit.cover,
            BoxFit.fitHeight,
            BoxFit.fitWidth,
            BoxFit.none,
            BoxFit.scaleDown,
          ].map((BoxFit value) {
            return DropdownMenuItem<BoxFit>(
              value: value,
              // enabled: false,
              child: Text(value.name,
                  style: TextStyle(
                      color: Color.fromARGB(255, 73, 72, 72), fontSize: 15)),
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
