import 'package:flutter/material.dart';

class PaletteItem extends StatelessWidget {
  const PaletteItem({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(8),
        constraints: BoxConstraints(minWidth: 70),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey[200],
        ),
        child: Column(
          children: [
            Icon(icon),
            Text(title),
          ],
        ),
      ),
    );
  }
}
