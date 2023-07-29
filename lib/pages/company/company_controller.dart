import 'package:cardoc/model/company/create_company.dart';
import 'package:cardoc/pages/home/filter/filter_controller.dart';
import 'package:cardoc/service/company_service.dart';
import 'package:cardoc/service/make_service.dart';
import 'package:cardoc/service/type_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:map_location_picker/map_location_picker.dart';

import '../../service/category_service.dart';

enum FormKeys {
  category,
  name,
  description,
  contactNumber,
  address,
  anyMakes,
  anyTypes
}

class CompanyScreenController extends GetxController {
  Rx<GlobalKey<FormBuilderState>> formKey = GlobalKey<FormBuilderState>().obs;
  double? kGap = 10;

  Rx<LatLng> selectedLatLng = const LatLng(0, 0).obs;

  MakeService makeService = Get.find<MakeService>();
  TypeService typeService = Get.find<TypeService>();
  CompanyService companyService = Get.find<CompanyService>();
  CategoryService categoryService = Get.find<CategoryService>();

  RxList<DataModel> allTypes = <DataModel>[].obs;
  RxList<DataModel> allMakes = <DataModel>[].obs;
  RxList<DataModel> allCategories = <DataModel>[].obs;
  

  @override
  void onReady() {
    _getAllTypes();
    _getAllMakes();
    _getAllCategories();
    super.onReady();
  }

  Future _getAllTypes() async {
    allTypes.value = (await typeService.getAllTypes())
            .anyTypeList
            ?.map((type) => DataModel(id: type.id!, title: type.name!))
            .toList() ??
        [];
  }

  Future _getAllMakes() async {
    allMakes.value = (await makeService.getAllMakes())
            .anyMakeList
            ?.map((make) => DataModel(id: make.id!, title: make.name!))
            .toList() ??
        [];
  }

  Future _getAllCategories() async {
    allCategories.value = (await categoryService.getAllCategories())
            .categoryList
            ?.map((category) =>
                DataModel(id: category.id!, title: category.categoryName!))
            .toList() ??
        [];
  }

  Future<Position> getCurrentGeoLocation() async {
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

  Future<void> onSavePressed() async {
    CreateCompany createCompany = CreateCompany(
      name: formKey.value.currentState?.fields[FormKeys.name.toString()]?.value,
      description: formKey
          .value.currentState?.fields[FormKeys.description.toString()]?.value,
      contactNumber: formKey
          .value.currentState?.fields[FormKeys.contactNumber.toString()]?.value,
      address: formKey
          .value.currentState?.fields[FormKeys.address.toString()]?.value,
      anyMakes: (formKey.value.currentState
              ?.fields[FormKeys.anyMakes.toString()]?.value as List<DataModel>)
          .map((e) => e.id)
          .toList(),
      anyTypes: (formKey.value.currentState
              ?.fields[FormKeys.anyTypes.toString()]?.value as List<DataModel>)
          .map((e) => e.id)
          .toList(),
      categoryId: (formKey.value.currentState
              ?.fields[FormKeys.category.toString()]?.value as DataModel)
          .id,
      publish: true,
      latitude: selectedLatLng.value.latitude,
      longitude: selectedLatLng.value.longitude,
      userId: FirebaseAuth.instance.currentUser?.uid,
    );
    await companyService.createCompany(createCompany);
  }
}
