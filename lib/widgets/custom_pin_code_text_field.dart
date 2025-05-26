import 'package:flutter/material.dart';

import '../core/app_export.dart';

// ignore_for_file: must_be_immutable
class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField({
    super.key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  });
  final AlignmentGeometry? alignment;
  final BuildContext context;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  Function(String) onChanged;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? AlignmentDirectional.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
    appContext: context,
    controller: controller,
    length: 6,
    keyboardType: TextInputType.number,
    textStyle: textStyle ?? CustomTextStyles.titleMediumBluegray90003_2,
    hintStyle: hintStyle ?? CustomTextStyles.titleMediumBluegray90003_2,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    enableActiveFill: true,
    pinTheme: PinTheme(
      fieldHeight: 62.h,
      fieldWidth: 62.h,
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(10.h),
      inactiveColor: appTheme.whiteA700,
      inactiveFillColor: appTheme.gray10004,
      activeColor: appTheme.whiteA700,
      activeFillColor: appTheme.gray10004,
      selectedFillColor: appTheme.gray10004,
      selectedColor: appTheme.whiteA700,
    ),
    onChanged: (value) => onChanged(value),
    validator: validator,
  );
}
