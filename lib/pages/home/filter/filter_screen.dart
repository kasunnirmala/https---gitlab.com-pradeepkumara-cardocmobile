import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'filter_controller.dart';

class FilterScreen extends GetView<FilterScreenController> {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.circleXmark),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        Obx(()=>Padding(
          padding: const EdgeInsets.all(10),
          child: FormBuilder(
            key: controller.formKey,
            child: Column(
              children: [
                FormBuilderDropdown(
                  decoration: const InputDecoration(labelText: 'Vehicle Type'),
                  name: 'vehicle_type',
                  items: controller.allTypes
                      .map((e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.title),
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderDropdown(
                  decoration: const InputDecoration(labelText: 'Vehicle Model'),
                  name: 'vehicle_model',
                  items: controller.allMakes
                      .map((e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.title),
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    child: const Text("Filter"),
                    onPressed: () => controller.onFilterButtonPressed(context),
                  ),
                )
              ],
            ),
          ),
        ),),
      ],
    );
  }
}
