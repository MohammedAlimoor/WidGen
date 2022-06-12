import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wid_gen/core/widgets/palette_item.dart';
import 'package:wid_gen/widgets/ff_Image_network.dart';
import 'package:wid_gen/widgets/ff_expanded.dart';
import 'package:wid_gen/widgets/widgets.dart';

class PaletteWidget extends StatefulWidget {
  const PaletteWidget({Key? key, required this.onChange}) : super(key: key);

  final Function onChange;
  @override
  State<PaletteWidget> createState() => _PaletteWidgetState();
}

class _PaletteWidgetState extends State<PaletteWidget> {
  refrshkeys() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Wrap(
        children: [
          Draggable<Widget>(
            onDragEnd: (info) {
              if (info.wasAccepted) refrshkeys();
            },
            data: FFActionBar(
              keyID: const Uuid().v1(),
            ),
            child: const PaletteItem(title: "AppBar", icon: Icons.drag_handle),
            // The widget to show under the pointer when a drag is under way
            feedback: const Opacity(
              opacity: 0.4,
              child: Text("AppBar"),
            ),
          ),
          Draggable<Widget>(
            onDragEnd: (info) {
              if (info.wasAccepted) refrshkeys();
            },
            data: FFContainer(
              keyID: const Uuid().v1(),
            ),
            child: const PaletteItem(title: "Container", icon: Icons.check_box_outline_blank_rounded),
            // The widget to show under the pointer when a drag is under way
            feedback: const Opacity(
              opacity: 0.4,
              child: Text("Container"),
            ),
          ),
          Draggable<Widget>(
            onDragEnd: (info) {
              if (info.wasAccepted) refrshkeys();
            },
            data: FFColumn(
              keyID: const Uuid().v1(),
            ),
            child: const PaletteItem(title: "Column", icon: Icons.view_column_outlined),
            // The widget to show under the pointer when a drag is under way
            feedback: const Opacity(
              opacity: 0.4,
              child: Text("Column"),
            ),
          ),
          Draggable<Widget>(
            onDragEnd: (info) {
              if (info.wasAccepted) refrshkeys();
            },
            data: FFRow(
              keyID: const Uuid().v1(),
            ),
            child: const PaletteItem(title: "Row", icon: Icons.view_column_outlined) ,
            // The widget to show under the pointer when a drag is under way
            feedback: const Opacity(
              opacity: 0.4,
              child: Text("Row"),
            ),
          ),
          Draggable<Widget>(
            onDragEnd: (info) {
              if (info.wasAccepted) refrshkeys();
            },
            data: FFExpanded(
              keyID: const Uuid().v1(),
            ),
            child: const PaletteItem(title: "Expanded", icon: Icons.fullscreen_outlined),
            // The widget to show under the pointer when a drag is under way
            feedback: const Opacity(
              opacity: 0.4,
              child: Text("Expanded"),
            ),
          ),
          Draggable<Widget>(
            onDragEnd: (info) {
              if (info.wasAccepted) refrshkeys();
            },
            data: FFImageNetwork(
              keyID: const Uuid().v1(),
            ),
            child: const PaletteItem(title: "Image", icon: Icons.image_outlined) ,
            // The widget to show under the pointer when a drag is under way
            feedback: const Opacity(
              opacity: 0.4,
              child: Text("Image"),
            ),
          ),
          Draggable<Widget>(
            onDragEnd: (info) {
              if (info.wasAccepted) refrshkeys();
            },
            data: FFText(
              keyID: const Uuid().v1(),
            ),

            child: const PaletteItem(title: "Text", icon: Icons.text_fields) ,
            // The widget to show under the pointer when a drag is under way
            feedback: const Opacity(
              opacity: 0.4,
              child: Text("Text"),
            ),
          ),
          Draggable<Widget>(
            onDragEnd: (info) {
              if (info.wasAccepted) refrshkeys();
            },
            data: FFDivider(
              keyID: const Uuid().v1(),
            ),
            child: const PaletteItem(title: "Divider", icon: Icons.horizontal_rule_outlined) ,
            // The widget to show under the pointer when a drag is under way
            feedback: Opacity(
              opacity: 0.4,
              child: Container(
                color: Colors.purple,
                width: 105,
                height: 105,
                alignment: Alignment.center,
                child: const Text("Divider"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
