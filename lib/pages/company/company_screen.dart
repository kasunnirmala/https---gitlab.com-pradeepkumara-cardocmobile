import 'package:auto_route/auto_route.dart';
import 'package:cardoc/pages/company/company_controller.dart';
import 'package:cardoc/pages/home/filter/filter_controller.dart';
import 'package:cardoc/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:map_location_picker/map_location_picker.dart';

@RoutePage()
class CompanyScreen extends GetView<CompanyScreenController> {
  final bool isEditable;
  const CompanyScreen({super.key, this.isEditable = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Center(
            child: FormBuilder(
              key: controller.formKey.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.jpg',
                    width: 100,
                    height: 100,
                  ),
                 SizedBox(height:controller.kGap),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FormBuilderTextField(
                      enabled: isEditable,
                      name: FormKeys.name.toString(),
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                 SizedBox(height:controller.kGap),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FormBuilderTextField(
                      enabled: isEditable,
                      name: FormKeys.address.toString(),
                      decoration: const InputDecoration(
                        labelText: 'Address',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                 SizedBox(height:controller.kGap),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FormBuilderTextField(
                      enabled: isEditable,
                      name: FormKeys.description.toString(),
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                 SizedBox(height:controller.kGap),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FormBuilderPhoneField(
                      enabled: isEditable,
                      name: FormKeys.contactNumber.toString(),
                      defaultSelectedCountryIsoCode: "LK",
                      countryFilterByIsoCode: const ["LK"],
                      decoration: const InputDecoration(
                        labelText: 'Mobile Number',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                  SizedBox(height:controller.kGap),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FormBuilderDropdown<DataModel>(
                      enabled: isEditable,
                      items: controller.allCategories
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.title),
                              ))
                          .toList(),
                      name: FormKeys.category.toString(),
                      decoration: const InputDecoration(
                        labelText: 'Category',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                 SizedBox(height:controller.kGap),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FormBuilderFilterChip<DataModel>(
                      enabled: isEditable,
                      options: controller.allMakes
                          .map((e) => FormBuilderChipOption(
                                value: e,
                                child: Text(e.title),
                              ))
                          .toList(),
                      name: FormKeys.anyMakes.toString(),
                      decoration: const InputDecoration(
                        labelText: 'Makes',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                 SizedBox(height:controller.kGap),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FormBuilderFilterChip<DataModel>(
                      enabled: isEditable,
                      options: controller.allTypes
                          .map((e) => FormBuilderChipOption(
                                value: e,
                                child: Text(e.title),
                              ))
                          .toList(),
                      name: FormKeys.anyTypes.toString(),
                      decoration: const InputDecoration(
                        labelText: 'Types',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                 SizedBox(height:controller.kGap),
            
                  isEditable
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: () async {
                              controller.formKey.value.currentState
                                  ?.saveAndValidate();
                              await controller.onSavePressed();
                            },
                            child: const Text('Save'),
                          ),
                        )
                      : Container(),
                    
                    ElevatedButton(
                      child: const Text('Pick location'),
                      onPressed: () async {
                        EasyLoading.show(status: 'loading...');
                        Position position=await controller.getCurrentGeoLocation();
                        EasyLoading.dismiss();
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MapLocationPicker(
                                apiKey: GOOGLE_MAP_API_KEY,
                                canPopOnNextButtonTaped: true,
                                currentLatLng:LatLng(position.latitude, position.longitude),
                                region: "lk",
                                onNext: (GeocodingResult? result) {
                                  controller.selectedLatLng.value=LatLng(result!.geometry.location.lat, result.geometry.location.lng);
                                },
                                onSuggestionSelected: (PlacesDetailsResponse? result) {
                                  controller.selectedLatLng.value=LatLng(result!.result.geometry!.location.lat, result.result.geometry!.location.lng);
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
