import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:wid_gen/features/controllers/wid_gen_controller.dart';
import 'package:wid_gen/wid_gen.dart';
import 'package:wid_gen/widgets/ff_appbar.dart';
import 'package:wid_gen/widgets/ff_container.dart';

class FFScaffold extends WidGen {
  // FFScaffold({Key? key}) : super(key: key);
  FFScaffold({Key? key, required String keyID}) : super(key: key, keyID: keyID);

  @override
  String? get json => "";

  // @override
  // String? get keyID => const Uuid().v1();

  @override
  Widget get widgetProperties => Scaffold(
      // body: widBody,
      // appBar: (widBar is ActionBar)? widBar!.getWidget().wiget :null,
      );

  @override
  Widget build(BuildContext context) {
    putController(context);
    return GetBuilder<WidGenController>(
        init: controller,
        initState: (_) {},
        builder: (_) {
          return Scaffold(
            body: controller.getValue<Widget?>("body") != null
                ? controller.getValue<Widget?>("body")!
                : DragTarget<Widget>(
                    onWillAccept: (v) {
                      return controller.getValue<Widget?>("body") != null
                          ? false
                          : true;
                    },
                    onAccept: (value) {
                      controller.setValue("body", value);
                    },
                    onLeave: (value) {
                      print("Leave");
                    },
                    builder: (_, candidateData, rejectedData) {
                      return controller.getValue<Widget?>("body") != null
                          ? controller.getValue<Widget?>("body")!
                          : Placeholder(
                              color: Colors.red,
                            );
                    },
                  ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: FFActionBar(height: 50, keyID: const Uuid().v1()),
            ),
          );
        });
  }
}
