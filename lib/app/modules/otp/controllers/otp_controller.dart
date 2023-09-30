import 'package:get/get.dart';
import 'package:transport/app/data/services/auth_service.dart';
import 'package:transport/app/routes/app_pages.dart';

class OtpController extends GetxController {
  late final String phoneNumber;
  late final String verificationId;
  late String otp;

  @override
  void onInit() {
    phoneNumber = Get.arguments['phoneNumber'];
    verificationId = Get.arguments['verificationId'];
    otp = "";
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void verify() async {
    //Check if the otp has a valid format.
    if (otp.length < 6) {
      Get.snackbar(
        'Alert',
        'Please enter a valid OTP',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    //If the otp is valid, then verify the otp.
    var userCredentials =
        await Get.find<AuthService>().verifyOtp(verificationId, otp);
    if (userCredentials != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.back();
      Get.snackbar(
        'Error',
        'Invalid OTP',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
