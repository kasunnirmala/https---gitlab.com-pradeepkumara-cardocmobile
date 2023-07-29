import 'package:cardoc/main.dart';
import 'package:cardoc/model/user/firebase_user.dart';
import 'package:cardoc/service/auth_service.dart';
import 'package:cardoc/util/app_router.dart';
import 'package:cardoc/util/app_router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

enum FormKeys { phoneNumber }

class LoginScreenController extends GetxController {
  Rx<GlobalKey<FormBuilderState>> formKey = GlobalKey<FormBuilderState>().obs;
  AuthService authService = Get.find<AuthService>();

  @override
  void onReady() {
      if (FirebaseAuth.instance.currentUser != null) {
        getIt<AppRouter>().replace(const HomeBaseRoute());
      }

    super.onReady();
  }

  Future<void> onLoginPressed() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber:
          "+94${formKey.value.currentState?.fields[FormKeys.phoneNumber.toString()]?.value}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e);
      },
      codeSent: (String verificationId, int? resendToken) async {
        String? smsCode = await getIt<AppRouter>().push(const OTPRoute());
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode!);
        await auth.signInWithCredential(credential);
        bool response = await authService
            .createUser(FirebaseUser.fromUser(auth.currentUser!));
        if (response)  getIt<AppRouter>().replace(const HomeBaseRoute());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
