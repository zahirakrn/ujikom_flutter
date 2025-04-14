import 'package:get/get.dart';
import 'package:project_ujikom/app/modules/transaksi/controllers/transaksi_controller.dart';

class TransaksiBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<TransaksiController>(
      () => TransaksiController(),
      );
  }
}

