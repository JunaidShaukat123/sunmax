import 'package:flutter/material.dart';

import '/core/app_export.dart';

class AppbarLeadingIconbutton extends StatelessWidget {
  const AppbarLeadingIconbutton({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  });
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomIconButton(
          height: height ?? 44.h,
          width: width ?? 44.h,
          decoration: IconButtonStyleHelper.none,
          child: CustomImageView(imagePath: ImageConstant.imgClockBlueGray50),
        ),
      ),
    );
  }
}

class AppbarLeadingIconbuttonFive extends StatelessWidget {
  const AppbarLeadingIconbuttonFive({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  });
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomIconButton(
          height: height ?? 44.h,
          width: width ?? 44.h,
          padding: EdgeInsetsDirectional.all(16.h),
          decoration: IconButtonStyleHelper.fillWhiteATL22,
          child: CustomImageView(imagePath: ImageConstant.imgBackWhiteA700),
        ),
      ),
    );
  }
}

class AppbarLeadingIconbuttonFour extends StatelessWidget {
  const AppbarLeadingIconbuttonFour({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  });
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomIconButton(
          height: height ?? 44.h,
          width: width ?? 44.h,
          padding: EdgeInsetsDirectional.all(16.h),
          decoration: IconButtonStyleHelper.fillBlueGray,
          child: CustomImageView(imagePath: ImageConstant.imgBackGray900),
        ),
      ),
    );
  }
}

class AppbarLeadingIconbuttonOne extends StatelessWidget {
  const AppbarLeadingIconbuttonOne({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  });
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomIconButton(
          height: height ?? 44.h,
          width: width ?? 44.h,
          padding: EdgeInsetsDirectional.all(12.h),
          decoration: IconButtonStyleHelper.fillWhiteA,
          child: CustomImageView(imagePath: ImageConstant.imgMenu),
        ),
      ),
    );
  }
}

class AppbarLeadingIconbuttonSix extends StatelessWidget {
  const AppbarLeadingIconbuttonSix({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  });
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomIconButton(
          height: height ?? 44.h,
          width: width ?? 44.h,
          padding: EdgeInsetsDirectional.all(16.h),
          decoration: IconButtonStyleHelper.fillBlueGrayTL22,
          child: CustomImageView(imagePath: ImageConstant.imgBackWhiteA700),
        ),
      ),
    );
  }
}

class AppbarLeadingIconbuttonThree extends StatelessWidget {
  const AppbarLeadingIconbuttonThree({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  });
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomIconButton(
          height: height ?? 44.h,
          width: width ?? 44.h,
          padding: EdgeInsetsDirectional.all(12.h),
          decoration: IconButtonStyleHelper.fillBlueGray,
          child: CustomImageView(imagePath: ImageConstant.imgMenu),
        ),
      ),
    );
  }
}

class AppbarLeadingIconbuttonTwo extends StatelessWidget {
  const AppbarLeadingIconbuttonTwo({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  });
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomIconButton(
          height: height ?? 44.h,
          width: width ?? 44.h,
          padding: EdgeInsetsDirectional.all(16.h),
          decoration: IconButtonStyleHelper.fillWhiteA,
          child: CustomImageView(imagePath: ImageConstant.imgBack),
        ),
      ),
    );
  }
}

class AppbarSubtitle extends StatelessWidget {
  const AppbarSubtitle({
    super.key,
    required this.text,
    this.onTap,
    this.margin,
  });
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          text,
          style: CustomTextStyles.bodyLargeBluegray900_1.copyWith(
            color: appTheme.blueGray900,
          ),
        ),
      ),
    );
  }
}

class AppbarSubtitleFive extends StatelessWidget {
  const AppbarSubtitleFive({
    super.key,
    required this.text,
    this.onTap,
    this.margin,
  });
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          text,
          style: CustomTextStyles.bodyMediumDeeporangeA20001.copyWith(
            color: appTheme.deepOrangeA20001,
          ),
        ),
      ),
    );
  }
}

class AppbarSubtitleFour extends StatelessWidget {
  const AppbarSubtitleFour({
    super.key,
    required this.text,
    this.onTap,
    this.margin,
  });
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          text,
          style: CustomTextStyles.bodyMediumYellow900_1.copyWith(
            decoration: TextDecoration.underline,
            color: appTheme.yellow900,
          ),
        ),
      ),
    );
  }
}

class AppbarSubtitleOne extends StatelessWidget {
  const AppbarSubtitleOne({
    super.key,
    required this.text,
    this.onTap,
    this.margin,
  });
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          text,
          style: theme.textTheme.bodyLarge!.copyWith(color: appTheme.gray900),
        ),
      ),
    );
  }
}

class AppbarSubtitleSeven extends StatelessWidget {
  const AppbarSubtitleSeven({
    super.key,
    required this.text,
    this.onTap,
    this.margin,
  });
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          text,
          style: CustomTextStyles.labelLargeSenDeeporangeA200.copyWith(
            color: appTheme.deepOrangeA200,
          ),
        ),
      ),
    );
  }
}

