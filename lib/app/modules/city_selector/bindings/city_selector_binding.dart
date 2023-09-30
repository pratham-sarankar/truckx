import 'package:get/get.dart';

import '../controllers/city_selector_controller.dart';

class CitySelectorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CitySelectorController>(
      () => CitySelectorController(),
    );
  }
}
