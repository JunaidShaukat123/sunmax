import 'package:flutter/material.dart';

import '/core/app_export.dart';

class SignInController extends GetxController {
  final props = Props();

  final api = Get.find<Api>();
  final preference = Get.find<Preference>();

  final emailController = TextEditingController(text: 'user@example.com');
  final phoneController = TextEditingController();
  final passwordController = TextEditingController(text: 'Password@123');

  /// 'email' : 'phone'
  Rx<String> provider = 'email'.obs;

  Rx<bool> viaEmail = true.obs;
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> remembermeone = false.obs;

  RxString flagEmoji = "🇵🇰".obs;
  RxString phoneCode = "92".obs;

  Rx<bool> identifier = true.obs;

  String get trace {
    final stackTrace = StackTrace.current;
    final frames = stackTrace.toString().split('\n');

    if (frames.length > 1) {
      final callerFrame = frames[1].trim();
      final regex = RegExp(r'#\d+\s+(\S+)\.(\S+)\s+\(.*\)');
      final match = regex.firstMatch(callerFrame);

      if (match != null) {
        final className = match.group(1);
        final methodName = match.group(2);
        return "$className::$methodName";
      } else {
        return "$runtimeType::unknown";
      }
    } else {
      return "$runtimeType::unknown";
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  Future<void> onSignIn({bool processing = false}) async {
    try {
      props.setProcessing();

      SigninRequest request = SigninRequest(
        provider: provider.value,
        identifier: provider.value == 'email'
            ? emailController.text
            : Phone(
                prefix: phoneCode.value,
                number: phoneController.text,
              ).toJson(),
        password: passwordController.text,
      );

      SigninResponse response = await api.post(
        processing: processing,
        data: request.toJson(),
        model: SigninResponse(),
        path: Endpoints.signin,
      );

      if (response.status) {
        await preference.setToken(response.token);
        await preference.setUserData(response.data);
        props.setNone(data: response.data);
      } else {
        throw CustomException(response.message);
      }
    } on NoInternetException catch (error) {
      console.error(error, trace);
      props.setError(error: error.message);
    } on CustomException catch (error) {
      console.error(error, trace);
      props.setError(error: error.message);
    } on SigninResponse catch (error) {
      console.error(error, trace);
      props.setError(error: error.message);
    } catch (error) {
      console.error(error, trace);
      props.setError(error: "$error");
    }
  }
}
