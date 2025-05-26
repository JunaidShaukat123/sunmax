import 'package:flutter/material.dart';

import '/core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils().getThemeData();
  // A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'light': LightCodeColors(),
  };
  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'light': ColorSchemes.light,
  };

  /// Changes the app theme to [newTheme].
  void changeTheme(String newTheme) {
    PrefUtils().setThemeData(newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme = _supportedColorScheme[_appTheme] ?? ColorSchemes.light;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsetsDirectional.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(color: colorScheme.primary, width: 1.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.h),
          ),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsetsDirectional.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(color: appTheme.whiteA700, width: 1),
        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.blueGray5001,
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: TextStyle(
      color: appTheme.gray900,
      fontSize: 17.fSize,
      fontFamily: 'Sen',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: appTheme.blueGray30003,
      fontSize: 14.fSize,
      fontFamily: 'Sen',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: appTheme.gray60001,
      fontSize: 12.fSize,
      fontFamily: 'Sen',
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      color: appTheme.blueGray900,
      fontSize: 52.fSize,
      fontFamily: 'Sen',
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      color: appTheme.whiteA700,
      fontSize: 40.fSize,
      fontFamily: 'Sen',
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      color: appTheme.whiteA700,
      fontSize: 30.fSize,
      fontFamily: 'Sen',
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: appTheme.gray900,
      fontSize: 28.fSize,
      fontFamily: 'Sen',
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      color: appTheme.blueGray90003,
      fontSize: 24.fSize,
      fontFamily: 'Sen',
      fontWeight: FontWeight.w800,
    ),
    labelLarge: TextStyle(
      color: appTheme.gray60001,
      fontSize: 12.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: appTheme.gray60001,
      fontSize: 11.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      color: appTheme.blueGray90003,
      fontSize: 20.fSize,
      fontFamily: 'Sen',
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      color: appTheme.whiteA700,
      fontSize: 16.fSize,
      fontFamily: 'Sen',
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: appTheme.whiteA700,
      fontSize: 14.fSize,
      fontFamily: 'Sen',
      fontWeight: FontWeight.w700,
    ),
  );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final light = ColorScheme.light(
    primary: Color(0XFF0474ED),
    primaryContainer: Color(0XFF111A2C),
    secondaryContainer: Color(0X0A000000),
    errorContainer: Color(0XFF395998),
    onError: Color(0XFF169CE7),
    onPrimary: Color(0XFF121223),
    onPrimaryContainer: Color(0XFF52B1E4),
    onSecondaryContainer: Color(0XB22D2D2D),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Primary
  Color get primary => Color(0XFF0474ED);
  Color get secondary => Color(0XB22D2D2D);
  Color get transparent => Colors.transparent;

  // Amber
  Color get amber200 => Color(0XFFFFD97D);
  Color get amber300 => Color(0XFFFECB5F);
  Color get amber400 => Color(0XFFFFD628);
  Color get amberA400 => Color(0XFFFFCD00);
  // Blue
  Color get blue400 => Color(0XFF369BFF);
  Color get blue700 => Color(0XFF2790C3);
  Color get blue800 => Color(0XFF2566AF);
  // BlueGray
  Color get blueGray100 => Color(0XFFCCCDCF);
  Color get blueGray10001 => Color(0XFFCACCD9);
  Color get blueGray10002 => Color(0XFFD0D9E1);
  Color get blueGray1007f => Color(0X7FCED6DF);
  Color get blueGray100Ad => Color(0XADD7DAE0);
  Color get blueGray200 => Color(0XFFB4B9CA);
  Color get blueGray300 => Color(0XFF97A8B7);
  Color get blueGray30001 => Color(0XFF98A8B8);
  Color get blueGray30002 => Color(0XFFA4A7B8);
  Color get blueGray30003 => Color(0XFFA0A5BA);
  Color get blueGray400 => Color(0XFF838699);
  Color get blueGray40001 => Color(0XFF7E8A97);
  Color get blueGray50 => Color(0XFFECF0F4);
  Color get blueGray5001 => Color(0XFFEDF1F5);
  Color get blueGray600 => Color(0XFF646982);
  Color get blueGray700 => Color(0XFF464E57);
  Color get blueGray70099 => Color(0X99525C67);
  Color get blueGray800Aa => Color(0XAA263E55);
  Color get blueGray900 => Color(0XFF32343E);
  Color get blueGray90001 => Color(0XFF333333);
  Color get blueGray90002 => Color(0XFF363638);
  Color get blueGray90003 => Color(0XFF31343D);
  Color get blueGray90004 => Color(0XFF1F264F);
  Color get blueGray90005 => Color(0XFF0E273E);
  // Cyan
  Color get cyan400 => Color(0XFF18CEE7);
  Color get cyan40001 => Color(0XFF2AE1E1);
  // DeepOrange
  Color get deepOrange100 => Color(0XFFFFC6AE);
  Color get deepOrange300 => Color(0XFFFC7F53);
  Color get deepOrange30033 => Color(0X33F6916C);
  Color get deepOrange50 => Color(0XFFFFEBE4);
  Color get deepOrange500 => Color(0XFFFF5023);
  Color get deepOrange5001 => Color(0XFFEFE6E1);
  Color get deepOrangeA200 => Color(0XFFFC6E2A);
  Color get deepOrangeA20001 => Color(0XFFFB6D3A);
  Color get deepOrangeA20002 => Color(0XFFFB6F3D);
  // DeepPurple
  Color get deepPurple300 => Color(0XFF958AC2);
  Color get deepPurple600 => Color(0XFF513BB1);
  // Gray
  Color get gray100 => Color(0XFFF6F7F8);
  Color get gray10001 => Color(0XFFF0F4F9);
  Color get gray10002 => Color(0XFFF6F6F6);
  Color get gray10003 => Color(0XFFF0F4F8);
  Color get gray10004 => Color(0XFFF0F5FA);
  Color get gray10005 => Color(0XFFF4F5F7);
  Color get gray200 => Color(0XFFE8E9EC);
  Color get gray20001 => Color(0XFFECECEC);
  Color get gray20002 => Color(0XFFEBEBEB);
  Color get gray20003 => Color(0XFFE8E8E8);
  Color get gray20004 => Color(0XFFE7E7E7);
  Color get gray300 => Color(0XFFD8E3EC);
  Color get gray400 => Color(0XFFAFAFAF);
  Color get gray40001 => Color(0XFFBFBCBA);
  Color get gray40002 => Color(0XFFC9C9C9);
  Color get gray40003 => Color(0XFFAFAFB0);
  Color get gray50 => Color(0XFFF6F8FA);
  Color get gray500 => Color(0XFF9B9BA5);
  Color get gray50001 => Color(0XFF9C9BA6);
  Color get gray50002 => Color(0XFF979797);
  Color get gray50003 => Color(0XFFABABAB);
  Color get gray50026 => Color(0X2696969A);
  Color get gray5001 => Color(0XFFFCFCFC);
  Color get gray5002 => Color(0XFFF6F7FC);
  Color get gray5003 => Color(0XFFFBFBFC);
  Color get gray5004 => Color(0XFFF8F9FA);
  Color get gray600 => Color(0XFF6B6E82);
  Color get gray60001 => Color(0XFF737782);
  Color get gray60002 => Color(0XFF747783);
  Color get gray60003 => Color(0XFF6B6E81);
  Color get gray700 => Color(0XFF676767);
  Color get gray70001 => Color(0XFF5D606E);
  Color get gray900 => Color(0XFF181C2E);
  Color get gray90001 => Color(0XFF1E1E2E);
  Color get gray90002 => Color(0XFF1B1E2E);
  Color get gray90003 => Color(0XFF1B1F2F);
  Color get gray90004 => Color(0XFF1E1D1D);
  Color get gray90005 => Color(0XFF231F20);
  // Green
  Color get greenA700 => Color(0XFF1AD52B);
  // Indigo
  Color get indigo100 => Color(0XFFC1C8D2);
  Color get indigo50 => Color(0XFFE3EAF2);
  Color get indigo900 => Color(0XFF27346A);
  Color get indigoA700 => Color(0XFF403CFB);
  // Lime
  Color get lime500 => Color(0XFFE0CF3B);
  // Orange
  Color get orange100 => Color(0XFFFFDCA0);
  Color get orange200 => Color(0XFFFFBE6D);
  Color get orange400 => Color(0XFFFFA92A);
  Color get orange50D8 => Color(0XD8FFF1E0);
  Color get orange600 => Color(0XFFFF8400);
  Color get orange800 => Color(0XFFE66E00);
  Color get orangeA700 => Color(0XFFFF5F00);
  // Pink
  Color get pink200 => Color(0XFFF59AA8);
  // Purple
  Color get purple500 => Color(0XFFA03AB1);
  Color get purpleA200 => Color(0XFFB23CFB);
  // Red
  Color get red100 => Color(0XFFFFE0CD);
  Color get red300 => Color(0XFFEC7A62);
  Color get red50 => Color(0XFFFFF1F1);
  Color get red500 => Color(0XFFFF3326);
  Color get red50001 => Color(0XFFFF3434);
  Color get red600 => Color(0XFFE04444);
  Color get redA200 => Color(0XFFFB4A59);
  Color get redA700 => Color(0XFFD20E0E);
  Color get redA70001 => Color(0XFFEF0000);
  Color get redA70002 => Color(0XFFEB001B);
  Color get redA70003 => Color(0XFFFF0000);
  // Teal
  Color get teal600 => Color(0XFF059C69);
  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
  // Yellow
  Color get yellow500 => Color(0XFFFFEA34);
  Color get yellow800 => Color(0XFFF79E1B);
  Color get yellow900 => Color(0XFFFF7621);
  Color get yellow90001 => Color(0XFFF58D1D);

  // Black
  Color get black900 => Color(0XFF000000);
  Color get black90001 => Color(0XFF1A1A1A);
}
