import 'package:get/get.dart';

class LoadingController extends GetxController {
  late final String text;

  @override
  void onInit() {
    text = Get.arguments as String;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
