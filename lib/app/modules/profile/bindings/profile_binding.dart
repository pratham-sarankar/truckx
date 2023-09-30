import 'package:get/get.dart';
import 'package:transport/app/modules/profile/controllers/edit_profile_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
