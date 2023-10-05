import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:transport/app/data/models/place.dart';

import '../controllers/city_selector_controller.dart';

class CitySelectorView extends GetView<CitySelectorController> {
  const CitySelectorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Autocomplete<Place>(
          optionsBuilder: (textEditingValue) async {
            if (textEditingValue.text == '') {
              return <Place>[];
            }
            var places = await controller.search(textEditingValue.text);
            return places;
          },
          displayStringForOption: (option) => option.name,
          optionsMaxHeight: 400,
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextField(
              autofocus: true,
              controller: textEditingController,
              focusNode: focusNode,
              onSubmitted: (value) {
                onFieldSubmitted();
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(IconlyLight.search),
                hintText: "Search City",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
