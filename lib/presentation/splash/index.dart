import 'package:flutter/material.dart';

import '/core/app_export.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgVectorStroke,
                height: 56.h,
                width: 108.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
