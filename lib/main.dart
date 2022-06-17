import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wid_gen/ide.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WedGen',
      enableLog: true,
      debugShowCheckedModeBanner: false,

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
      home: Banner(
          location: BannerLocation.topEnd,
          message: "BETA 1.0",
          color: Colors.blueAccent,
          child: IDE()),
    );
  }
}
