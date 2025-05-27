import 'package:flutter/material.dart';

import '/core/app_export.dart';

class OnboardingController extends GetxController {
  RxInt currentIndex = 0.obs;
  final pageController = PageController(initialPage: 0);

  final preference = Get.find<Preference>();

  List onboarding = <Onboarding>[
    Onboarding(
      id: 1,
      title: 'msg_onboarding_title_1'.tr,
      imagePath: ImageConstant.onboarding1,
      subtitle: 'msg_onboarding_subtitle_1'.tr,
    ),
    Onboarding(
      id: 2,
      title: 'msg_onboarding_title_2'.tr,
      imagePath: ImageConstant.onboarding2,
      subtitle: 'msg_onboarding_subtitle_2'.tr,
    ),
    Onboarding(
      id: 3,
      title: 'msg_onboarding_title_3'.tr,
      imagePath: ImageConstant.onboarding3,
      subtitle: 'msg_onboarding_subtitle_3'.tr,
    ),
    Onboarding(
      id: 4,
      title: 'msg_onboarding_title_4'.tr,
      imagePath: ImageConstant.onboarding4,
      subtitle: 'msg_onboarding_subtitle_4'.tr,
    ),
  ];

  void onPageChanged(int value) {
    currentIndex.value = value;
    pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onSkip() {
    preference.setOnboarding(false);
    Get.offAllNamed(AppRoutes.become);
  }

  void onNext() {
    if (currentIndex.value < onboarding.length - 1) {
      currentIndex.value++;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      preference.setOnboarding(false);
      Get.offAllNamed(AppRoutes.become);
    }
  }
}
