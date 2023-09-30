import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:transport/app/data/models/vehicle.dart';
import 'package:transport/app/data/repositories/vehicle_repository.dart';

class MyVehiclesController extends GetxController {
  late RxList<Vehicle> vehicles;
  late StreamSubscription<QuerySnapshot<Vehicle>> listener;

  @override
  void onInit() {
    vehicles = <Vehicle>[].obs;
    listenToVehicleStream();
    super.onInit();
  }

  void listenToVehicleStream() {
    listener = Get.find<VehicleRepository>().streamVehicles().listen((event) {
      vehicles.value = event.docs.map((e) => e.data()).toList();
    });
  }

  void deleteVehicle(Vehicle vehicle) {
    Get.find<VehicleRepository>().deleteVehicle(vehicle);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    listener.cancel();
    super.onClose();
  }
}
