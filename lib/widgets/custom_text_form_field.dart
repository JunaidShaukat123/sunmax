import 'package:flutter/material.dart';

import '../core/app_export.dart';

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineGray => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.h),
    borderSide: BorderSide(color: appTheme.gray200, width: 1),
  );
  static OutlineInputBorder get outlineIndigoTL8 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.h),
    borderSide: BorderSide(color: appTheme.indigo50, width: 1),
  );
  static OutlineInputBorder get fillGray => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.h),
    borderSide: BorderSide.none,
  );
  static OutlineInputBorder get fillGrayTL20 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.h),
    borderSide: BorderSide.none,
  );
  static OutlineInputBorder get outlineBlack => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.h),
    borderSide: BorderSide(
      color: appTheme.black900.withValues(alpha: 0.3),
      width: 1,
    ),
  );
  static OutlineInputBorder get fillGrayTL201 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.h),
    borderSide: BorderSide.none,
  );

  static UnderlineInputBorder get underLineWhiteA =>
      UnderlineInputBorder(borderSide: BorderSide(color: appTheme.whiteA700));
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.width,
    this.onTap,
    this.label,
    this.prefix,
    this.suffix,
    this.helper,
    this.maxLines,
    this.hintText,
    this.alignment,
    this.focusNode,
    this.textStyle,
    this.hintStyle,
    this.fillColor,
    this.validator,
    this.onChanged,
    this.labelText,
    this.controller,
    this.labelStyle,
    this.helperText,
    this.helperStyle,
    this.hintMaxLines,
    this.boxDecoration,
    this.scrollPadding,
    this.filled = true,
    this.contentPadding,
    this.helperMaxLines,
    this.inputFormatters,
    this.readOnly = false,
    this.borderDecoration,
    this.autofocus = false,
    this.prefixConstraints,
    this.suffixConstraints,
    this.alignLabelWithHint,
    this.floatingLabelStyle,
    this.obscureText = false,
    this.floatingLabelBehavior,
    this.floatingLabelAlignment,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

  final bool? filled;
  final double? width;
  final int? maxLines;
  final Widget? label;
  final bool? readOnly;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? helper;
  final bool? autofocus;
  final String? hintText;
  final Color? fillColor;
  final bool? obscureText;
  final String? labelText;
  final int? hintMaxLines;
  final String? helperText;
  final VoidCallback? onTap;
  final int? helperMaxLines;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? helperStyle;
  final bool? alignLabelWithHint;
  final AlignmentGeometry? alignment;
  final BoxDecoration? boxDecoration;
  final TextInputType? textInputType;
  final InputBorder? borderDecoration;
  final TextStyle? floatingLabelStyle;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final BoxConstraints? prefixConstraints;
  final BoxConstraints? suffixConstraints;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? scrollPadding;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final FloatingLabelAlignment? floatingLabelAlignment;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? AlignmentDirectional.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => Container(
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
      style: textStyle ?? CustomTextStyles.bodyLargeBluegray9000316,
      obscureText: obscureText!,
      readOnly: readOnly!,
      onTap: () {
        onTap?.call();
      },
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      decoration: decoration,
      validator: validator,
    ),
  );
  InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ?? CustomTextStyles.bodySmallGray50003,
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding:
        contentPadding ??
        EdgeInsetsDirectional.symmetric(horizontal: 18.h, vertical: 20.h),
    fillColor: fillColor ?? appTheme.gray10004,
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

class Input extends StatelessWidget {
  final bool filled;
  final bool expand;
  final bool readOnly;
  final String? label;
  final int? maxLines;
  final Widget? suffix;
  final Widget? prefix;
  final double? spacing;
  final Color? fillColor;
  final String? hintText;
  final bool obscureText;
  final String? labelText;
  final String? suffixIcon;
  final String? prefixIcon;
  final String? helperText;
  final void Function()? onTap;
  final TextStyle? labelTextStyle;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTapSuffix;
  final void Function()? onTapPrefix;
  final TextInputType? textInputType;
  final InputBorder? borderDecoration;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final BoxConstraints? suffixConstraints;
  final BoxConstraints? prefixConstraints;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const Input({
    super.key,
    this.label,
    this.onTap,
    this.suffix,
    this.prefix,
    this.spacing,
    this.padding,
    this.hintText,
    this.maxLines,
    this.validator,
    this.fillColor,
    this.onChanged,
    this.labelText,
    this.controller,
    this.suffixIcon,
    this.helperText,
    this.prefixIcon,
    this.onTapSuffix,
    this.onTapPrefix,
    this.filled = true,
    this.textInputType,
    this.expand = false,
    this.contentPadding,
    this.labelTextStyle,
    this.textInputAction,
    this.inputFormatters,
    this.borderDecoration,
    this.readOnly = false,
    this.suffixConstraints,
    this.prefixConstraints,
    this.obscureText = false,
  });

  Widget builder(BuildContext context) {
    Widget child = SizedBox();

    child = CustomTextFormField(
      onTap: onTap,
      filled: filled,
      readOnly: readOnly,
      hintText: hintText,
      maxLines: maxLines,
      labelText: labelText,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      helperText: helperText,
      obscureText: obscureText,
      labelStyle: labelTextStyle,
      textInputType: textInputType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      fillColor: fillColor ?? appTheme.gray100,
      prefix: prefixIcon != null
          ? InkWell(
              onTap: onTapPrefix,
              child: Container(
                margin: EdgeInsetsDirectional.fromSTEB(16.h, 16.h, 18.h, 16.h),
                child: CustomImageView(
                  width: 22.h,
                  height: 22.h,
                  fit: BoxFit.contain,
                  imagePath: prefixIcon,
                ),
              ),
            )
          : prefix,
      suffix: suffixIcon != null
          ? InkWell(
              onTap: onTapSuffix,
              child: Container(
                margin: EdgeInsetsDirectional.fromSTEB(12.h, 12.h, 12.h, 12.h),
                child: CustomImageView(
                  width: 14.h,
                  height: 14.h,
                  fit: BoxFit.contain,
                  imagePath: suffixIcon,
                ),
              ),
            )
          : suffix,
      borderDecoration:
          borderDecoration ?? TextFormFieldStyleHelper.outlineIndigoTL8,
      prefixConstraints: prefixIcon != null
          ? BoxConstraints(maxHeight: 56.h)
          : prefixConstraints ?? BoxConstraints(maxHeight: 56.h),
      suffixConstraints: suffixIcon != null
          ? BoxConstraints(maxHeight: 56.h)
          : suffixConstraints ?? BoxConstraints(maxHeight: 56.h),
      contentPadding: contentPadding ?? EdgeInsetsDirectional.all(14.h),
    );

    if (label != null) {
      child = Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: spacing ?? 4.h,
        children: [
          Text(
            label ?? "",
            style: labelTextStyle ?? theme.textTheme.labelLarge,
          ),
          child,
        ],
      );
    }

    if (expand) {
      child = Expanded(child: child);
    }

    if (padding == null) {
      child = Padding(padding: padding ?? EdgeInsets.zero, child: child);
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
