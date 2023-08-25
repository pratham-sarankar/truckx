import 'dart:math';

import 'package:get/get.dart';
import 'package:transport/app/data/models/consignment_card.dart';

class HomeController extends GetxController {
  late RxInt currentIndex;
  late RxList<Consignment> consignments;

  @override
  void onInit() {
    currentIndex = 0.obs;
    consignments = <Consignment>[].obs;
    _fillConsignmentsWithExample();
    super.onInit();
  }

  void _fillConsignmentsWithExample() {
    //This function is just for providing example data
    List<String> cities = [
      "Delhi",
      "Mumbai",
      "Chennai",
      "Kolkata",
      "Bangalore"
    ];
    List<String> products = [
      "Shoes",
      "Clothes",
      "Electronics",
      "Furniture",
      "Books"
    ];
    List<String> logisticsCompanies = ["Nike", "Adidas", "UPS", "FedEx", "DHL"];

    Random random = Random();

    for (int i = 0; i < 10; i++) {
      Consignment consignment = Consignment(
        from: cities[random.nextInt(cities.length)],
        to: cities[random.nextInt(cities.length)],
        product: products[random.nextInt(products.length)],
        price: random.nextDouble() * 100,
        date: DateTime.now().subtract(
            Duration(days: random.nextInt(7), minutes: random.nextInt(1440))),
        advance: random.nextDouble() * 50,
        logisticsName:
            logisticsCompanies[random.nextInt(logisticsCompanies.length)],
      );
      print("Adding consignment : ${consignment.from}");
      consignments.add(consignment);
    }
  }

  void changeIndex(int index) {
    currentIndex.value = index;
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
