import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transport/app/routes/app_pages.dart';

class EditProfileController extends GetxController {
  late GlobalKey<FormState> formKey;
  late String displayName;
  late Rx<String?> photoUrl;
  late String email;

  User? get user => FirebaseAuth.instance.currentUser;

  Future<void> save() async {
    try {
      if (!formKey.currentState!.validate()) {
        return;
      }
      formKey.currentState!.save();
      Get.toNamed(Routes.LOADING, arguments: "Updating Profile...");
      if (user?.displayName != displayName) {
        await user?.updateDisplayName(displayName);
      }
      if (user?.email != email) {
        await user?.updateEmail(email);
      }
      Get.back();
    } on FirebaseException catch (e) {
      Get.back();
      Get.snackbar(
        "Error",
        e.message ?? "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
    }
  }

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    displayName = user?.displayName ?? "";
    email = user?.email ?? "";
    photoUrl = Rx<String?>(user?.photoURL);
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

  void updateImage() async {
    XFile? xfile = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);
    if (xfile != null) {
      Get.toNamed(Routes.LOADING, arguments: "Uploading image...");
      TaskSnapshot taskSnapshot = await FirebaseStorage.instance
          .ref("profiles/${user?.uid}")
          .putFile(File(xfile.path));
      String url = await taskSnapshot.ref.getDownloadURL();
      await user?.updatePhotoURL(url);
      photoUrl.value = url;
      Get.back();
    }
  }
}
