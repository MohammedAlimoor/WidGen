import 'package:flutter/material.dart';

class ItemProperties extends StatelessWidget {
  const ItemProperties({Key? key, required this.title, required this.child})
      : super(key: key);
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffDDDDDD),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                  color: const Color(0xffDDDDDD),
                  border: Border.all(
                    color: const Color(0xffDDDDDD),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                child: Text(title,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 73, 72, 72), fontSize: 15)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: child,
                ),
              )
            ],
          ),
        ));
  }
}
