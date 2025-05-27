import 'package:flutter/material.dart';

import '/core/app_export.dart';

class SignInController extends GetxController {
  final preference = Get.find<Preference>();

  final emailthreeController = TextEditingController();
  final passwordtwoController = TextEditingController();

  Rx<bool> viaEmail = true.obs;
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> remembermeone = false.obs;

  @override
  void onClose() {
    super.onClose();
    emailthreeController.dispose();
    passwordtwoController.dispose();
  }

  void onSkip() {
    preference.setOnboarding(true);
    Get.offAllNamed(AppRoutes.signin);
  }

  void onNext() {
    preference.setOnboarding(true);
    Get.offAllNamed(AppRoutes.signin);
  }
}
