import 'package:auto_route/auto_route.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:cardoc/pages/home_base/home_base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class HomeBaseScreen extends GetView<HomeBaseScreenController> {
  const HomeBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: const AutoRouter(),
      bottomNavigationBar: Obx(() => BottomBarInspiredFancy(
            items: controller.items,
            backgroundColor: Colors.white,
            color: const Color.fromARGB(255, 255, 122, 122),
            colorSelected: const Color.fromARGB(255, 248, 6, 6),
            indexSelected: controller.selectedIndex.value,
            top: 15,
            bottom: 15,
            pad: 0,
            onTap: controller.onNavigationChanged,
          )),
    ));
  }
}
