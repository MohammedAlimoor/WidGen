import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wid_gen/features/controllers/board_controller.dart';
import 'package:wid_gen/widgets/widgets.dart';

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
  void initState() {
    Get.put(BoardController(), tag: "boardController");

    super.initState();
  }

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
            // color: Colors.grey,
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Color.fromARGB(255, 49, 49, 49),
                  child: Row(
                    children: [
                      Icon(
                        Icons.palette_outlined,
                        color: Colors.white,
                      ),
                      Gap(5),
                      Text(
                        "Palette",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                PaletteWidget(
                  onChange: () {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      setState(() {});

                      print("SSSSS Update");
                    });
                  },
                ),
                Expanded(
                    child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Obx(() => Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  color: Color.fromARGB(255, 49, 49, 49),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.account_tree_outlined,
                                        color: Colors.white,
                                      ),
                                      Gap(5),
                                      Text(
                                        "Tree",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                // Text(Get.find<BoardController>(
                                //         tag: "boardController")
                                //     .widTree
                                //     .keys
                                //     .first),
                                Get.find<BoardController>(
                                            tag: "boardController")
                                        .tree ??
                                    Container()
                              ],
                            ))))
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(50),
              color: Colors.grey,
              child: GetBuilder<BoardController>(
                init: Get.find<BoardController>(tag: "boardController"),
                initState: (_) {},
                builder: (controller) {
                  return Get.find<BoardController>(tag: "boardController")
                      .widTree["scafold"]!;
                },
              ),
            ),
          ),
          Container(
            width: 300,
            child: GetBuilder<BoardController>(
                init: Get.find<BoardController>(tag: "boardController"),
                initState: (_) {},
                builder: (controller) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Color.fromARGB(255, 49, 49, 49),
                        child: Row(
                          children: [
                            Text(
                              controller.selectedWidget?.name ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                            ),
                            Expanded(
                                child: Text(
                              controller.selectedWidget?.keyID ?? "",
                              maxLines: 1,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(8),
                            child: controller.selectedWidget != null
                                ? controller.selectedWidget!.widgetProperties
                                : Text("Please select any Item"),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
