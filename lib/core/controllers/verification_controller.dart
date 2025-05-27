import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '/core/app_export.dart';

class VerificationController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }
}
