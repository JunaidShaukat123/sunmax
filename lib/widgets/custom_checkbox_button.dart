import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CustomCheckboxButton extends StatelessWidget {
  const CustomCheckboxButton({
    super.key,
    this.text,
    this.value,
    this.width,
    this.padding,
    this.iconSize,
    this.overflow,
    this.alignment,
    this.textStyle,
    this.decoration,
    this.isRightCheck,
    this.textAlignment,
    this.onChange,
    this.isExpandedText = false,
  });

  final bool? value;
  final String? text;
  final double? width;
  final double? iconSize;
  final bool? isRightCheck;
  final bool isExpandedText;
  final TextStyle? textStyle;
  final TextOverflow? overflow;
  final Function(bool)? onChange;
  final TextAlign? textAlignment;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? AlignmentDirectional.center,
            child: buildCheckBoxWidget,
          )
        : buildCheckBoxWidget;
  }

  Widget get buildCheckBoxWidget => GestureDetector(
    onTap: () {
      onChange?.call(value!);
    },
    child: Container(
      decoration: decoration,
      width: width,
      padding: padding,
      child: (isRightCheck ?? false) ? rightSideCheckbox : leftSideCheckbox,
    ),
  );
  Widget get leftSideCheckbox => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      checkboxWidget,
      SizedBox(width: text != null && text!.isNotEmpty ? 8 : 0),
      isExpandedText ? Expanded(child: textWidget) : textWidget,
    ],
  );
  Widget get rightSideCheckbox => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      isExpandedText ? Expanded(child: textWidget) : textWidget,
      SizedBox(width: text != null && text!.isNotEmpty ? 8 : 0),
      checkboxWidget,
    ],
  );
  Widget get textWidget => Text(
    text ?? "",
    textAlign: textAlignment ?? TextAlign.start,
    overflow: overflow,
    style: textStyle ?? CustomTextStyles.bodyMediumGray50013_1,
  );
  Widget get checkboxWidget => SizedBox(
    height: iconSize ?? 18.h,
    width: iconSize ?? 18.h,
    child: Checkbox(
      value: value ?? false,
      checkColor: appTheme.primary,
      activeColor: appTheme.whiteA700,
      side: WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return BorderSide(color: appTheme.primary, width: 1.h);
        }
        return BorderSide(color: appTheme.gray500, width: 1.h);
      }),
      onChanged: (value) {
        onChange?.call(value!);
      },
    ),
  );
}
