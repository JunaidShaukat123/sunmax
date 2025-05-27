import 'package:flutter/material.dart';

import '/core/app_export.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              height: SizeUtils.height,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  _buildColumnlogin(),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsetsDirectional.all(24.h),
                    decoration: AppDecoration.fillWhiteA.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL24,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildEmailone(),
                        SizedBox(height: 24.h),
                        _buildPass(),
                        SizedBox(height: 24.h),
                        _buildRowrememberme(),
                        SizedBox(height: 28.h),
                        CustomElevatedButton(
                          text: "lbl_log_in".tr.toUpperCase(),
                        ),
                        SizedBox(height: 38.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "msg_don_t_have_an_account".tr,
                              style: CustomTextStyles.bodyLargeBluegray600,
                            ),
                            Align(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: Text(
                                "lbl_sign_up".tr.toUpperCase(),
                                style: CustomTextStyles.titleSmallYellow900,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 26.h),
                        Text(
                          "lbl_or".tr,
                          style: CustomTextStyles.bodyLargeBluegray600,
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsetsDirectional.symmetric(
                            horizontal: 40.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIconButton(
                                height: 62.h,
                                width: 62.h,
                                padding: EdgeInsetsDirectional.all(22.h),
                                decoration:
                                    IconButtonStyleHelper.fillErrorContainer,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgFacebook,
                                ),
                              ),
                              CustomIconButton(
                                height: 62.h,
                                width: 62.h,
                                padding: EdgeInsetsDirectional.all(20.h),
                                decoration: IconButtonStyleHelper.fillOnError,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgTrash,
                                ),
                              ),
                              CustomIconButton(
                                height: 62.h,
                                width: 62.h,
                                padding: EdgeInsetsDirectional.all(20.h),
                                decoration: IconButtonStyleHelper.fillGray,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgUser,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 14.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnlogin() {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsetsDirectional.symmetric(vertical: 118.h),
        decoration: AppDecoration.column14,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("lbl_log_in".tr, style: theme.textTheme.headlineLarge),
            Text(
              "msg_please_sign_in_to".tr,
              style: CustomTextStyles.bodyLargeWhiteA70016,
            ),
            SizedBox(height: 52.h),
          ],
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
            hintStyle: theme.textTheme.bodyMedium!,
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
  Widget _buildPass() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_password".tr.toUpperCase(),
            style: CustomTextStyles.bodyMediumBluegray9000313,
          ),
          Obx(
            () => CustomTextFormField(
              controller: controller.passwordtwoController,
              hintText: "lbl".tr,
              hintStyle: CustomTextStyles.bodyMedium_1,
              textInputAction: TextInputAction.done,
              suffix: InkWell(
                onTap: () {
                  controller.isShowPassword.value =
                      !controller.isShowPassword.value;
                },
                child: Container(
                  margin: EdgeInsetsDirectional.fromSTEB(
                    16.h,
                    22.h,
                    18.h,
                    22.h,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.eye,
                    height: 16.h,
                    width: 18.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              suffixConstraints: BoxConstraints(maxHeight: 62.h),
              obscureText: controller.isShowPassword.value,
              contentPadding: EdgeInsetsDirectional.symmetric(
                horizontal: 18.h,
                vertical: 22.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowrememberme() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => CustomCheckboxButton(
              text: "lbl_remember_me".tr,
              value: controller.remembermeone.value,
              padding: EdgeInsetsDirectional.symmetric(vertical: 2.h),
              textStyle: CustomTextStyles.bodyMediumBluegray40001,
              onChange: (value) {
                controller.remembermeone.value = value;
              },
            ),
          ),
          Text(
            "lbl_forgot_password".tr,
            style: CustomTextStyles.bodyMediumYellow900_1,
          ),
        ],
      ),
    );
  }
}
