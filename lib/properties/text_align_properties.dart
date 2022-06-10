import 'package:flutter/material.dart';

class TextAlignProperties extends StatelessWidget {
  TextAlignProperties({Key? key, required this.onSubmitted, this.textAlign})
      : super(key: key);

  Function(TextAlign)? onSubmitted;
  TextAlign? textAlign;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Text("Text Align"),
        SizedBox(width: 10),
        Expanded(
          child: DropdownButton<TextAlign>(
            value: textAlign,
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
                child: Text(value.name.toUpperCase()),
              );
            }).toList(),
            onChanged: (select) {
              if (select != null) {
                onSubmitted?.call(select);
              }
            },
          ),
        )
      ],
    ));
  }
}
