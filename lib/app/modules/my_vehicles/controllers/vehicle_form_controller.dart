import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transport/app/data/models/vehicle.dart';
import 'package:transport/app/data/repositories/vehicle_repository.dart';
import 'package:transport/app/data/services/auth_service.dart';
import 'package:transport/app/routes/app_pages.dart';

class VehicleFormController extends GetxController {
  late Vehicle vehicle;
  late Rx<String?> photoUrl;
  late TextEditingController numberController;
  late GlobalKey<FormState> formKey;
  late final bool isEdit;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    if (Get.arguments != null) {
      isEdit = true;
      vehicle = Get.arguments as Vehicle;
    } else {
      isEdit = false;
      vehicle = Vehicle(
        id: "",
        ownerId: Get.find<AuthService>().userId,
        type: VehicleType.xl,
        mfgYear: DateTime.now().year,
        number: "",
      );
    }
    numberController = TextEditingController(text: vehicle.number);
    photoUrl = vehicle.photoUrl.obs;
    super.onInit();
  }

  void save() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Get.toNamed(Routes.LOADING, arguments: "Saving vehicle...");
      if (isEdit) {
        await Get.find<VehicleRepository>().updateVehicle(vehicle);
      } else {
        await Get.find<VehicleRepository>().addVehicle(vehicle);
      }
      Get.back();
      Get.back();
    }
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
          .ref("vehicles/${vehicle.id}")
          .putFile(File(xfile.path));
      String url = await taskSnapshot.ref.getDownloadURL();
      vehicle.photoUrl = url;
      photoUrl.value = url;
      Get.back();
    }
  }
}
