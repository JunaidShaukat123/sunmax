import 'package:flutter/material.dart';

import '/core/app_export.dart';

class Processing extends StatelessWidget {
  final double? size;
  final double? width;
  final double? height;
  final double? stroke;
  final EdgeInsetsGeometry? padding;

  const Processing({
    super.key,
    this.size,
    this.width,
    this.height,
    this.stroke,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      padding: padding ?? EdgeInsets.all(10.h),
      child: Center(
        child: SizedBox(
          width: size ?? 24.h,
          height: size ?? 24.h,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: stroke ?? 1.h,
                backgroundColor: appTheme.gray100,
                valueColor: AlwaysStoppedAnimation<Color>(appTheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
