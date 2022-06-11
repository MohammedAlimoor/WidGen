import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:wid_gen/core/widgets/item_properties.dart';

class TextWeightProperties extends StatelessWidget {
  TextWeightProperties({Key? key, required this.onSubmitted, this.value})
      : super(key: key);

  Function(FontWeight)? onSubmitted;
  FontWeight? value;

  String? getTitle(FontWeight? weight) {
    switch (weight) {
      case FontWeight.w100:
        return "100";
      case FontWeight.w200:
        return "200";
      case FontWeight.w300:
        return "300";
      case FontWeight.w400:
        return "400";
      case FontWeight.w500:
        return "500";
      case FontWeight.w600:
        return "600";
      case FontWeight.w700:
        return "700";
      case FontWeight.w800:
        return "800";
      case FontWeight.w900:
        return "900";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ItemProperties(
        title: "Text Weight",
        child: DropdownButton<FontWeight>(
          value: value,
          isDense: true,
          isExpanded: true,
          items: <FontWeight>[
            FontWeight.w100,
            FontWeight.w200,
            FontWeight.w300,
            FontWeight.w400,
            FontWeight.w500,
            FontWeight.w600,
            FontWeight.w700,
            FontWeight.w800,
            FontWeight.w900,
          ].map((FontWeight value) {
            return DropdownMenuItem<FontWeight>(
              value: value,
              // enabled: false,
              child: Text(getTitle(value) ?? "--",
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
