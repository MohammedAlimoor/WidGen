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
  String? get name => "Scaffold";

  @override
  String? get json => "";

  // @override
  // String? get keyID => const Uuid().v1();

  @override
  Widget get widgetProperties => Container();

  @override
  Widget build(BuildContext context) {
    putController(context);
    return GetBuilder<WidGenController>(
        init: controller,
        initState: (_) {},
        builder: (_) {
          return Scaffold(
            body: controller.getValue<WidGen?>("body") != null
                ? controller.getValue<WidGen?>("body")!
                : DragTarget<WidGen>(
                    onWillAccept: (v) {
                      return controller.getValue<WidGen?>("body") != null
                          ? false
                          : true;
                    },
                    onAccept: (value) {
                      controller.setValue<WidGen>("body", value);
                    },
                    onLeave: (value) {
                      print("Leave");
                    },
                    builder: (_, candidateData, rejectedData) {
                      return controller.getValue<WidGen?>("body") != null
                          ? controller.getValue<WidGen?>("body")!
                          : Placeholder(
                              color: Colors.red,
                            );
                    },
                  ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child:
              
              controller.getValue<WidGen?>("appBar") != null
                ? controller.getValue<WidGen?>("appBar")!
                : DragTarget<WidGen>(
                    onWillAccept: (v) {
                      if(v is FFActionBar && controller.getValue<WidGen?>("appBar") == null){
                        return true;
                      }else {
                        return false;
                      
                      }
                   
                    },
                    onAccept: (value) {
                      controller.setValue<WidGen>("appBar", value);
                    },
                    onLeave: (value) {
                      print("Leave");
                    },
                    builder: (_, candidateData, rejectedData) {
                      return controller.getValue<WidGen?>("appBar") != null
                          ? controller.getValue<WidGen?>("appBar")!
                          : Placeholder(
                              color: Colors.red,
                            );
                    },
                  )
                  ),
          );
        });
  }
}
