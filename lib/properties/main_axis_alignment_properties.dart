import 'package:flutter/material.dart';
import 'package:wid_gen/core/widgets/item_properties.dart';

class MainAxisAlignmentProperties extends StatelessWidget {
  MainAxisAlignmentProperties(
      {Key? key,
      required this.onSubmitted,
      this.alignment = MainAxisAlignment.start})
      : super(key: key);

  Function(MainAxisAlignment)? onSubmitted;
  MainAxisAlignment? alignment;

  // MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start
  //
  @override
  Widget build(BuildContext context) {
    return ItemProperties(
        title: "Main Axis ",
        child: DropdownButton<MainAxisAlignment>(
          value: alignment,
          isDense: true,
          isExpanded: true,
          items: <MainAxisAlignment>[
            MainAxisAlignment.center,
            MainAxisAlignment.start,
            MainAxisAlignment.end,
            MainAxisAlignment.spaceAround,
            MainAxisAlignment.spaceEvenly,
            MainAxisAlignment.spaceBetween,
          ].map((MainAxisAlignment value) {
            return DropdownMenuItem<MainAxisAlignment>(
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
