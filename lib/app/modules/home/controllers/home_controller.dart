import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:transport/app/data/models/chat.dart';
import 'package:transport/app/data/models/consignment.dart';
import 'package:transport/app/data/repositories/chat_repository.dart';
import 'package:transport/app/data/repositories/consignments_repository.dart';
import 'package:transport/app/data/services/auth_service.dart';
import 'package:transport/app/routes/app_pages.dart';

class HomeController extends GetxController {
  late RxInt currentIndex;
  late RxList<Consignment> consignments;
  late StreamSubscription<QuerySnapshot<Consignment>> listener;

  late TextEditingController fromController;
  late TextEditingController toController;

  @override
  void onInit() {
    fromController = TextEditingController();
    toController = TextEditingController();
    currentIndex = 0.obs;
    consignments = <Consignment>[].obs;
    listenToConsignmentStream();
    super.onInit();
  }

  void listenToConsignmentStream() {
    listener =
        Get.find<ConsignmentRepository>().streamConsignments().listen((event) {
      consignments.value = event.docs.map((e) => e.data()).toList();
    });
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  Future<void> onMessageRequest(Consignment consignment) async {
    Get.toNamed(Routes.LOADING, arguments: "Loading...");
    final uid = Get.find<AuthService>().userId;
    Chat chat =
        await Get.find<ChatRepository>().initiateChat([uid, consignment.uid]);
    Get.back();
    Get.toNamed(Routes.CHAT, arguments: chat);
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
