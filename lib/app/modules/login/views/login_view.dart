import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transport/app/widgets/login_button.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Hero(
            tag: "CloudLottie",
            child: Lottie.asset(
              "assets/lotties/cloud.json",
              width: Get.width,
              repeat: true,
            ),
          ),
          Hero(
            tag: "LogoLottie",
            child: Lottie.asset(
              "assets/lotties/logo.json",
              repeat: true,
              animate: true,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.phoneNumberController,
                    decoration: const InputDecoration(
                      hintText: "Enter Phone Number",
                      prefixIcon: Icon(
                        CupertinoIcons.phone,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ContinueButton(
                    onTap: controller.login,
                    text: "Continue",
                  ),
                  const Spacer(),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "By continuing you agree to our",
                      style: Get.textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: " Terms of Service ",
                          style: Get.textTheme.titleMedium!.copyWith(
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "and",
                          style: Get.textTheme.titleMedium!.copyWith(),
                        ),
                        TextSpan(
                          text: " Privacy Policy. ",
                          style: Get.textTheme.titleMedium!.copyWith(
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
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
