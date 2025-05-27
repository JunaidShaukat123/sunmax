import 'package:flutter/material.dart';
import '/core/app_export.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailthreeController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    emailthreeController.dispose();
  }
}
