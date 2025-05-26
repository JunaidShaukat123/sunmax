import 'package:flutter/material.dart';
import '/core/app_export.dart';

extension on TextStyle {
  TextStyle get sen {
    return copyWith(fontFamily: 'Sen');
  }

  TextStyle get poppins {
    return copyWith(fontFamily: 'Poppins');
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static TextStyle get bodyLarge16 =>
      theme.textTheme.bodyLarge!.copyWith(fontSize: 16.fSize);
  static TextStyle get bodyLarge16_1 =>
      theme.textTheme.bodyLarge!.copyWith(fontSize: 16.fSize);
  static TextStyle get bodyLarge18 =>
      theme.textTheme.bodyLarge!.copyWith(fontSize: 18.fSize);
  static TextStyle get bodyLargeBluegray600 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.blueGray600, fontSize: 16.fSize);
  static TextStyle get bodyLargeBluegray700 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.blueGray700, fontSize: 16.fSize);
  static TextStyle get bodyLargeBluegray70018 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.blueGray700, fontSize: 18.fSize);
  static TextStyle get bodyLargeBluegray900 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.blueGray900, fontSize: 18.fSize);
  static TextStyle get bodyLargeBluegray90001 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.blueGray90001, fontSize: 16.fSize);
  static TextStyle get bodyLargeBluegray90003 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.blueGray90003, fontSize: 16.fSize);
  static TextStyle get bodyLargeBluegray9000316 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray90003.withValues(alpha: 0.5),
        fontSize: 16.fSize,
      );
  static TextStyle get bodyLargeBluegray9000316_1 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.blueGray90003, fontSize: 16.fSize);
  static TextStyle get bodyLargeBluegray9000316_2 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray90003.withValues(alpha: 0.9),
        fontSize: 16.fSize,
      );
  static TextStyle get bodyLargeBluegray90016 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.blueGray900, fontSize: 16.fSize);
  static TextStyle get bodyLargeBluegray90016_1 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.blueGray900, fontSize: 16.fSize);
  static TextStyle get bodyLargeBluegray900_1 =>
      theme.textTheme.bodyLarge!.copyWith(color: appTheme.blueGray900);
  static TextStyle get bodyLargeGray50002 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.gray50002, fontSize: 16.fSize);
  static TextStyle get bodyLargeGray90004 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.gray90004, fontSize: 16.fSize);
  static TextStyle get bodyLargeGray9000416 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.gray90004, fontSize: 16.fSize);
  static TextStyle get bodyLargeOnPrimary => theme.textTheme.bodyLarge!
      .copyWith(color: theme.colorScheme.onPrimary, fontSize: 16.fSize);
  static TextStyle get bodyLargeOrange50d8 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.orange50D8, fontSize: 16.fSize);
  static TextStyle get bodyLargeWhiteA700 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.whiteA700, fontSize: 18.fSize);
  static TextStyle get bodyLargeWhiteA70016 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700.withValues(alpha: 0.85),
        fontSize: 16.fSize,
      );
  static TextStyle get bodyLargeWhiteA70016_1 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.whiteA700, fontSize: 16.fSize);
  static TextStyle get bodyLargeWhiteA70016_2 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700.withValues(alpha: 0.9),
        fontSize: 16.fSize,
      );
  static TextStyle get bodyLargeWhiteA70016_3 => theme.textTheme.bodyLarge!
      .copyWith(color: appTheme.whiteA700, fontSize: 16.fSize);
  static TextStyle get bodyLargeWhiteA70018 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700.withValues(alpha: 0.5),
        fontSize: 18.fSize,
      );
  static TextStyle get bodyLargeWhiteA700_1 =>
      theme.textTheme.bodyLarge!.copyWith(color: appTheme.whiteA700);
  static TextStyle get bodyMedium13 =>
      theme.textTheme.bodyMedium!.copyWith(fontSize: 13.fSize);
  static TextStyle get bodyMediumBluegray30002 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.blueGray30002);
  static TextStyle get bodyMediumBluegray40001 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.blueGray40001, fontSize: 13.fSize);
  static TextStyle get bodyMediumBluegray600 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.blueGray600);
  static TextStyle get bodyMediumBluegray60013 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.blueGray600, fontSize: 13.fSize);
  static TextStyle get bodyMediumBluegray700 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.blueGray700);
  static TextStyle get bodyMediumBluegray70099 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.blueGray70099);
  static TextStyle get bodyMediumBluegray900 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.blueGray900);
  static TextStyle get bodyMediumBluegray90001 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.blueGray90001, fontSize: 15.fSize);
  static TextStyle get bodyMediumBluegray90003 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.blueGray90003.withValues(alpha: 0.5));
  static TextStyle get bodyMediumBluegray9000313 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.blueGray90003, fontSize: 13.fSize);
  static TextStyle get bodyMediumBluegray90003_1 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.blueGray90003);
  static TextStyle get bodyMediumBluegray90003_2 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.blueGray90003);
  static TextStyle get bodyMediumBluegray90013 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.blueGray900, fontSize: 13.fSize);
  static TextStyle get bodyMediumBluegray90013_1 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.blueGray900, fontSize: 13.fSize);
  static TextStyle get bodyMediumBluegray90013_2 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.blueGray900, fontSize: 13.fSize);
  static TextStyle get bodyMediumBluegray90015 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.blueGray900, fontSize: 15.fSize);
  static TextStyle get bodyMediumBluegray900_1 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.blueGray900);
  static TextStyle get bodyMediumDeeporangeA20001 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.deepOrangeA20001);
  static TextStyle get bodyMediumGray400 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.gray400, fontSize: 13.fSize);
  static TextStyle get bodyMediumGray40013 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.gray400, fontSize: 13.fSize);
  static TextStyle get bodyMediumGray40013_1 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.gray400, fontSize: 13.fSize);
  static TextStyle get bodyMediumGray400_1 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray400);
  static TextStyle get bodyMediumGray500 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.gray500, fontSize: 13.fSize);
  static TextStyle get bodyMediumGray50001 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.gray50001, fontSize: 13.fSize);
  static TextStyle get bodyMediumGray50013 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.gray500, fontSize: 13.fSize);
  static TextStyle get bodyMediumGray50013_1 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.gray500, fontSize: 13.fSize);
  static TextStyle get bodyMediumGray500_1 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray500);
  static TextStyle get bodyMediumGray500_2 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray500);
  static TextStyle get bodyMediumGray600 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray600);
  static TextStyle get bodyMediumGray60001 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.gray60001, fontSize: 13.fSize);
  static TextStyle get bodyMediumGray700 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray700);
  static TextStyle get bodyMediumGray700_1 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray700);
  static TextStyle get bodyMediumGray900 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray900);
  static TextStyle get bodyMediumOnSecondaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
        fontSize: 15.fSize,
      );
  static TextStyle get bodyMediumPoppinsBluegray900 => theme
      .textTheme
      .bodyMedium!
      .poppins
      .copyWith(color: appTheme.blueGray900, fontSize: 13.fSize);
  static TextStyle get bodyMediumPrimary => theme.textTheme.bodyMedium!
      .copyWith(color: theme.colorScheme.primary, fontSize: 13.fSize);
  static TextStyle get bodyMediumRed300 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.red300);
  static TextStyle get bodyMediumRed500 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.red500);
  static TextStyle get bodyMediumWhiteA700 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.whiteA700);
  static TextStyle get bodyMediumYellow900 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.yellow900, fontSize: 13.fSize);
  static TextStyle get bodyMediumYellow900_1 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.yellow900);
  static get bodyMedium_1 => theme.textTheme.bodyMedium!;
  static TextStyle get bodySmall8 =>
      theme.textTheme.bodySmall!.copyWith(fontSize: 8.fSize);
  static TextStyle get bodySmallBluegray90002 => theme.textTheme.bodySmall!
      .copyWith(color: appTheme.blueGray90002, fontSize: 9.fSize);
  static TextStyle get bodySmallBluegray90002_1 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.blueGray90002);
  static TextStyle get bodySmallGray400 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray400,
    fontSize: 9.fSize,
  );
  static TextStyle get bodySmallGray400_1 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.gray400);
  static TextStyle get bodySmallGray500 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray500,
    fontSize: 10.fSize,
  );
  static TextStyle get bodySmallGray50003 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.gray50003);
  static TextStyle get bodySmallGray50011 => theme.textTheme.bodySmall!
      .copyWith(color: appTheme.gray500, fontSize: 11.fSize);
  static TextStyle get bodySmallGray5002 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.gray5002);
  static TextStyle get bodySmallGray5009 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray500,
    fontSize: 9.fSize,
  );
  static TextStyle get bodySmallGray500_1 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.gray500);
  static TextStyle get bodySmallGray500_2 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.gray500);
  static TextStyle get bodySmallGray600 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600);
  static TextStyle get bodySmallGray60003 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.gray60003);
  static TextStyle get bodySmallPoppins =>
      theme.textTheme.bodySmall!.poppins.copyWith(fontSize: 8.fSize);
  static TextStyle get bodySmallPoppinsWhiteA700 => theme
      .textTheme
      .bodySmall!
      .poppins
      .copyWith(color: appTheme.whiteA700, fontSize: 9.fSize);
  // Display text style
  static TextStyle get displayMediumExtraBold => theme.textTheme.displayMedium!
      .copyWith(fontSize: 41.fSize, fontWeight: FontWeight.w800);
  // Headline text style
  static TextStyle get headlineLargeGray900 => theme.textTheme.headlineLarge!
      .copyWith(color: appTheme.gray900, fontWeight: FontWeight.w400);
  static TextStyle get headlineLargeGray900ExtraBold => theme
      .textTheme
      .headlineLarge!
      .copyWith(color: appTheme.gray900, fontWeight: FontWeight.w800);
  static TextStyle get headlineSmallPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w700,
      );
  // Label text style
  static TextStyle get labelLargeSenBluegray400 =>
      theme.textTheme.labelLarge!.sen.copyWith(
        color: appTheme.blueGray400,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get labelLargeSenDeeporangeA200 => theme
      .textTheme
      .labelLarge!
      .sen
      .copyWith(color: appTheme.deepOrangeA200, fontWeight: FontWeight.w700);
  static TextStyle get labelLargeSenDeeporangeA20001 =>
      theme.textTheme.labelLarge!.sen.copyWith(
        color: appTheme.deepOrangeA20001,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get labelLargeSenGray900 => theme.textTheme.labelLarge!.sen
      .copyWith(color: appTheme.gray900, fontWeight: FontWeight.w700);
  static TextStyle get labelLargeSenPrimary => theme.textTheme.labelLarge!.sen
      .copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w700);
  static TextStyle get labelLargeSenWhiteA700 => theme.textTheme.labelLarge!.sen
      .copyWith(color: appTheme.whiteA700, fontWeight: FontWeight.w700);
  static TextStyle get labelLargeSenWhiteA700Bold =>
      theme.textTheme.labelLarge!.sen.copyWith(
        color: appTheme.whiteA700,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w700,
      );
  // Title text style
  static TextStyle get titleLargeBluegray900 => theme.textTheme.titleLarge!
      .copyWith(color: appTheme.blueGray900, fontWeight: FontWeight.w700);
  static TextStyle get titleLargeBluegray900Bold =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray900,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleLargeDeeporangeA20001 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.deepOrangeA20001,
        fontSize: 21.fSize,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleLargeGray900 => theme.textTheme.titleLarge!
      .copyWith(color: appTheme.gray900, fontWeight: FontWeight.w700);
  static TextStyle get titleLargeGray900_1 =>
      theme.textTheme.titleLarge!.copyWith(color: appTheme.gray900);
  static TextStyle get titleLargePoppinsBluegray90001 =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: appTheme.blueGray90001,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleLargeWhiteA700 => theme.textTheme.titleLarge!
      .copyWith(color: appTheme.whiteA700, fontWeight: FontWeight.w700);
  static TextStyle get titleMedium18 =>
      theme.textTheme.titleMedium!.copyWith(fontSize: 18.fSize);
  static TextStyle get titleMediumBluegray900 => theme.textTheme.titleMedium!
      .copyWith(color: appTheme.blueGray900, fontSize: 18.fSize);
  static TextStyle get titleMediumBluegray90003 => theme.textTheme.titleMedium!
      .copyWith(color: appTheme.blueGray90003, fontSize: 18.fSize);
  static TextStyle get titleMediumBluegray90003_1 =>
      theme.textTheme.titleMedium!.copyWith(color: appTheme.blueGray90003);
  static TextStyle get titleMediumBluegray90003_2 =>
      theme.textTheme.titleMedium!.copyWith(color: appTheme.blueGray90003);
  static TextStyle get titleMediumBluegray90017 => theme.textTheme.titleMedium!
      .copyWith(color: appTheme.blueGray900, fontSize: 17.fSize);
  static TextStyle get titleMediumBluegray900_1 =>
      theme.textTheme.titleMedium!.copyWith(color: appTheme.blueGray900);
  static TextStyle get titleMediumGray500 => theme.textTheme.titleMedium!
      .copyWith(color: appTheme.gray500, fontSize: 17.fSize);
  static TextStyle get titleMediumGray900 =>
      theme.textTheme.titleMedium!.copyWith(color: appTheme.gray900);
  static TextStyle get titleMediumGray90004 =>
      theme.textTheme.titleMedium!.copyWith(color: appTheme.gray90004);
  static TextStyle get titleMediumGray900_1 =>
      theme.textTheme.titleMedium!.copyWith(color: appTheme.gray900);
  static TextStyle get titleSmallBluegray30003 =>
      theme.textTheme.titleSmall!.copyWith(color: appTheme.blueGray30003);
  static TextStyle get titleSmallBluegray900 =>
      theme.textTheme.titleSmall!.copyWith(color: appTheme.blueGray900);
  static TextStyle get titleSmallBluegray90003 =>
      theme.textTheme.titleSmall!.copyWith(color: appTheme.blueGray90003);
  static TextStyle get titleSmallBluegray9000315 => theme.textTheme.titleSmall!
      .copyWith(color: appTheme.blueGray90003, fontSize: 15.fSize);
  static TextStyle get titleSmallBluegray9000315_1 => theme
      .textTheme
      .titleSmall!
      .copyWith(color: appTheme.blueGray90003, fontSize: 15.fSize);
  static TextStyle get titleSmallDeeporangeA20001 =>
      theme.textTheme.titleSmall!.copyWith(color: appTheme.deepOrangeA20001);
  static TextStyle get titleSmallGray900 =>
      theme.textTheme.titleSmall!.copyWith(color: appTheme.gray900);
  static TextStyle get titleSmallPoppinsDeeporangeA20001 => theme
      .textTheme
      .titleSmall!
      .poppins
      .copyWith(color: appTheme.deepOrangeA20001, fontWeight: FontWeight.w500);
  static TextStyle get titleSmallPrimary =>
      theme.textTheme.titleSmall!.copyWith(color: theme.colorScheme.primary);
  static TextStyle get titleSmallRedA70003 =>
      theme.textTheme.titleSmall!.copyWith(color: appTheme.redA70003);
  static TextStyle get titleSmallTeal600 =>
      theme.textTheme.titleSmall!.copyWith(color: appTheme.teal600);
  static TextStyle get titleSmallYellow900 =>
      theme.textTheme.titleSmall!.copyWith(color: appTheme.yellow900);
}
