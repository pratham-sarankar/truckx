import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:transport/app/data/models/chat.dart';
import 'package:transport/app/data/models/message.dart';
import 'package:transport/app/data/repositories/chat_repository.dart';
import 'package:transport/app/data/services/auth_service.dart';

class ChatController extends GetxController {
  late final Chat chat;
  late RxList<Message> messages;
  late final StreamSubscription<QuerySnapshot<Message>> subscription;
  late final TextEditingController messageController;

  @override
  void onInit() {
    messageController = TextEditingController();
    chat = Get.arguments;
    messages = <Message>[].obs;
    listenToMessageStream();
    super.onInit();
  }

  listenToMessageStream() {
    subscription =
        Get.find<ChatRepository>().streamMessages(chat).listen((event) {
      messages.value = event.docs.map((e) => e.data()).toList();
    });
  }

  Future<String> getPhoto() async {
    String id = chat.participants[0] == Get.find<AuthService>().userId
        ? chat.participants[1]
        : chat.participants[0];
    return (await Get.find<ChatRepository>().getUserPhoto(id));
  }

  Future<String> getTitle() async {
    if (chat.participants.length == 2) {
      String id = chat.participants[0] == Get.find<AuthService>().userId
          ? chat.participants[1]
          : chat.participants[0];
      return (await Get.find<ChatRepository>().getUserName(id));
    } else {
      return "${chat.participants.length} users";
    }
  }

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      var message = Message(
        id: "",
        senderId: Get.find<AuthService>().userId,
        content: messageController.text,
        timestamp: DateTime.now(),
      );
      await Get.find<ChatRepository>().sendMessage(chat, message);
      messageController.clear();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }
}
