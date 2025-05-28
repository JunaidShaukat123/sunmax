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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(() {
                          String provider = controller.provider.value;
                          if (provider == "email") {
                            return Input(
                              validator: Validator.isEmail,
                              prefixIcon: ImageConstant.email,
                              label: "lbl_email".tr.toUpperCase(),
                              hintText: "msg_example_gmail_com".tr,
                              controller: controller.emailController,
                            );
                          } else {
                            return PhoneNumber(
                              hintText: "msg_1234567890".tr,
                              validator: Validator.isPhoneNumber,
                              flagEmoji: controller.flagEmoji.value,
                              controller: controller.phoneController,
                              countryCode: controller.phoneCode.value,
                              label: "lbl_phone_number".tr.toUpperCase(),
                              onChanged: (value) {
                                console.log(value.toJson());
                                controller.phoneCode.value = value.phoneCode;
                                controller.flagEmoji.value = value.flagEmoji;
                              },
                            );
                          }
                        }),
                        SizedBox(height: 24.h),
                        Password(
                          label: "lbl_password".tr.toUpperCase(),
                          controller: controller.passwordController,
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
                        SizedBox(height: 12.h),
                        CustomElevatedButton(
                          text: "lbl_sign_in".tr.toUpperCase(),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.onSignIn(processing: true);
                            }
                          },
                        ),
                        SizedBox(height: 12.h),
                        Obx(() {
                          String provider = controller.provider.value;
                          if (provider == "email") {
                            return CustomElevatedButton(
                              text: "lbl_sign_in_via_phone".tr.toUpperCase(),
                              buttonStyle: CustomButtonStyles.outlineGray,
                              buttonTextStyle:
                                  CustomTextStyles.bodyLargeBluegray600,
                              onPressed: () {
                                controller.provider.value = "phone";
                                controller.emailController.clear();
                              },
                            );
                          }
                          return CustomElevatedButton(
                            text: "lbl_sign_in_via_email".tr.toUpperCase(),
                            buttonStyle: CustomButtonStyles.outlineGray,
                            buttonTextStyle:
                                CustomTextStyles.bodyLargeBluegray600,
                            onPressed: () {
                              controller.provider.value = "email";
                              controller.phoneController.clear();
                            },
                          );
                        }),
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
