import '/core/app_export.dart';

class SplashController extends GetxController {
  final preference = Get.find<Preference>();

  @override
  void onReady() {
    super.onReady();
    Language language = preference.language;
    bool onboarding = preference.onboarding;

    if (language.code == null) {
      Get.offNamed(AppRoutes.language);
      return;
    }

    if (onboarding) {
      Get.offNamed(AppRoutes.onboarding);
      return;
    }
  }
}
