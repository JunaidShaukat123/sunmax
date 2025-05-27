import 'package:flutter/material.dart';

import '/core/app_export.dart';

class VerificationScreen extends GetWidget<VerificationController> {
  const VerificationScreen({super.key});

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
                        borderRadius: BorderRadiusStyle.roundedBorder24,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildRowcodeone(),
                          SizedBox(height: 6.h),
                          SizedBox(
                            width: double.maxFinite,
                            child: Obx(
                              () => CustomPinCodeTextField(
                                context: Get.context!,
                                controller: controller.otpController.value,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          CustomElevatedButton(
                            text: "lbl_verify".tr.toUpperCase(),
                          ),
                          SizedBox(height: 352.h),
                        ],
                      ),
                    ),
                    _buildStackverificati(),
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
  Widget _buildRowcodeone() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl_code".tr.toUpperCase(),
            style: CustomTextStyles.bodyMediumBluegray9000313,
          ),
          SizedBox(
            width: 108.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 2.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: " "),
                        TextSpan(
                          text: "lbl_resend_in_50sec".tr,
                          style: CustomTextStyles.titleSmallBluegray90003,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: 52.h,
                  child: Divider(color: appTheme.blueGray90003),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildStackverificati() {
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
                margin: EdgeInsetsDirectional.only(top: 114.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "lbl_verification".tr,
                      style: theme.textTheme.headlineLarge,
                    ),
                    SizedBox(height: 4.h),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "msg_we_have_sent_a_code".tr,
                        style: CustomTextStyles.bodyLargeWhiteA70016_2,
                      ),
                    ),
                    Text(
                      "msg_example_gmail_com".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              padding: EdgeInsetsDirectional.symmetric(vertical: 50.h),
              decoration: AppDecoration.column17,
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
