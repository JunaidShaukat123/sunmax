import 'package:flutter/material.dart';
import '/core/app_export.dart';

class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colorScheme.onPrimary,
      body: SafeArea(
        child: SizedBox(
          height: SizeUtils.height,
          width: double.maxFinite,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                height: SizeUtils.height,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsetsDirectional.all(24.h),
                      decoration: AppDecoration.fillWhiteA.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL24,
                      ),
                      child: Column(
                        spacing: 30,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildEmailone(),
                          CustomElevatedButton(
                            text: "lbl_send_code".tr.toUpperCase(),
                          ),
                          SizedBox(height: 352.h),
                        ],
                      ),
                    ),
                    _buildStackforgotpass(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailone() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_email".tr.toUpperCase(),
            style: CustomTextStyles.bodyMediumBluegray9000313,
          ),
          CustomTextFormField(
            controller: controller.emailthreeController,
            hintText: "msg_example_gmail_com".tr,
            hintStyle: CustomTextStyles.bodyMediumBluegray900_1,
            textInputAction: TextInputAction.done,
            contentPadding: EdgeInsetsDirectional.symmetric(
              horizontal: 18.h,
              vertical: 20.h,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildStackforgotpass() {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: SizedBox(
        height: 354.h,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsetsDirectional.only(top: 116.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "lbl_forgot_password".tr,
                      style: theme.textTheme.headlineLarge,
                    ),
                    Text(
                      "msg_please_sign_in_to".tr,
                      style: CustomTextStyles.bodyLargeOrange50d8,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              padding: EdgeInsetsDirectional.symmetric(vertical: 50.h),
              decoration: AppDecoration.column16,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomAppBar(
                    height: 44.h,
                    leadingWidth: 68.h,
                    leading: AppbarLeadingIconbuttonTwo(
                      imagePath: ImageConstant.chevronLeft,
                      margin: EdgeInsetsDirectional.only(start: 24.h),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
