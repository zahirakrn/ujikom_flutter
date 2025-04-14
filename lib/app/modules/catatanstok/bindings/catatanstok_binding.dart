import 'package:get/get.dart';

import '../controllers/catatanstok_controller.dart';

class CatatanstokBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatatanstokController>(
      () => CatatanstokController(),
    );
  }
}
