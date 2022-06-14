// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wid_gen/core/widgets/item_properties.dart';

class EdgeInsetsProperties extends StatelessWidget {
  EdgeInsetsProperties(
      {Key? key,
      required this.current,
      required this.selected,
      required this.title})
      : super(key: key);

  final Function(EdgeInsets) selected;
  EdgeInsets? current;
  final String title;

  EdgeInsets get value => current ?? EdgeInsets.zero;

  static  getValue(EdgeInsets edgeInsets) =>
      "${edgeInsets.left},${edgeInsets.top},${edgeInsets.right},${edgeInsets.bottom}";
  @override
  Widget build(BuildContext context) {
    final TextEditingController? controllerTop =
        TextEditingController(text: current?.top.toString());
    final TextEditingController? controllerBottom =
        TextEditingController(text: current?.bottom.toString());
    final TextEditingController? controllerRight =
        TextEditingController(text: current?.right.toString());
    final TextEditingController? controllerLeft =
        TextEditingController(text: current?.left.toString());
    return ItemProperties(
        title: title,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextField(
                controller: controllerTop,
                keyboardType: TextInputType.number,
                onSubmitted: (text) {
              
                  selected.call( value.copyWith(top: double.tryParse(text) ?? 0));
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: 'top',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
                  filled: true,
                  fillColor: Colors.white70,
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controllerBottom,
                keyboardType: TextInputType.number,
                onSubmitted: (text) {
                  selected.call( value.copyWith(bottom: double.tryParse(text) ?? 0));
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Bottom',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
                  filled: true,
                  fillColor: Colors.white70,
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controllerRight,
                keyboardType: TextInputType.number,
                onSubmitted: (text) {
                  selected.call(value.copyWith(right: double.tryParse(text) ?? 0));
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Right',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
                  filled: true,
                  fillColor: Colors.white70,
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controllerLeft,
                keyboardType: TextInputType.number,
                onSubmitted: (text) {
                  selected.call(value.copyWith(left: double.tryParse(text) ?? 0));
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Left',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
                  filled: true,
                  fillColor: Colors.white70,
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            )
          ],
        ));
  }
}
