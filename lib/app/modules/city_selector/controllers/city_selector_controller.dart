import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:transport/app/data/models/place.dart';
import 'package:transport/app/data/repositories/place_repository.dart';

class CitySelectorController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Future<List<Place>> search(String query) async {
    var places = await Get.find<PlaceRepository>().searchPlaces(query);
    return places;
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
