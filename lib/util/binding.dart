import 'package:cardoc/pages/company/company_controller.dart';
import 'package:cardoc/pages/home/filter/filter_controller.dart';
import 'package:cardoc/pages/home/home/home_controller.dart';
import 'package:cardoc/pages/home/map_selection/map_selection_controller.dart';
import 'package:cardoc/pages/home_base/home_base_controller.dart';
import 'package:cardoc/pages/login/login/login_controller.dart';
import 'package:cardoc/pages/login/otp/otp_controller.dart';
import 'package:cardoc/service/auth_service.dart';
import 'package:cardoc/service/category_service.dart';
import 'package:cardoc/service/company_service.dart';
import 'package:cardoc/service/make_service.dart';
import 'package:cardoc/service/type_service.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
    Get.lazyPut<OTPScreenController>(() => OTPScreenController());

    Get.lazyPut<HomeBaseScreenController>(() => HomeBaseScreenController());
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.lazyPut<FilterScreenController>(() => FilterScreenController());
    Get.lazyPut<MapSelectionScreenController>(
        () => MapSelectionScreenController());

    Get.lazyPut<CompanyScreenController>(() => CompanyScreenController());

    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<CategoryService>(() => CategoryService());
    Get.lazyPut<MakeService>(() => MakeService());
    Get.lazyPut<TypeService>(() => TypeService());
    Get.lazyPut<CompanyService>(() => CompanyService());
  }
}
