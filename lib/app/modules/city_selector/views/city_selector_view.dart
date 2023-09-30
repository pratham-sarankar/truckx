import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

import '../controllers/city_selector_controller.dart';

class CitySelectorView extends GetView<CitySelectorController> {
  const CitySelectorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: "CloudLottie",
            child: Lottie.asset(
              "assets/lotties/cloud.json",
              width: Get.width,
              repeat: true,
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onTap: () async {},
                    decoration: InputDecoration(
                      prefixIcon: const Icon(CupertinoIcons.location),
                      suffixIcon: IconButton(
                        onPressed: () {
                          print("Hello world");
                        },
                        icon: const Icon(IconlyLight.arrow_down),
                      ),
                      hintText: "From",
                      fillColor: Get.theme.scaffoldBackgroundColor,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    onTap: () {
                      print("Hello world");
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(IconlyLight.location),
                      suffixIcon: IconButton(
                        onPressed: () {
                          print("Hello world");
                        },
                        icon: const Icon(IconlyLight.arrow_up),
                      ),
                      hintText: "To",
                      fillColor: Get.theme.scaffoldBackgroundColor,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(
                        Size(Get.width, 55),
                      ),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.blue.shade200;
                        }
                        return Colors.blue;
                      }),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      )),
                      splashFactory: NoSplash.splashFactory,
                      foregroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.white;
                          }
                          return Colors.white;
                        },
                      ),
                    ),
                    child: const Text(
                      "Search",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
