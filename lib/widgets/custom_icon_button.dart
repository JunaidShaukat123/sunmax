import 'package:flutter/material.dart';

import '../core/app_export.dart';

extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillWhiteA => BoxDecoration(
    color: appTheme.whiteA700,
    borderRadius: BorderRadius.circular(22.h),
  );
  static BoxDecoration get outlinePrimary => BoxDecoration(
    color: appTheme.red50,
    borderRadius: BorderRadius.circular(28.h),
    border: Border.all(color: theme.colorScheme.primary, width: 1.h),
  );
  static BoxDecoration get outlineGray => BoxDecoration(
    color: appTheme.gray5001,
    borderRadius: BorderRadius.circular(24.h),
    border: Border.all(color: appTheme.gray200, width: 1.h),
  );
  static BoxDecoration get fillErrorContainer => BoxDecoration(
    color: theme.colorScheme.errorContainer,
    borderRadius: BorderRadius.circular(30.h),
  );
  static BoxDecoration get fillOnError => BoxDecoration(
    color: theme.colorScheme.onError,
    borderRadius: BorderRadius.circular(30.h),
  );
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray90002,
    borderRadius: BorderRadius.circular(30.h),
  );
  static BoxDecoration get fillGrayTL30 => BoxDecoration(
    color: appTheme.gray90003,
    borderRadius: BorderRadius.circular(30.h),
  );
  static BoxDecoration get fillBlueGray => BoxDecoration(
    color: appTheme.blueGray50,
    borderRadius: BorderRadius.circular(22.h),
  );
  static BoxDecoration get fillGrayTL22 => BoxDecoration(
    color: appTheme.gray900,
    borderRadius: BorderRadius.circular(22.h),
  );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
    color: theme.colorScheme.onPrimary,
    borderRadius: BorderRadius.circular(22.h),
  );
  static BoxDecoration get fillPrimary => BoxDecoration(
    color: theme.colorScheme.primary,
    borderRadius: BorderRadius.circular(14.h),
  );
  static BoxDecoration get fillWhiteATL18 => BoxDecoration(
    color: appTheme.whiteA700.withValues(alpha: 0.42),
    borderRadius: BorderRadius.circular(18.h),
  );
  static BoxDecoration get fillWhiteATL22 => BoxDecoration(
    color: appTheme.whiteA700.withValues(alpha: 0.39),
    borderRadius: BorderRadius.circular(22.h),
  );
  static BoxDecoration get fillYellow => BoxDecoration(
    color: appTheme.yellow900,
    borderRadius: BorderRadius.circular(22.h),
  );
  static BoxDecoration get outlineYellow => BoxDecoration(
    color: appTheme.whiteA700,
    borderRadius: BorderRadius.circular(22.h),
    border: Border.all(color: appTheme.yellow900, width: 1.h),
  );
  static BoxDecoration get fillBlueGrayTL22 => BoxDecoration(
    color: appTheme.blueGray900,
    borderRadius: BorderRadius.circular(22.h),
  );
  static BoxDecoration get none => BoxDecoration();
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.alignment,
    this.height,
    this.width,
    this.decoration,
    this.padding,
    this.onTap,
    this.child,
  });
  final AlignmentGeometry? alignment;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? AlignmentDirectional.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
    height: height ?? 0,
    width: width ?? 0,
    child: DecoratedBox(
      decoration:
          decoration ??
          BoxDecoration(
            color: appTheme.deepOrange50,
            borderRadius: BorderRadius.circular(24.h),
          ),
      child: IconButton(
        padding: padding ?? EdgeInsetsDirectional.zero,
        onPressed: onTap,
        icon: child ?? Container(),
      ),
    ),
  );
}