class AppbarSubtitleSix extends StatelessWidget {
  const AppbarSubtitleSix({
    super.key,
    required this.text,
    this.onTap,
    this.margin,
  });
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          text,
          style: CustomTextStyles.bodyMediumGray700_1.copyWith(
            color: appTheme.gray700,
          ),
        ),
      ),
    );
  }
}

class AppbarSubtitleThree extends StatelessWidget {
  const AppbarSubtitleThree({
    super.key,
    required this.text,
    this.onTap,
    this.margin,
  });
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          text,
          style: CustomTextStyles.titleSmallTeal600.copyWith(
            decoration: TextDecoration.underline,
            color: appTheme.teal600,
          ),
        ),
      ),
    );
  }
}

class AppbarSubtitleTwo extends StatelessWidget {
  const AppbarSubtitleTwo({
    super.key,
    required this.text,
    this.onTap,
    this.margin,
  });
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          text,
          style: CustomTextStyles.titleSmallPoppinsDeeporangeA20001.copyWith(
            color: appTheme.deepOrangeA20001,
          ),
        ),
      ),
    );
  }
}

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({super.key, required this.text, this.onTap, this.margin});
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          text,
          style: CustomTextStyles.bodyLargeWhiteA700_1.copyWith(
            color: appTheme.whiteA700,
          ),
        ),
      ),
    );
  }
}

class AppbarTitleDropdown extends StatelessWidget {
  const AppbarTitleDropdown({
    super.key,
    required this.hintText,
    required this.items,
    required this.onTap,
    this.margin,
  });
  final String? hintText;
  final List<SelectionPopupModel> items;
  final Function(SelectionPopupModel) onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: SizedBox(
        width: double.maxFinite,
        child: CustomDropDown(
          hintText: "lbl_burger".tr.toUpperCase(),
          items: items,
          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: 18.h,
            vertical: 14.h,
          ),
          borderDecoration: DropDownStyleHelper.outlineBlueGray,
        ),
      ),
    );
  }
}

class AppbarTrailingCircleimage extends StatelessWidget {
  const AppbarTrailingCircleimage({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  });
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: CustomImageView(
          imagePath: imagePath!,
          height: height ?? 44.h,
          width: width ?? 44.h,
          fit: BoxFit.contain,
          radius: BorderRadius.circular(22.0.h),
        ),
      ),
    );
  }
}

class AppbarTrailingIconbutton extends StatelessWidget {
  const AppbarTrailingIconbutton({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  });
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomIconButton(
          height: height ?? 44.h,
          width: width ?? 44.h,
          padding: EdgeInsetsDirectional.all(12.h),
          decoration: IconButtonStyleHelper.fillGrayTL22,
          child: CustomImageView(imagePath: ImageConstant.imgBag),
        ),
      ),
    );
  }
}

class AppbarTrailingIconbuttonFour extends StatelessWidget {
  const AppbarTrailingIconbuttonFour({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  });
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomIconButton(
          height: height ?? 44.h,
          width: width ?? 44.h,
          padding: EdgeInsetsDirectional.all(14.h),
          decoration: IconButtonStyleHelper.fillWhiteA,
          child: CustomImageView(imagePath: ImageConstant.imgCloseOrange600),
        ),
      ),
    );
  }
}

class AppbarTrailingIconbuttonOne extends StatelessWidget {
  const AppbarTrailingIconbuttonOne({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  });
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomIconButton(
          height: height ?? 44.h,
          width: width ?? 44.h,
          padding: EdgeInsetsDirectional.all(14.h),
          decoration: IconButtonStyleHelper.fillOnPrimary,
          child: CustomImageView(imagePath: ImageConstant.imgRewindWhiteA700),
        ),
      ),
    );
  }
}

class AppbarTrailingIconbuttonThree extends StatelessWidget {
  const AppbarTrailingIconbuttonThree({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  });
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomIconButton(
          height: height ?? 44.h,
          width: width ?? 44.h,
          padding: EdgeInsetsDirectional.all(14.h),
          decoration: IconButtonStyleHelper.fillBlueGray,
          child: CustomImageView(imagePath: ImageConstant.imgMore),
        ),
      ),
    );
  }
}

class AppbarTrailingIconbuttonTwo extends StatelessWidget {
  const AppbarTrailingIconbuttonTwo({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  });
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomIconButton(
          height: height ?? 44.h,
          width: width ?? 44.h,
          padding: EdgeInsetsDirectional.all(10.h),
          decoration: IconButtonStyleHelper.fillBlueGray,
          child: CustomImageView(imagePath: ImageConstant.imgUserYellow90001),
        ),
      ),
    );
  }
}

class AppbarTrailingImage extends StatelessWidget {
  const AppbarTrailingImage({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  });
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsetsDirectional.zero,
      child: InkWell(
        borderRadius: BorderRadiusStyle.roundedBorder1,
        onTap: () {
          onTap?.call();
        },
        child: CustomImageView(
          imagePath: imagePath!,
          height: height ?? 6.h,
          width: width ?? 10.h,
          fit: BoxFit.contain,
          radius: BorderRadius.circular(1.h),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.height,
    this.shape,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  });
  final double? height;
  final ShapeBorder? shape;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shape: shape,
      toolbarHeight: height ?? 56.h,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(SizeUtils.width, height ?? 56.h);
}
