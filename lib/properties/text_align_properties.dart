import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:wid_gen/core/widgets/item_properties.dart';

class TextAlignProperties extends StatelessWidget {
  TextAlignProperties({Key? key, required this.onSubmitted, this.textAlign})
      : super(key: key);

  Function(TextAlign)? onSubmitted;
  TextAlign? textAlign;
  //
  @override
  Widget build(BuildContext context) {
    return ItemProperties(
        title: "Text Align",
        child: DropdownButton<TextAlign>(
          value: textAlign,
          isDense: true,
          isExpanded: true,
          items: <TextAlign>[
            TextAlign.center,
            TextAlign.end,
            TextAlign.justify,
            TextAlign.left,
            TextAlign.right,
            TextAlign.start,
          ].map((TextAlign value) {
            return DropdownMenuItem<TextAlign>(
              value: value,
              // enabled: false,
              child: Text(value.name.toUpperCase(),
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
