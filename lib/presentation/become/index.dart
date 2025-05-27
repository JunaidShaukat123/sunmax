import 'package:flutter/material.dart';

import '/core/app_export.dart';

class BecomeScreen extends GetWidget<BecomeController> {
  const BecomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: 24.h,
            top: 36.h,
            end: 24.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: 56.h,
                width: 108.h,
              ),
              SizedBox(height: 24.h),
              Text(
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
                "msg_lets_get_started".tr,
              ),
              SizedBox(height: 4.h),
              Text(
                "msg_to_start_to_be".tr,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyLargeBluegray600.copyWith(
                  height: 1.50,
                ),
              ),
              SizedBox(height: 30.h),
              CustomElevatedButton(
                text: "msg_as_a_user".tr.toUpperCase(),
                onPressed: controller.onAsUser,
              ),
              SizedBox(height: 14.h),
              CustomElevatedButton(
                text: "msg_as_a_partner".tr.toUpperCase(),
                onPressed: controller.onAsPartner,
              ),
              SizedBox(height: 14.h),
            ],
          ),
        ),
      ),
    );
  }
}
