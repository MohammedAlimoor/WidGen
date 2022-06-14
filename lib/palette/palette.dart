import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wid_gen/palette/palette_item.dart';
import 'package:wid_gen/core/controllers/board_controller.dart';
import 'package:wid_gen/widgets/ff_image_network.dart';
import 'package:wid_gen/widgets/ff_scroll.dart';
import 'package:wid_gen/widgets/ff_expanded.dart';
import 'package:wid_gen/widgets/ff_svg.dart';
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

    widget.onChange();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Wrap(
          children: [
            Draggable<Widget>(
              onDragStarted: () => dragDropStreamController.add(true),
              onDragCompleted: () => dragDropStreamController.add(false),
              onDraggableCanceled: (_, __) =>
                  dragDropStreamController.add(false),
              onDragEnd: (info) {
                if (info.wasAccepted) refrshkeys();
              },
              data: FFActionBar(
                keyID: const Uuid().v1(),
              ),
              child:
                  const PaletteItem(title: "AppBar", icon: Icons.drag_handle),
              // The widget to show under the pointer when a drag is under way
              feedback: const Center(
                child: Opacity(
                  opacity: 0.4,
                  child: PaletteItem(title: "AppBar", icon: Icons.drag_handle),
                ),
              ),
            ),
            Draggable<Widget>(
              onDragStarted: () => dragDropStreamController.add(true),
              onDragCompleted: () => dragDropStreamController.add(false),
              onDraggableCanceled: (_, __) =>
                  dragDropStreamController.add(false),
              onDragEnd: (info) {
                if (info.wasAccepted) refrshkeys();
              },
              data: FFContainer(
                keyID: const Uuid().v1(),
              ),
              child: const PaletteItem(
                  title: "Container",
                  icon: Icons.check_box_outline_blank_rounded),
              // The widget to show under the pointer when a drag is under way
              feedback: const Opacity(
                opacity: 0.4,
                child: PaletteItem(
                    title: "Container",
                    icon: Icons.check_box_outline_blank_rounded),
              ),
            ),
            Draggable<Widget>(
              onDragStarted: () => dragDropStreamController.add(true),
              onDragCompleted: () => dragDropStreamController.add(false),
              onDraggableCanceled: (_, __) =>
                  dragDropStreamController.add(false),
              onDragEnd: (info) {
                if (info.wasAccepted) refrshkeys();
              },
              data: FFColumn(
                keyID: const Uuid().v1(),
              ),
              child: const PaletteItem(
                  title: "Column", icon: Icons.view_column_outlined),
              // The widget to show under the pointer when a drag is under way
              feedback: const Opacity(
                opacity: 0.4,
                child: PaletteItem(
                    title: "Column", icon: Icons.view_column_outlined),
              ),
            ),
            Draggable<Widget>(
              onDragStarted: () => dragDropStreamController.add(true),
              onDragCompleted: () => dragDropStreamController.add(false),
              onDraggableCanceled: (_, __) =>
                  dragDropStreamController.add(false),
              onDragEnd: (info) {
                if (info.wasAccepted) refrshkeys();
              },
              data: FFRow(
                keyID: const Uuid().v1(),
              ),
              child: const PaletteItem(
                  title: "Row", icon: Icons.view_column_outlined),
              // The widget to show under the pointer when a drag is under way
              feedback: const Opacity(
                opacity: 0.4,
                child:
                    PaletteItem(title: "Row", icon: Icons.view_column_outlined),
              ),
            ),
            Draggable<Widget>(
              onDragStarted: () => dragDropStreamController.add(true),
              onDragCompleted: () => dragDropStreamController.add(false),
              onDraggableCanceled: (_, __) =>
                  dragDropStreamController.add(false),
              onDragEnd: (info) {
                if (info.wasAccepted) refrshkeys();
              },
              data: FFExpanded(
                keyID: const Uuid().v1(),
              ),
              child: const PaletteItem(
                  title: "Expanded", icon: Icons.fullscreen_outlined),
              // The widget to show under the pointer when a drag is under way
              feedback: const Opacity(
                opacity: 0.4,
                child: PaletteItem(
                    title: "Expanded", icon: Icons.fullscreen_outlined),
              ),
            ),
            Draggable<Widget>(
              onDragStarted: () => dragDropStreamController.add(true),
              onDragCompleted: () => dragDropStreamController.add(false),
              onDraggableCanceled: (_, __) =>
                  dragDropStreamController.add(false),
              onDragEnd: (info) {
                if (info.wasAccepted) refrshkeys();
              },
              data: FFImageNetwork(
                keyID: const Uuid().v1(),
              ),
              child:
                  const PaletteItem(title: "Image", icon: Icons.image_outlined),
              // The widget to show under the pointer when a drag is under way
              feedback: const Opacity(
                opacity: 0.4,
                child: PaletteItem(title: "Image", icon: Icons.image_outlined),
              ),
            ),
            Draggable<Widget>(
              onDragStarted: () => dragDropStreamController.add(true),
              onDragCompleted: () => dragDropStreamController.add(false),
              onDraggableCanceled: (_, __) =>
                  dragDropStreamController.add(false),
              onDragEnd: (info) {
                if (info.wasAccepted) refrshkeys();
              },
              data: FFSVGNetwork(
                keyID: const Uuid().v1(),
              ),
              child:
                  const PaletteItem(title: "SVG", icon: Icons.imagesearch_roller),
              // The widget to show under the pointer when a drag is under way
              feedback: const Opacity(
                opacity: 0.4,
                child: PaletteItem(title: "SVG", icon: Icons.imagesearch_roller),
              ),
            ),
            Draggable<Widget>(
              onDragStarted: () => dragDropStreamController.add(true),
              onDragCompleted: () => dragDropStreamController.add(false),
              onDraggableCanceled: (_, __) =>
                  dragDropStreamController.add(false),
              onDragEnd: (info) {
                if (info.wasAccepted) refrshkeys();
              },
              data: FFText(
                keyID: const Uuid().v1(),
              ),

              child: const PaletteItem(title: "Text", icon: Icons.text_fields),
              // The widget to show under the pointer when a drag is under way
              feedback: const Opacity(
                opacity: 0.4,
                child: PaletteItem(title: "Text", icon: Icons.text_fields),
              ),
            ),
            Draggable<Widget>(
              onDragStarted: () => dragDropStreamController.add(true),
              onDragCompleted: () => dragDropStreamController.add(false),
              onDraggableCanceled: (_, __) =>
                  dragDropStreamController.add(false),
              onDragEnd: (info) {
                if (info.wasAccepted) refrshkeys();
              },
              data: FFDivider(
                keyID: const Uuid().v1(),
              ),
              child: const PaletteItem(
                  title: "Divider", icon: Icons.horizontal_rule_outlined),
              // The widget to show under the pointer when a drag is under way
              feedback: Opacity(
                opacity: 0.4,
                child: Container(
                  color: Colors.purple,
                  width: 105,
                  height: 105,
                  alignment: Alignment.center,
                  child: const PaletteItem(
                      title: "Divider", icon: Icons.horizontal_rule_outlined),
                ),
              ),
            ),
            Draggable<Widget>(
              onDragStarted: () => dragDropStreamController.add(true),
              onDragCompleted: () => dragDropStreamController.add(false),
              onDraggableCanceled: (_, __) =>
                  dragDropStreamController.add(false),
              onDragEnd: (info) {
                if (info.wasAccepted) refrshkeys();
              },
              data: FFSingleChildScrollView(
                keyID: const Uuid().v1(),
              ),
              child: const PaletteItem(title: "Scroll", icon: Icons.swap_vert),
              // The widget to show under the pointer when a drag is under way
              feedback: Opacity(
                opacity: 0.4,
                child: Container(
                  color: Colors.purple,
                  width: 105,
                  height: 105,
                  alignment: Alignment.center,
                  child:
                      const PaletteItem(title: "Scroll", icon: Icons.swap_vert),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
