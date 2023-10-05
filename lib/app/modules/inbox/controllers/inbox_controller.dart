import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:transport/app/data/models/chat.dart';
import 'package:transport/app/data/repositories/chat_repository.dart';
import 'package:transport/app/data/services/auth_service.dart';

class InboxController extends GetxController {
  late RxList<Chat> chats;
  late TextEditingController searchController;

  @override
  void onInit() {
    searchController = TextEditingController();
    searchController.addListener(addSearchListener);
    super.onInit();
    fetchChats();
  }

  void addSearchListener() {}

  void fetchChats() async {
    chats = <Chat>[].obs;
    chats.value = await Get.find<ChatRepository>().getChats();
  }

  String getTileTime(DateTime? time) {
    if (time == null) {
      return "";
    }
    return "${time.hour}:${time.minute}";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
