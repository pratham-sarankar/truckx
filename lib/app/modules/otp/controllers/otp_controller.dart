import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:transport/app/routes/app_pages.dart';

class OtpController extends GetxController {
  late final String phoneNumber;
  late String otp;

  @override
  void onInit() {
    phoneNumber = Get.arguments['phoneNumber'];
    otp = "";
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void verify() async {
    Get.toNamed(Routes.LOADING, arguments: "Verifying OTP...");
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed(Routes.HOME);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
