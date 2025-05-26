import 'package:flutter/material.dart';

import '/core/app_export.dart';

class OnboardingScreen extends GetWidget<OnboardingController> {
  const OnboardingScreen({super.key});

  Widget page() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 240.h,
          height: 292.h,
          margin: EdgeInsetsDirectional.only(start: 42.h, end: 44.h),
          decoration: BoxDecoration(
            color: appTheme.blueGray30001,
            borderRadius: BorderRadius.circular(12.h),
          ),
        ),
        SizedBox(height: 40.h),
        Text("msg_all_your_favorites".tr, style: theme.textTheme.headlineSmall),
        SizedBox(height: 18.h),
        Text(
          "msg_get_all_your_loved".tr,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: CustomTextStyles.bodyLargeBluegray600.copyWith(height: 1.50),
        ),
        SizedBox(height: 30.h),
      ],
    );
  }

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 14.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "lbl_skip".tr,
                  style: CustomTextStyles.bodyLargeBluegray600,
                ),
              ),
              SizedBox(height: 14.h),
              Expanded(
                child: PageView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  controller: controller.pageController,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return page();
                  },
                ),
              ),
              SizedBox(height: 30.h),
              SizedBox(
                height: 10.h,
                child: AnimatedSmoothIndicator(
                  activeIndex: 0,
                  count: 4,
                  effect: ScrollingDotsEffect(
                    spacing: 12,
                    activeDotColor: appTheme.yellow900,
                    dotColor: appTheme.red100,
                    dotHeight: 10.h,
                    dotWidth: 10.h,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
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
