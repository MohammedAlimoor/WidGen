// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/controllers/board_controller.dart';
import 'package:wid_gen/core/widgets/colored_json.dart';

import 'palette/palette.dart';

class IDE extends StatefulWidget {
  IDE({Key? key}) : super(key: key);

  @override
  State<IDE> createState() => _IDEState();
}

class _IDEState extends State<IDE> with TickerProviderStateMixin {
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
          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  color: const Color.fromARGB(255, 49, 49, 49),
                  child: Row(
                    children: const [
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
                                  color: const Color.fromARGB(255, 49, 49, 49),
                                  child: Row(
                                    children: const [
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
                    indicatorColor: Colors.black,
                    tabs: [
                      Row(children: const [
                        Icon(Icons.construction_rounded),
                        SizedBox(width: 5),
                        Text("Builder")
                      ]),
                      Row(children: const [
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
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(
                                          color: Colors.black26, width: 1)),
                                  child: const Text("Refresh"),
                                ),
                              ),
                              const Gap(10),
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(
                                          color: Colors.black26, width: 1)),
                                  child: const Text("Copy Json"),
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
          SizedBox(
            width: 300,
            child: GetBuilder<BoardController>(
                init: Get.find<BoardController>(tag: "boardController"),
                initState: (_) {},
                builder: (controller) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: const Color.fromARGB(255, 49, 49, 49),
                        child: Row(
                          children: [
                            Text(
                              controller.selectedWidget?.name ?? "",
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                            ),
                            Expanded(
                                child: Text(
                              controller.selectedWidget?.keyID ?? "",
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
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
                            child: const Text('Remove Item'),
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
                                : const Text("Please select any Item"),
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
