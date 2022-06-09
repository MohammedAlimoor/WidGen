import 'package:flutter/material.dart';

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
    return Container(
        child: Row(
      children: [
        Text("MainAxisAlignment"),
        SizedBox(width: 10),
        Expanded(
          child: DropdownButton<MainAxisAlignment>(
            value: alignment,
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
