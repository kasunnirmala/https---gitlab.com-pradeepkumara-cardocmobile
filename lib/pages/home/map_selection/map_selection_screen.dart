import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_selection_controller.dart';

class MapSelectionScreen extends GetView<MapSelectionScreenController> {
  const MapSelectionScreen({super.key});

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
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  Obx(() => GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: controller.initialPosition.value,
                        onMapCreated: (GoogleMapController mapController) {
                          controller.mapController.complete(mapController);
                          controller.getCurrentLocation();
                        },
                      )),
                  Positioned(
                    child: ElevatedButton(
                      onPressed: () => controller.searchLocations(context),
                      child: const Text("Search places"),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: FloatingActionButton.small(
                        onPressed: controller.getCurrentLocation,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        child: const Icon(FontAwesomeIcons.locationCrosshairs),
                      ))
                ],
              )),
        )
      ],
    );
  }
}
