import '/core/app_export.dart';

class SplashController extends GetxController {
  final preference = Get.find<Preference>();

  @override
  void onReady() {
    super.onReady();
    String? become = preference.become;
    String? bearer = preference.bearer;
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

    if (become == null) {
      Get.offNamed(AppRoutes.become);
      return;
    }

    if (bearer == null) {
      Get.offNamed(AppRoutes.signin);
      return;
    }
  }
}
