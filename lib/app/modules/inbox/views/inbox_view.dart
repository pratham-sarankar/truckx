import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:transport/app/routes/app_pages.dart';

import '../controllers/inbox_controller.dart';

class InboxView extends GetView<InboxController> {
  const InboxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Messages",
                    style: Get.textTheme.titleLarge!.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.75),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextField(
                      cursorColor: Colors.black87,
                      decoration: InputDecoration(
                        hintText: "Search",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10, top: 13),
                        prefixIcon: const Icon(IconlyLight.search),
                        prefixIconColor: Colors.black87,
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  for (var chat in controller.chats)
                    Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Get.toNamed(Routes.CHAT, arguments: chat);
                          },
                          leading: FutureBuilder(
                            future: controller.getTilePhoto(chat),
                            builder: (context, snapshot) {
                              return CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    NetworkImage(snapshot.data.toString()),
                              );
                            },
                          ),
                          title: FutureBuilder(
                            future: controller.getTileTitle(chat),
                            builder: (context, snapshot) {
                              return Text(snapshot.data.toString());
                            },
                          ),
                          subtitle: Text(chat.lastMessage ?? "Last Message"),
                          trailing: Text(
                              controller.getTileTime(chat.lastMessageTime)),
                        ),
                        const Divider(),
                      ],
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
