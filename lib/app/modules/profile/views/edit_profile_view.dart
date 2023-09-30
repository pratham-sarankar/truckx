import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:transport/app/modules/profile/controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [
                Obx(
                  () => CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: Get.width * 0.2,
                    backgroundImage: NetworkImage(
                      controller.photoUrl.value ??
                          "https://cdn-icons-png.flaticon.com/128/3135/3135715.png",
                    ),
                    child: IconButton(
                      onPressed: controller.updateImage,
                      icon: Icon(
                        IconlyLight.camera,
                        size: Get.width * 0.08,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                TextFormField(
                  initialValue: controller.user?.displayName,
                  onSaved: (newValue) {
                    controller.displayName = newValue!;
                  },
                  decoration: const InputDecoration(
                    hintText: "Full Name",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: controller.user?.email,
                  onSaved: (newValue) {
                    controller.email = newValue!;
                  },
                  decoration: const InputDecoration(
                    hintText: "example@gmail.com",
                  ),
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    controller.save();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.blue.shade800;
                        } else {
                          return Colors.blue.shade900;
                        }
                      },
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white.withOpacity(0.75);
                        } else {
                          return Colors.white;
                        }
                      },
                    ),
                    minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50),
                    ),
                    textStyle: MaterialStateProperty.all(
                      Get.textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
