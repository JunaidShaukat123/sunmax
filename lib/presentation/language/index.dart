import 'package:flutter/material.dart';

import '/core/app_export.dart';

class LanguageScreen extends GetWidget<LanguageController> {
  const LanguageScreen({super.key});

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
                imagePath: ImageConstant.imgVectorStroke,
                height: 56.h,
                width: 108.h,
              ),
              SizedBox(height: 24.h),
              Text(
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
                "msg_please_select_your_preferred_language".tr,
              ),
              SizedBox(height: 4.h),
              Text(
                "msg_dont_worry_you_can_change_it_later".tr,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyLargeBluegray600.copyWith(
                  height: 1.50,
                ),
              ),
              SizedBox(height: 30.h),
              Obx(() {
                Props props = controller.props;
                if (props.isProcessing) {
                  return Container(
                    constraints: BoxConstraints(
                      minHeight: 100.h,
                      maxHeight: 250.h,
                    ),
                    child: ListView.separated(
                      itemCount: 2,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 8.h),
                      itemBuilder: (context, index) => Shimmer(
                        enabled: props.isProcessing,
                        background: appTheme.gray100,
                        foreground: appTheme.gray200,
                        child: CustomRadioButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 12.h,
                            horizontal: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: appTheme.gray10004,
                            borderRadius: BorderRadius.circular(8.h),
                          ),
                          text: "lbl_english".tr,
                          value: index == 0 ? true : false,
                          onChange: (value) {},
                        ),
                      ),
                    ),
                  );
                } else if (props.isError) {
                  return CustomErrorWidget(
                    error: props.error.value,
                    onRetry: controller.getLanguage,
                  );
                } else {
                  List<Language> languages = props.data.value;
                  return Container(
                    constraints: BoxConstraints(
                      minHeight: 100.h,
                      maxHeight: 250.h,
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: languages.length,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 8.h),
                      itemBuilder: (context, index) {
                        Language language = languages[index];
                        return Obx(
                          () => CustomRadioButton(
                            value: language.code,
                            text: language.displayName,
                            onChange: controller.onChangeLanguage,
                            groupValue: controller.selectedLanguage.value,
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: appTheme.gray10004,
                              borderRadius: BorderRadius.circular(8.h),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
              SizedBox(height: 14.h),
              CustomElevatedButton(
                text: "lbl_next".tr.toUpperCase(),
                onPressed: controller.onNext,
              ),
              SizedBox(height: 14.h),
            ],
          ),
        ),
      ),
    );
  }
}
