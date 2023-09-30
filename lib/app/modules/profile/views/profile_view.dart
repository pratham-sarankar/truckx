import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:transport/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: Get.width, height: 40),
              CircleAvatar(
                radius: Get.width * 0.15,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                  controller.user.value!.photoURL ??
                      "https://cdn-icons-png.flaticon.com/128/3135/3135715.png",
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(radius: 8, backgroundColor: Colors.green),
                  const SizedBox(width: 8),
                  Text(
                    controller.user.value!.displayName ?? "Full Name",
                    style: Get.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(controller.user.value!.email ?? "example@gmail.com"),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.EDIT_PROFILE);
                      },
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(5),
                        ),
                      ),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconlyBold.profile,
                            color: Colors.grey.shade700,
                            size: 25,
                          )
                        ],
                      ),
                      title: const Text("Profile"),
                      subtitle: const Text("Edit your profile"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {},
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(5),
                        ),
                      ),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconlyBold.setting,
                            color: Colors.grey.shade700,
                            size: 25,
                          )
                        ],
                      ),
                      title: const Text("Settings"),
                      subtitle: const Text("Manage your settings"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: controller.signOut,
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(
                    Size(Get.width - 40, 50),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  side: MaterialStatePropertyAll(
                    BorderSide(
                      width: 1,
                      color: Colors.red.shade500,
                    ),
                  ),
                  splashFactory: NoSplash.splashFactory,
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.white;
                    } else {
                      return Colors.red.shade500;
                    }
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red.shade600;
                    } else {
                      return Colors.red.withOpacity(0.02);
                    }
                  }),
                ),
                child: const Text("Log Out"),
              )
            ],
          );
        }),
      ),
    );
  }
}
