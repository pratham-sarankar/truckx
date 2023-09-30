import 'package:get/get.dart';
import 'package:transport/app/data/models/chat.dart';
import 'package:transport/app/data/repositories/chat_repository.dart';
import 'package:transport/app/data/services/auth_service.dart';

class InboxController extends GetxController {
  late RxList<Chat> chats;

  @override
  void onInit() {
    super.onInit();
    initializeList();
  }

  void initializeList() async {
    chats = <Chat>[].obs;
    chats.value = await Get.find<ChatRepository>().getChats();
  }

  Future<String> getTilePhoto(Chat chat) async {
    String id = chat.participants[0] == Get.find<AuthService>().userId
        ? chat.participants[1]
        : chat.participants[0];
    return (await Get.find<ChatRepository>().getUserPhoto(id));
  }

  Future<String> getTileTitle(Chat chat) async {
    if (chat.participants.length == 2) {
      String id = chat.participants[0] == Get.find<AuthService>().userId
          ? chat.participants[1]
          : chat.participants[0];
      return (await Get.find<ChatRepository>().getUserName(id));
    } else {
      return "${chat.participants.length} users";
    }
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
    super.onClose();
  }
}
