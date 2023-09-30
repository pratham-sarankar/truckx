import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:transport/app/data/models/vehicle.dart';
import 'package:transport/app/modules/my_vehicles/controllers/vehicle_form_controller.dart';

class VehicleFormView extends GetView<VehicleFormController> {
  const VehicleFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
          children: [
            Text(
              controller.isEdit ? "Edit Vehicle" : "Add Vehicle",
              style: Get.textTheme.titleLarge!.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                controller.updateImage();
              },
              child: Obx(
                () => Container(
                  width: Get.width,
                  height: Get.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    image: controller.photoUrl.value != null
                        ? DecorationImage(
                            alignment: Alignment.center,
                            image: NetworkImage(
                              controller.photoUrl.value!,
                            ),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: Icon(
                    IconlyLight.camera,
                    size: 50,
                    color: Colors.black.withOpacity(1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextFormField(
                cursorColor: Colors.black87,
                controller: controller.numberController,
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: 'AA 00 AA 0000', // Define the desired mask pattern
                    filter: {"A": RegExp(r'[A-Za-z]'), "0": RegExp(r'[0-9]')},
                  ),
                ],
                onChanged: (newValue) {
                  controller.numberController.text = newValue.toUpperCase();
                  controller.numberController.selection =
                      TextSelection.fromPosition(
                    TextPosition(
                        offset: controller.numberController.text.length),
                  );
                },
                onSaved: (newValue) {
                  controller.vehicle.number = newValue!;
                },
                decoration: InputDecoration(
                  hintText: "MH 12 AB 1234",
                  contentPadding: const EdgeInsets.only(bottom: 10, top: 13),
                  prefixIcon: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/11202/11202880.png",
                    height: 25,
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 50,
                  ),
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
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextFormField(
                cursorColor: Colors.black87,
                onSaved: (newValue) {
                  controller.vehicle.mfgYear = int.parse(newValue!);
                },
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: '####', // Define the year mask pattern (four digits)
                    filter: {"#": RegExp(r'[0-9]')}, // Allow only digits
                  ),
                ],
                initialValue: controller.vehicle.mfgYear.toString(),
                decoration: InputDecoration(
                  hintText: "Manufacturing Year",
                  contentPadding: const EdgeInsets.only(bottom: 10, top: 13),
                  prefixIcon: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/2370/2370264.png",
                    height: 25,
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 50,
                  ),
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
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<VehicleType>(
                  onSaved: (newValue) {
                    controller.vehicle.type = newValue!;
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  items: [
                    for (final item in VehicleType.values)
                      DropdownMenuItem(
                        value: item,
                        child: Text(item.name),
                      )
                  ],
                  value: controller.vehicle.type,
                  onChanged: (value) {},
                  borderRadius: BorderRadius.circular(10),
                  elevation: 5,
                  icon: const Icon(IconlyLight.arrow_down_2, size: 18),
                ),
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
    );
  }
}
