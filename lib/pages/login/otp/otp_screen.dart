import 'package:auto_route/auto_route.dart';
import 'package:cardoc/pages/login/otp/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

@RoutePage<String>()
class OTPScreen extends GetView<OTPScreenController> {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OtpTextField(
          numberOfFields: 6,
          borderColor: const Color(0xFF512DA8),
          showFieldAsBox: true,
          onCodeChanged: (String code) {},
          onSubmit: (String verificationCode) {
            controller.onOTPsubmit(verificationCode);
          },
        ),
      ),
    );
  }
}
