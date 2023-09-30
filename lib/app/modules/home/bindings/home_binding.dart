import 'package:get/get.dart';
import 'package:transport/app/modules/inbox/controllers/inbox_controller.dart';
import 'package:transport/app/modules/my_vehicles/controllers/my_vehicles_controller.dart';
import 'package:transport/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //Put controllers
    //Note: Don't use lazy put here, it will cause an error.
    Get.put<HomeController>(HomeController());
    Get.put<ProfileController>(ProfileController());
    Get.put<MyVehiclesController>(MyVehiclesController());
    Get.put<InboxController>(InboxController());
  }
}
