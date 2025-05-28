import 'package:flutter/widgets.dart';

import '/core/app_export.dart';

class Password extends StatefulWidget {
  final String? label;
  final String? hintText;
  final bool uppercase;
  final bool isConfirmPassword;
  final TextEditingController? controller;
  final TextEditingController? passwordController;

  const Password({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.uppercase = true,
    this.passwordController,
    this.isConfirmPassword = false,
  });

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final RxBool isShowPassword = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Input(
        controller: widget.controller,
        prefixIcon: ImageConstant.lock,
        obscureText: isShowPassword.value,
        textInputAction: TextInputAction.done,
        hintText: widget.hintText ?? "**********".tr,
        label: widget.uppercase
            ? widget.label?.toUpperCase()
            : widget.label?.tr,
        suffixIcon: isShowPassword.value
            ? ImageConstant.eye
            : ImageConstant.eyeOff,
        validator: (input) {
          if (widget.isConfirmPassword) {
            return Validator.isConfirmPassword(
              input,
              widget.passwordController!.text,
            );
          } else {
            return Validator.isPassword(input);
          }
        },
        onTapSuffix: () {
          isShowPassword.value = !isShowPassword.value;
        },
      ),
    );
  }
}
