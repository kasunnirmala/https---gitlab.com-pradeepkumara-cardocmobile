import 'package:cardoc/model/category/category_list.dart';
import 'package:cardoc/service/category_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  CategoryService categoryService = Get.find<CategoryService>();
  Rx<CategoryList> categories = CategoryList().obs;

  @override
  void onReady() {
    _getAllCategories();
    super.onReady();
  }

  Future _getAllCategories() async {
    categories.value= await categoryService.getAllCategories();
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


}
