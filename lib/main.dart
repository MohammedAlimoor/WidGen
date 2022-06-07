import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:uuid/uuid.dart';
import 'package:wid_gen/features/controllers/board_controller.dart';
import 'package:wid_gen/widgets/ff_appbar.dart';
import 'package:wid_gen/widgets/ff_icon.dart';
import 'package:wid_gen/widgets/ff_scaffold.dart';

import 'widgets/ff_container.dart';
import 'widgets/ff_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      enableLog: true,
      defaultTransition: Transition.fade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      // popGesture: Get.isPopGestureEnable,

      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Material(
      child: Row(
        children: [
          Container(
            color: Colors.grey,
            width: 300,
            child: Column(
              children: [
                Draggable<Widget>(
                  onDragUpdate: (dd) {},
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
                Divider(),
                Draggable<Widget>(
                  data: FFContainer(
                    keyID: const Uuid().v1(),
                  ),
                  child: Text("Container"),
                  // The widget to show under the pointer when a drag is under way
                  feedback: Opacity(
                    opacity: 0.4,
                    child: Text("Container"),
                  ),
                ),
                Divider(),
                Draggable<Widget>(
                  data: FFText(
                    keyID: const Uuid().v1(),
                  ),

                  child: Text("Text"),
                  // The widget to show under the pointer when a drag is under way
                  feedback: Opacity(
                    opacity: 0.4,
                    child: Text("Text"),
                  ),
                ),
                Divider(),
                Draggable<Widget>(
                  data: FFIcon(
                    keyID: const Uuid().v1(),
                  ),
                  child: Text("Icon"),
                  // The widget to show under the pointer when a drag is under way
                  feedback: Opacity(
                    opacity: 0.4,
                    child: Container(
                      color: Colors.purple,
                      width: 105,
                      height: 105,
                      alignment: Alignment.center,
                      child: Text("Icon"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(50),
              color: Colors.grey,
              child: FFScaffold(
                keyID: "mainKeyScafold",
              ),
            ),
          ),
          Container(
            width: 300,
            padding: const EdgeInsets.all(8),
            child: GetBuilder<BoardController>(
                init: BoardController(),
                initState: (_) {},
                builder: (controller) {
                  return Column(
                    children: [
                      Text(controller.selectedWidget?.keyID ?? ""),
                      const SizedBox(
                        height: 10,
                      ),
                      controller.selectedWidget != null
                          ? controller.selectedWidget!.widgetProperties
                          : Text("Please select any Item"),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
