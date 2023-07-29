import 'package:auto_route/auto_route.dart';
import 'package:cardoc/pages/home/filter/filter_screen.dart';
import 'package:cardoc/util/constants.dart';
import 'package:cardoc/widgets/card_widget.dart';
import 'package:dynamic_fa_icons/dynamic_fa_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'home_controller.dart';

@RoutePage()
class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: ListTile(
                            leading:
                                const Icon(FontAwesomeIcons.magnifyingGlass),
                            title: const Text(
                              "Location",
                            ),
                            subtitle: const Text("Please select location"),
                            onTap: () async {
                              EasyLoading.show(status: 'loading...');
                              Position position =
                                  await controller.getCurrentGeoLocation();
                              EasyLoading.dismiss();
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MapLocationPicker(
                                      apiKey: GOOGLE_MAP_API_KEY,
                                      canPopOnNextButtonTaped: true,
                                      currentLatLng: LatLng(position.latitude,
                                          position.longitude),
                                      region: "lk",
                                      onNext: (GeocodingResult? result) {},
                                      onSuggestionSelected:
                                          (PlacesDetailsResponse? result) {},
                                    );
                                  },
                                ),
                              );
                              // showMaterialModalBottomSheet(
                              //   enableDrag: false,
                              //   context: context,
                              //   builder: (context) =>
                              //       const MapSelectionScreen(),
                              // );
                            },
                          )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            showMaterialModalBottomSheet(
                              context: context,
                              builder: (context) => const FilterScreen(),
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 60.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50.0,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  FontAwesomeIcons.sliders,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              )),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categories.value.categoryList?.length,
                    itemBuilder: (context, index) => Card(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(5),
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(DynamicFaIcons.getIconFromName(() {
                                List<String>? iconData = controller.categories
                                    .value.categoryList?[index].categoryLogo
                                    ?.split(" ");
                                if (iconData?.length == 2) {
                                  return iconData?[1].replaceFirst("fa-", "") ??
                                      '';
                                } else {
                                  return "";
                                }
                              }())),
                              Text(controller.categories.value
                                      .categoryList?[index].categoryName ??
                                  ''),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => const Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                elevation: 50,
                shadowColor: Colors.black,
                child: CardWidget()),
          ),
        )
      ],
    );
  }
}
