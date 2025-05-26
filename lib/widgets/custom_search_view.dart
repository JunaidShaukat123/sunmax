import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CustomSearchView extends StatelessWidget {
  const CustomSearchView({
    super.key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
  });
  final AlignmentGeometry? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? AlignmentDirectional.center,
            child: searchViewWidget,
          )
        : searchViewWidget;
  }

  Widget get searchViewWidget => Container(
    width: width ?? double.maxFinite,
    decoration: boxDecoration,
    child: TextFormField(
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(Get.context!).viewInsets.bottom,
      ),
      controller: controller,
      focusNode: focusNode,
      onTapOutside: (event) {
        if (focusNode != null) {
          focusNode?.unfocus();
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      autofocus: autofocus!,
      style: textStyle ?? CustomTextStyles.bodyMediumGray700,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      decoration: decoration,
      validator: validator,
      onChanged: (String value) {
        onChanged?.call(value);
      },
    ),
  );
  InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ?? CustomTextStyles.bodyMediumGray700,
    prefixIcon:
        prefix ??
        Container(
          margin: EdgeInsetsDirectional.fromSTEB(18.h, 22.h, 10.h, 22.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgRewind,
            height: 16.h,
            width: 14.h,
          ),
        ),
    prefixIconConstraints: prefixConstraints ?? BoxConstraints(maxHeight: 62.h),
    suffixIcon:
        suffix ??
        Padding(
          padding: EdgeInsetsDirectional.only(end: 15.h),
          child: IconButton(
            onPressed: () => controller!.clear(),
            icon: Icon(Icons.clear, color: Colors.grey.shade600),
          ),
        ),
    suffixIconConstraints: suffixConstraints ?? BoxConstraints(maxHeight: 62.h),
    isDense: true,
    contentPadding:
        contentPadding ??
        EdgeInsetsDirectional.symmetric(horizontal: 18.h, vertical: 22.h),
    fillColor: fillColor ?? appTheme.gray10002,
    filled: filled,
    border:
        borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide.none,
        ),
    enabledBorder:
        borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide.none,
        ),
    focusedBorder:
        (borderDecoration ??
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.h)))
            .copyWith(
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 1,
              ),
            ),
  );
}
