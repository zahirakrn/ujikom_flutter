import 'package:get/get.dart';

import '../controllers/catatankeuangan_controller.dart';

class CatatankeuanganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatatankeuanganController>(
      () => CatatankeuanganController(),
    );
  }
}
