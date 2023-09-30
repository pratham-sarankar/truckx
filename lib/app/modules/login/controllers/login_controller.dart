import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:transport/app/routes/app_pages.dart';

class LoginController extends GetxController {
  late final TextEditingController phoneNumberController;

  @override
  void onInit() {
    phoneNumberController = TextEditingController();
    phoneNumberController.addListener(phoneNumberListener);
    super.onInit();
  }

  void phoneNumberListener() {
    String value = phoneNumberController.text;
    if (value.isNotEmpty) {
      if (!value.startsWith('+')) {
        phoneNumberController.value = TextEditingValue(
          text: '+91$value',
          selection: TextSelection.fromPosition(
            TextPosition(offset: value.length + 3),
          ),
        );
      }

      if (value.length > 13) {
        phoneNumberController.value = TextEditingValue(
          text: value.substring(0, 13),
          selection: TextSelection.fromPosition(
            const TextPosition(offset: 13),
          ),
        );
      }
    }
  }

  void login() async {
    if (phoneNumberController.text.length < 13 ||
        !phoneNumberController.text.startsWith("+")) {
      Get.snackbar(
        'Alert',
        'Please enter a valid phone number',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    Get.toNamed(Routes.LOADING, arguments: "Sending OTP...");
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumberController.text,
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        Get.back();
        Get.snackbar(
          'Error',
          error.message ?? 'Something went wrong',
          snackPosition: SnackPosition.BOTTOM,
        );
        throw error;
      },
      codeSent: (verificationId, forceResendingToken) {
        Get.back();
        Get.toNamed(
          Routes.OTP,
          arguments: {
            'phoneNumber': phoneNumberController.text,
            'verificationId': verificationId,
            'forceResendingToken': forceResendingToken,
          },
        );
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    super.onClose();
  }
}
