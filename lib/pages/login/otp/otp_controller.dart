import 'package:cardoc/main.dart';
import 'package:cardoc/util/app_router.dart';
import 'package:get/get.dart';

class OTPScreenController extends GetxController {
  void onOTPsubmit(String otp) {
    getIt<AppRouter>().pop(otp);
  }
}
