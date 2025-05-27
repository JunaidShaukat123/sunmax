import 'package:flutter/material.dart';

import '/core/app_export.dart';

class SignInScreen extends GetWidget<SignInController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: SizeUtils.height,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsetsDirectional.symmetric(vertical: 118.h),
                    decoration: AppDecoration.column14,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "lbl_sign_in".tr,
                          style: theme.textTheme.headlineLarge,
                        ),
                        Text(
                          "msg_please_sign_in_to".tr,
                          style: CustomTextStyles.bodyLargeWhiteA70016,
                        ),
                        SizedBox(height: 52.h),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsetsDirectional.all(24.h),
                  decoration: AppDecoration.fillWhiteA.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL24,
                  ),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(
                          () => Input(
                            validator: Validator.isPhoneNumber,
                            suffixIcon: controller.viaEmail.value
                                ? ImageConstant.phone
                                : ImageConstant.email,
                            label: controller.viaEmail.value
                                ? "lbl_email".tr.toUpperCase()
                                : "lbl_phone_number".tr.toUpperCase(),
                            hintText: controller.viaEmail.value
                                ? "msg_example_gmail_com".tr
                                : "msg_1234567890".tr,
                            controller: controller.emailthreeController,
                            onTapSuffix: () {
                              controller.viaEmail.value =
                                  !controller.viaEmail.value;
                            },
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Obx(
                          () => Input(
                            hintText: "**********".tr,
                            validator: Validator.isPassword,
                            suffixIcon: controller.isShowPassword.value
                                ? ImageConstant.eye
                                : ImageConstant.eyeOff,
                            label: "lbl_password".tr.toUpperCase(),
                            textInputAction: TextInputAction.done,
                            obscureText: controller.isShowPassword.value,
                            controller: controller.passwordtwoController,
                            onTapSuffix: () {
                              controller.isShowPassword.value =
                                  !controller.isShowPassword.value;
                            },
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => CustomCheckboxButton(
                                text: "lbl_remember_me".tr,
                                value: controller.remembermeone.value,
                                padding: EdgeInsetsDirectional.symmetric(
                                  vertical: 2.h,
                                ),
                                textStyle:
                                    CustomTextStyles.bodyMediumBluegray40001,
                                onChange: (value) {
                                  controller.remembermeone.value = value;
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.forgotPassword);
                              },
                              child: Text(
                                "lbl_forgot_password".tr,
                                style: CustomTextStyles.bodyMediumYellow900_1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 28.h),
                        CustomElevatedButton(
                          text: "lbl_sign_in".tr.toUpperCase(),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                          },
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
                            SizedBox(width: 8.h),
                            Align(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: Text(
                                "lbl_sign_up".tr.toUpperCase(),
                                style: CustomTextStyles.titleSmallYellow900,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 42.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
