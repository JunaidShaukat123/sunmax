import '/core/app_export.dart';

class SplashController extends GetxController {
  final preference = Get.find<Preference>();

  @override
  void onReady() {
    super.onReady();
    String? token = preference.token;
    String? become = preference.become;
    UserData? user = preference.user.value;
    Language language = preference.language;
    bool onboarding = preference.onboarding;
    bool rememberMe = preference.rememberMe;

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

    if (token == null) {
      Get.offNamed(AppRoutes.signin);
      return;
    }

    if (!rememberMe) {
      Get.offNamed(AppRoutes.signup);
      return;
    }
  }
}
