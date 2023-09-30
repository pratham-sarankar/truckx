import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:transport/app/data/models/vehicle.dart';
import 'package:transport/app/routes/app_pages.dart';

import '../controllers/my_vehicles_controller.dart';

class MyVehiclesView extends GetView<MyVehiclesController> {
  const MyVehiclesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.VEHICLE_FORM);
        },
        child: const Icon(CupertinoIcons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        children: [
          Text(
            "My Vehicles",
            style: Get.textTheme.titleLarge!.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.75),
            ),
          ),
          const SizedBox(height: 20),
          Obx(() {
            return Column(
              children: [
                for (final vehicle in controller.vehicles)
                  SizedBox(
                    height: 200,
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 30),
                      elevation: 8,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 40,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(10)),
                              child: Image.network(
                                vehicle.photoUrl ??
                                    'https://picsum.photos/200/300',
                                height: 180,
                                fit: BoxFit.cover,
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 60,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 10, left: 10, bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    vehicle.number,
                                    style: Get.textTheme.titleLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(vehicle.mfgYear.toString(),
                                      style: Get.textTheme.bodyMedium),
                                  Chip(
                                    label: Text(
                                      vehicle.type.name,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.75),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    backgroundColor: Colors.grey.shade100,
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            Get.toNamed(
                                              Routes.VEHICLE_FORM,
                                              arguments: vehicle,
                                            );
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              Colors.green.shade50,
                                            ),
                                            overlayColor: MaterialStateProperty
                                                .resolveWith<Color?>(
                                              (Set<MaterialState> states) {
                                                if (states.contains(
                                                    MaterialState.hovered)) {
                                                  return Colors.green
                                                      .withOpacity(0.04);
                                                }
                                                if (states.contains(
                                                        MaterialState
                                                            .focused) ||
                                                    states.contains(
                                                        MaterialState
                                                            .pressed)) {
                                                  return Colors.green
                                                      .withOpacity(0.12);
                                                }
                                                return null; // Defer to the widget's default.
                                              },
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                              Colors.green.shade900,
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(IconlyLight.edit, size: 18),
                                              SizedBox(width: 2),
                                              Text("Edit"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return CupertinoAlertDialog(
                                                  title: const Text(
                                                      "Delete Vehicle"),
                                                  content: const Text(
                                                      "Are you sure you want to delete this vehicle?"),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      isDefaultAction: true,
                                                      child: const Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                    CupertinoDialogAction(
                                                      onPressed: () {
                                                        controller
                                                            .deleteVehicle(
                                                                vehicle);
                                                        Get.back();
                                                      },
                                                      isDestructiveAction: true,
                                                      child: const Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              Colors.red.shade50,
                                            ),
                                            overlayColor: MaterialStateProperty
                                                .resolveWith<Color?>(
                                              (Set<MaterialState> states) {
                                                if (states.contains(
                                                    MaterialState.hovered)) {
                                                  return Colors.red
                                                      .withOpacity(0.04);
                                                }
                                                if (states.contains(
                                                        MaterialState
                                                            .focused) ||
                                                    states.contains(
                                                        MaterialState
                                                            .pressed)) {
                                                  return Colors.red
                                                      .withOpacity(0.12);
                                                }
                                                return null; // Defer to the widget's default.
                                              },
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                              Colors.red.shade900,
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(IconlyLight.delete,
                                                  size: 18),
                                              SizedBox(width: 2),
                                              Text("Delete"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          })
        ],
      ),
    );
  }
}
