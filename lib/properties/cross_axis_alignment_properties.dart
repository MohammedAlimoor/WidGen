import 'package:flutter/material.dart';

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
    return Container(
        child: Row(
      children: [
        Text("CrossAxisAlignment"),
        SizedBox(width: 10),
        Expanded(
          child: DropdownButton<CrossAxisAlignment>(
            value: alignment,
            items: <CrossAxisAlignment>[
              CrossAxisAlignment.center,
              CrossAxisAlignment.start,
              CrossAxisAlignment.end,
              CrossAxisAlignment.baseline,
              CrossAxisAlignment.stretch,
            ].map((CrossAxisAlignment value) {
              return DropdownMenuItem<CrossAxisAlignment>(
                value: value,
                child: Text(value.name),
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
