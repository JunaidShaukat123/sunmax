import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlueGray =>
      BoxDecoration(color: appTheme.blueGray30001);
  static BoxDecoration get fillDeepOrange =>
      BoxDecoration(color: appTheme.deepOrange100);
  static BoxDecoration get fillGray => BoxDecoration(color: appTheme.gray100);
  static BoxDecoration get fillGray10002 =>
      BoxDecoration(color: appTheme.gray10002);
  static BoxDecoration get fillGray10004 =>
      BoxDecoration(color: appTheme.gray10004);
  static BoxDecoration get fillGray10005 =>
      BoxDecoration(color: appTheme.gray10005);
  static BoxDecoration get fillGray50 => BoxDecoration(color: appTheme.gray50);
  static BoxDecoration get fillOnPrimary =>
      BoxDecoration(color: theme.colorScheme.onPrimary);
  static BoxDecoration get fillPrimary =>
      BoxDecoration(color: theme.colorScheme.primary);
  static BoxDecoration get fillWhiteA =>
      BoxDecoration(color: appTheme.whiteA700);
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
    color: appTheme.whiteA700,
    image: DecorationImage(
      image: AssetImage(ImageConstant.imgBgAsset),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get fillWhiteA7001 =>
      BoxDecoration(color: appTheme.whiteA700.withValues(alpha: 0.2));
  static BoxDecoration get fillYellow =>
      BoxDecoration(color: appTheme.yellow900.withValues(alpha: 0.2));
  // Gradient decorations
  static BoxDecoration get gradientOrangeToYellow => BoxDecoration(
    gradient: LinearGradient(
      begin: AlignmentDirectional(0.39, 0.92),
      end: AlignmentDirectional(0.35, -0.26),
      colors: [appTheme.orange800, appTheme.yellow500],
    ),
  );
  // Outline decorations
  static BoxDecoration get outlineBlueGrayAd => BoxDecoration(
    color: appTheme.whiteA700,
    boxShadow: [
      BoxShadow(
        color: appTheme.blueGray100Ad,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(1, 12),
      ),
    ],
  );
  static BoxDecoration get outlineDeepOrange => BoxDecoration(
    color: appTheme.whiteA700,
    boxShadow: [
      BoxShadow(
        color: appTheme.deepOrange5001,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(0, 10),
      ),
    ],
  );
  static BoxDecoration get outlineGray =>
      BoxDecoration(color: appTheme.gray5001);
  static BoxDecoration get outlineGray20001 => BoxDecoration(
    color: appTheme.whiteA700,
    border: Border.all(color: appTheme.gray20001, width: 2.h),
  );
  static BoxDecoration get outlineGray20003 => BoxDecoration(
    color: appTheme.whiteA700,
    border: Border.all(color: appTheme.gray20003, width: 1.h),
  );
  static BoxDecoration get outlineGray20004 => BoxDecoration(
    color: appTheme.whiteA700,
    border: Border.all(color: appTheme.gray20004, width: 1.h),
  );
  static BoxDecoration get outlineGray50026 => BoxDecoration(
    color: appTheme.whiteA700,
    boxShadow: [
      BoxShadow(
        color: appTheme.gray50026,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(12, 12),
      ),
    ],
  );
  static BoxDecoration get outlineSecondaryContainer => BoxDecoration(
    color: theme.colorScheme.onPrimary,
    boxShadow: [
      BoxShadow(
        color: theme.colorScheme.secondaryContainer,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(0, 12),
      ),
    ],
  );
  // Column decorations
  static BoxDecoration get column14 => BoxDecoration(
    image: DecorationImage(
      image: AssetImage(ImageConstant.imgBgAssetGray90001),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column15 => BoxDecoration(
    image: DecorationImage(
      image: AssetImage(ImageConstant.imgBgAssetGray90001355x375),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column16 => BoxDecoration(
    image: DecorationImage(
      image: AssetImage(ImageConstant.imgBgAssetYellow900),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column17 => BoxDecoration(
    image: DecorationImage(
      image: AssetImage(ImageConstant.imgBgAssetYellow900),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column18 => BoxDecoration(
    image: DecorationImage(
      image: AssetImage(ImageConstant.imgBgAssetYellow900),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column21 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle1223),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column22 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle1223),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column25 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle1223),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column26 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle1223),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column27 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle1223),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column28 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle1223),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column29 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle1223),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column3 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle3),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column30 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle1223),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column34 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle1223),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column35 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle1223),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column36 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle1223),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column37 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle1223),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column38 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle1223),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column39 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle1223),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column45 => BoxDecoration(
    image: DecorationImage(
      image: AssetImage(ImageConstant.imgMap),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get column7 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgRectangle3),
      fit: BoxFit.fill,
    ),
  );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder16 => BorderRadius.circular(16.h);
  static BorderRadius get circleBorder30 => BorderRadius.circular(30.h);
  static BorderRadius get circleBorder50 => BorderRadius.circular(50.h);
  // Custom borders
  static BorderRadius get customBorderBL24 =>
      BorderRadius.vertical(bottom: Radius.circular(24.h));
  static BorderRadius get customBorderBR14 => BorderRadius.only(
    topLeft: Radius.circular(12.h),
    topRight: Radius.circular(12.h),
    bottomLeft: Radius.circular(12.h),
    bottomRight: Radius.circular(14.h),
  );
  static BorderRadius get customBorderTL24 =>
      BorderRadius.vertical(top: Radius.circular(24.h));
  // Rounded borders
  static BorderRadius get roundedBorder1 => BorderRadius.circular(1.h);
  static BorderRadius get roundedBorder10 => BorderRadius.circular(10.h);
  static BorderRadius get roundedBorder20 => BorderRadius.circular(20.h);
  static BorderRadius get roundedBorder24 => BorderRadius.circular(24.h);
  static BorderRadius get roundedBorder34 => BorderRadius.circular(34.h);
}
