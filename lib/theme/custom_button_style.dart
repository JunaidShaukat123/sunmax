import 'package:flutter/material.dart';

import '../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillBlueGray => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blueGray900,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.h)),
    elevation: 0,
    padding: EdgeInsetsDirectional.zero,
  );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
    elevation: 0,
    padding: EdgeInsetsDirectional.zero,
  );
  static ButtonStyle get fillPrimaryTL22 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.h)),
    elevation: 0,
    padding: EdgeInsetsDirectional.zero,
  );
  static ButtonStyle get fillWhiteA => ElevatedButton.styleFrom(
    backgroundColor: appTheme.whiteA700.withValues(alpha: 0.8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.h)),
    elevation: 0,
    padding: EdgeInsetsDirectional.zero,
  );
  // Outline button style
  static ButtonStyle get outlineGray => OutlinedButton.styleFrom(
    backgroundColor: appTheme.whiteA700,
    side: BorderSide(color: appTheme.gray10004, width: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
    padding: EdgeInsetsDirectional.zero,
  );
  static ButtonStyle get outlineRed => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(color: appTheme.red500, width: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
    padding: EdgeInsetsDirectional.zero,
  );
  static ButtonStyle get outlineWhiteA => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(color: appTheme.whiteA700, width: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
    padding: EdgeInsetsDirectional.zero,
  );
  static ButtonStyle get outlineWhiteATL10 => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(color: appTheme.whiteA700, width: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
    padding: EdgeInsetsDirectional.zero,
  );
  // text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    elevation: WidgetStateProperty.all<double>(0),
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsetsDirectional.zero,
    ),
    side: WidgetStateProperty.all<BorderSide>(
      BorderSide(color: Colors.transparent),
    ),
  );
}
