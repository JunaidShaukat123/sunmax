import 'package:flutter/material.dart';

import '/core/app_export.dart';

class OnboardingScreen extends GetWidget<OnboardingController> {
  const OnboardingScreen({super.key});

  Widget page({
    String? imagePath,
    required String title,
    required String subtitle,
  }) {
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
        Text(title, style: theme.textTheme.headlineSmall),
        SizedBox(height: 18.h),
        Text(
          subtitle,
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
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 24.h, top: 36.h, end: 24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 14.h),
            Align(
              alignment: Alignment.centerRight,
              child: CustomElevatedButton(
                width: 80.h,
                height: 36.h,
                text: "lbl_skip".tr,
                onPressed: controller.onSkip,
                buttonStyle: CustomButtonStyles.outlineGray,
                buttonTextStyle: CustomTextStyles.bodyLargeBluegray600,
              ),
            ),
            SizedBox(height: 14.h),
            Expanded(
              child: PageView.builder(
                itemCount: controller.onboarding.length,
                scrollDirection: Axis.horizontal,
                controller: controller.pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) {
                  final onboarding = controller.onboarding[index];
                  return page(
                    title: onboarding.title,
                    subtitle: onboarding.subtitle,
                    imagePath: onboarding.imagePath,
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),
            SizedBox(
              height: 10.h,
              child: Obx(
                () => AnimatedSmoothIndicator(
                  activeIndex: controller.currentIndex.value,
                  onDotClicked: (index) {
                    controller.onPageChanged(index);
                  },
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
    );
  }
}
