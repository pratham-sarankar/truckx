import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:transport/app/modules/profile/views/profile_view.dart';
import 'package:transport/app/widgets/consignment_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(CupertinoIcons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(IconlyLight.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(IconlyLight.profile),
                label: "Profile",
              ),
            ],
            currentIndex: controller.currentIndex.value,
            onTap: (value) {
              controller.changeIndex(value);
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: [
              _buildHomeView(),
              const ProfileView(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHomeView() {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
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
          DraggableScrollableSheet(
            initialChildSize: 0.60,
            minChildSize: 0.60,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, -5),
                      blurRadius: 20,
                      color: Colors.grey.withOpacity(0.2),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Obx(() {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      controller: scrollController,
                      itemCount: controller.consignments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ConsignmentCard(
                          consignment: controller.consignments[index],
                        );
                      },
                    );
                  }),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
