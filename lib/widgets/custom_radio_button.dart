import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomRadioButton extends StatelessWidget {
  CustomRadioButton({
    super.key,
    this.text,
    this.value,
    this.width,
    this.padding,
    this.iconSize,
    this.overflow,
    this.gradient,
    this.alignment,
    this.textStyle,
    this.decoration,
    this.groupValue,
    this.isRightCheck,
    this.textAlignment,
    this.backgroundColor,
    required this.onChange,
    this.isExpandedText = false,
  });

  dynamic value;
  final String? text;
  final double? width;
  final double? iconSize;
  final bool? isRightCheck;
  final String? groupValue;
  final Gradient? gradient;
  final bool isExpandedText;
  final TextStyle? textStyle;
  final TextOverflow? overflow;
  final Color? backgroundColor;
  final TextAlign? textAlignment;
  final BoxDecoration? decoration;
  final Function(String) onChange;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
          alignment: alignment ?? AlignmentDirectional.center,
          child: buildRadioButtonWidget,
        )
        : buildRadioButtonWidget;
  }

  bool get isGradient => gradient != null;
  BoxDecoration get gradientDecoration => BoxDecoration(gradient: gradient);
  Widget get buildRadioButtonWidget => GestureDetector(
    onTap: () {
      onChange(value!);
    },
    child: Container(
      decoration: decoration,
      width: width,
      padding: padding,
      child:
          (isRightCheck ?? false) ? rightSideRadioButton : leftSideRadioButton,
    ),
  );
  Widget get leftSideRadioButton => Row(
    children: [
      radioButtonWidget,
      SizedBox(width: text != null && text!.isNotEmpty ? 8 : 0),
      isExpandedText ? Expanded(child: textWidget) : textWidget,
    ],
  );
  Widget get rightSideRadioButton => Row(
    children: [
      isExpandedText ? Expanded(child: textWidget) : textWidget,
      SizedBox(width: text != null && text!.isNotEmpty ? 8 : 0),
      radioButtonWidget,
    ],
  );
  Widget get textWidget => Text(
    text ?? "",
    textAlign: textAlignment ?? TextAlign.start,
    overflow: overflow,
    style: textStyle,
  );
  Widget get radioButtonWidget => SizedBox(
    height: iconSize,
    width: iconSize,
    child: Radio<dynamic>(
      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
      value: value ?? "",
      groupValue: groupValue,
      onChanged: (value) {
        onChange(value!);
      },
    ),
  );
  BoxDecoration get radioButtonDecoration =>
      BoxDecoration(color: backgroundColor);
}
