// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wid_gen/core/widgets/item_properties.dart';

class CrossAxisAlignmentProperties extends StatelessWidget {
  CrossAxisAlignmentProperties(
      {Key? key,
      required this.onSubmitted,
      this.alignment = CrossAxisAlignment.center})
      : super(key: key);

  Function(CrossAxisAlignment)? onSubmitted;
  CrossAxisAlignment? alignment;

  // MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start
  //
  @override
  Widget build(BuildContext context) {
    return ItemProperties(
        title: "Cross Axis ",
        child: DropdownButton<CrossAxisAlignment>(
          value: alignment,
          isDense: true,
          isExpanded: true,
          items: <CrossAxisAlignment>[
            CrossAxisAlignment.center,
            CrossAxisAlignment.start,
            CrossAxisAlignment.end,
            CrossAxisAlignment.baseline,
            CrossAxisAlignment.stretch,
          ].map((CrossAxisAlignment value) {
            return DropdownMenuItem<CrossAxisAlignment>(
              value: value,
              child: Text(value.name.toUpperCase()),
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
