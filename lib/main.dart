import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/widgets/colored_json.dart';
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    Get.put(BoardController(), tag: "boardController");
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          Container(
            width: 250,
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
                                      const Icon(
                                        Icons.account_tree_outlined,
                                        color: Colors.white,
                                      ),
                                      const Gap(5),
                                      const Text(
                                        "Tree",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Get.find<BoardController>(
                                                tag: "boardController")
                                            .tree ??
                                        Container(),
                                  ),
                                )
                              ],
                            ))))
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.black26,
                  child: TabBar(
                    isScrollable: true,
                    controller: tabController,
                    tabs: [
                      Row(children: [
                        Icon(Icons.construction_rounded),
                        SizedBox(width: 5),
                        Text("Builder")
                      ]),
                      Row(children: [
                        Icon(Icons.get_app_rounded),
                        SizedBox(width: 5),
                        Text("Dynamic Json")
                      ]),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  controller: tabController,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(50),
                      color: Colors.grey,
                      child: GetBuilder<BoardController>(
                        init: Get.find<BoardController>(tag: "boardController"),
                        initState: (_) {},
                        builder: (controller) {
                          return Get.find<BoardController>(
                                  tag: "boardController")
                              .widTree["scafold"]!;
                        },
                      ),
                    ),
                    Stack(
                      fit: StackFit.expand,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: ColoredJson(
                              data: Get.find<BoardController>(
                                      tag: "boardController")
                                  .json,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.snackbar(":)", "Json copied to clipboard",
                                      backgroundColor: Colors.black38,
                                      snackPosition: SnackPosition.BOTTOM);

                                  Clipboard.setData(ClipboardData(
                                          text: Get.find<BoardController>(
                                                  tag: "boardController")
                                              .json))
                                      .then((_) {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                          color: Colors.black26, width: 1)),
                                  child: Text("Copy Json"),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ))
              ],
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
                      if (controller.selectedWidget != null)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          child: BootstrapButton(
                            type: BootstrapButtonType.danger,
                            child: Text('Remove Item'),
                            onPressed: () {
                              controller.removeWidgetTree(
                                  controller.widTree["scafold"]!,
                                  controller.selectedWidget!);
                              setState(() {
                                controller.selectedWidget = null;
                              });
                            },
                          ),
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
