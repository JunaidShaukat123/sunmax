import '/core/app_export.dart';

class BecomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BecomeController());
  }
}
