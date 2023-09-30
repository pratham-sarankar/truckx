import 'package:get/get.dart';
import 'package:transport/app/modules/my_vehicles/controllers/vehicle_form_controller.dart';

import '../controllers/my_vehicles_controller.dart';

class MyVehiclesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyVehiclesController>(
      () => MyVehiclesController(),
    );
    Get.lazyPut<VehicleFormController>(
      () => VehicleFormController(),
    );
  }
}
