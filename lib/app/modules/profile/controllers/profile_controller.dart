import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/app/data/repositories/user_repository.dart';
import 'package:transport/app/data/services/auth_service.dart';
import 'package:transport/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  late Rx<User?> user;

  @override
  void onInit() {
    user = FirebaseAuth.instance.currentUser!.obs;
    Get.find<AuthService>().streamUser().listen((event) async {
      if (event == null) Get.offAllNamed(Routes.LOGIN);
      user(event);
      await Get.find<UserRepository>().updateUser(event!);
    });
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
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAllNamed(Routes.LOGIN);
              },
              child: const Text('Log Out'),
            ),
          ],
        );
      },
    );
  }
}
