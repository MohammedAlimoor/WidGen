import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wid_gen/widgets/widgets.dart';

class PaletteWidget extends StatefulWidget {
  PaletteWidget({Key? key}) : super(key: key);

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
      child: Column(
        children: [
          Draggable<Widget>(
            onDragEnd: (info) {
              if (info.wasAccepted) refrshkeys();
            },
            data: FFActionBar(
              keyID: const Uuid().v1(),
            ),
            child: const Text("AppBar"),
            // The widget to show under the pointer when a drag is under way
            feedback: const Opacity(
              opacity: 0.4,
              child: Text("AppBar"),
            ),
          ),
          const Divider(),
          Draggable<Widget>(
            onDragEnd: (info) {
              if (info.wasAccepted) refrshkeys();
            },
            data: FFContainer(
              keyID: const Uuid().v1(),
            ),
            child: const Text("Container"),
            // The widget to show under the pointer when a drag is under way
            feedback: const Opacity(
              opacity: 0.4,
              child: Text("Container"),
            ),
          ),
          const Divider(),
          Draggable<Widget>(
            onDragEnd: (info) {
              if (info.wasAccepted) refrshkeys();
            },
            data: FFColumn(
              keyID: const Uuid().v1(),
            ),
            child: const Text("Column"),
            // The widget to show under the pointer when a drag is under way
            feedback: const Opacity(
              opacity: 0.4,
              child: Text("Column"),
            ),
          ),
          const Divider(),
          Draggable<Widget>(
            onDragEnd: (info) {
              if (info.wasAccepted) refrshkeys();
            },
            data: FFText(
              keyID: const Uuid().v1(),
            ),

            child: const Text("Text"),
            // The widget to show under the pointer when a drag is under way
            feedback: const Opacity(
              opacity: 0.4,
              child: Text("Text"),
            ),
          ),
          const Divider(),
          Draggable<Widget>(
            onDragEnd: (info) {
              if (info.wasAccepted) refrshkeys();
            },
            data: FFIcon(
              keyID: const Uuid().v1(),
            ),
            child: const Text("Icon"),
            // The widget to show under the pointer when a drag is under way
            feedback: Opacity(
              opacity: 0.4,
              child: Container(
                color: Colors.purple,
                width: 105,
                height: 105,
                alignment: Alignment.center,
                child: const Text("Icon"),
              ),
            ),
          ),
          // const Divider(),
          // Expanded(
          //   child: GetBuilder<BoardController>(
          //     init: Get.find<BoardController>(tag: "boardController"),
          //     initState: (_) {},
          //     builder: (controller) {
          //       return controller.tree ?? Container();
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
