import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_ujikom/app/modules/barang/controllers/barang_controller.dart';
import 'package:project_ujikom/app/modules/catatankeuangan/controllers/catatankeuangan_controller.dart';
import 'package:project_ujikom/app/modules/catatanstok/controllers/catatanstok_controller.dart';
import 'package:project_ujikom/app/modules/penggajian/controllers/penggajian_controller.dart';
import 'package:project_ujikom/app/modules/profile/controllers/profile_controller.dart';
import 'package:project_ujikom/app/modules/transaksi/controllers/transaksi_controller.dart';

import 'app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';

  void main() async {
    await GetStorage.init();
    Get.lazyPut<BarangController>(() => BarangController());
    Get.lazyPut<TransaksiController>(() => TransaksiController());
    Get.lazyPut<PenggajianController>(() => PenggajianController());
    Get.lazyPut<CatatanstokController>(() => CatatanstokController());
    Get.lazyPut<CatatankeuanganController>(() => CatatankeuanganController());
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
