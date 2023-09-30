import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:transport/app/data/models/message.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            FutureBuilder(
              future: controller.getPhoto(),
              builder: (context, snapshot) {
                return CircleAvatar(
                  backgroundImage: NetworkImage(
                    snapshot.data ??
                        "https://cdn-icons-png.flaticon.com/128/3135/3135715.png",
                  ),
                );
              },
            ),
            const SizedBox(width: 10),
            FutureBuilder(
              future: controller.getTitle(),
              builder: (context, snapshot) {
                return Text(snapshot.data ?? "");
              },
            ),
          ],
        ),
        titleSpacing: 0,
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(() {
              return Expanded(
                child: ListView(
                  reverse: true,
                  children: [
                    for (Message message in controller.messages)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          message.content,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextField(
                      cursorColor: Colors.black87,
                      controller: controller.messageController,
                      onSubmitted: (value) {
                        controller.sendMessage();
                      },
                      decoration: InputDecoration(
                        hintText: "Write a message",
                        contentPadding:
                            const EdgeInsets.only(bottom: 10, top: 13),
                        prefixIcon: const Icon(IconlyLight.edit),
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
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    controller.sendMessage();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.blue.shade400,
                    ),
                    minimumSize: MaterialStateProperty.all(
                      const Size(55, 47),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Icon(IconlyLight.send, color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
