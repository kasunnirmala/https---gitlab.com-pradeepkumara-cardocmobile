import 'package:cardoc/service/make_service.dart';
import 'package:cardoc/service/type_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class FilterScreenController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  MakeService makeService = Get.find<MakeService>();
  TypeService typeService = Get.find<TypeService>();

  RxList<DataModel> allTypes = <DataModel>[].obs;
  RxList<DataModel> allMakes = <DataModel>[].obs;

  @override
  void onReady() {
    _getAllTypes();
    _getAllMakes();
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

  void onFilterButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }
}

class DataModel {
  DataModel({required this.id, required this.title});
  final int id;
  final String title;
}
