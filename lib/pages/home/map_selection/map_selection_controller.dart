import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

class MapSelectionScreenController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  Rx<CameraPosition> initialPosition = const CameraPosition(
    target: LatLng(0, 0),
    zoom: 14.4746,
  ).obs;
  late GoogleMapsPlaces _places;

  @override
  void onInit() {
    super.onInit();
    initials();
  }

  Future initials() async {
    _places = GoogleMapsPlaces(
      apiKey: "AIzaSyCuMVghUcokPMJK7Z9t3OKLKfsijIQGUNI",
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );
  }

  Future getCurrentLocation() async {
    Position currentLoc = await _getCurrentGeoLocation();
    CameraPosition currentCameraPosition = CameraPosition(
      target: LatLng(currentLoc.latitude, currentLoc.longitude),
      zoom: 14.4746,
    );
    initialPosition.value = currentCameraPosition;
    // await (await mapController.future)
    //     .animateCamera(CameraUpdate.newCameraPosition(currentCameraPosition));
  }

  Future<Position> _getCurrentGeoLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> searchLocations(BuildContext context) async {
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: "AIzaSyCuMVghUcokPMJK7Z9t3OKLKfsijIQGUNI",
      mode: Mode.overlay,
      types: [],
      strictbounds: false,
      language: "en",
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      components: [Component(Component.country, "lk")],
    );

    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(p?.placeId ?? "");
    final lat = detail.result.geometry?.location.lat;
    final lng = detail.result.geometry?.location.lng;

    await (await mapController.future)
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat ?? 0, lng ?? 0),
      zoom: 14.4746,
    )));
  }
}
