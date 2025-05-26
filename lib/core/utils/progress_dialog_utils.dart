import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressDialog {
  static bool isVisible = false;

  ///common method for showing progress dialog
  static void onStart({bool isCancellable = false}) async {
    if (!isVisible) {
      Get.dialog(
        Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void onStop() {
    if (isVisible) Get.back();
    isVisible = false;
  }
}
