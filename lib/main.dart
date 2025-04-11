import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_ujikom/app/modules/profile/controllers/profile_controller.dart';

import 'app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';

  void main() async {
    await GetStorage.init();
    Get.put(ProfileController()); 
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TB Kurnia Jaya",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
      ),
    ),
  );
  }
