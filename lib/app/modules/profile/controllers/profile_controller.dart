import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  @override
  void onInit() {
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

  void signOut() {
    showCupertinoDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            'Log Out',
            style: Get.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure?',
            style: Get.textTheme.bodyLarge,
          ),
          actions: [
            CupertinoDialogAction(
              textStyle: Get.textTheme.bodyLarge!.copyWith(
                color: Get.theme.primaryColor,
                fontWeight: FontWeight.w400,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              textStyle: Get.textTheme.bodyLarge!.copyWith(
                color: Colors.red.shade600,
                fontWeight: FontWeight.w600,
              ),
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: const Text('Log Out'),
            ),
          ],
        );
      },
    );
  }
}
