import '/core/app_export.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(FCM());
    Get.put(Preference());
    Get.put(Api());
    Get.put(BroadcasterController());
  }
}
