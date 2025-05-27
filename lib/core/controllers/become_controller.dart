import '/core/app_export.dart';

class BecomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  final preference = Get.find<Preference>();

  void onAsUser() {
    preference.setBecome('user');
    Get.offAllNamed(AppRoutes.signin);
  }

  void onAsPartner() {
    preference.setBecome('partner');
    Get.offAllNamed(AppRoutes.signin);
  }
}
