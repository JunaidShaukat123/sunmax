import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../core/app_export.dart';

// ignore_for_file: must_be_immutable
class CustomRatingBar extends StatelessWidget {
  CustomRatingBar({
    super.key,
    this.alignment,
    this.ignoreGestures,
    this.initialRating,
    this.itemSize,
    this.itemCount,
    this.color,
    this.unselectedColor,
    this.onRatingUpdate,
  });
  final AlignmentGeometry? alignment;
  final bool? ignoreGestures;
  final double? initialRating;
  final double? itemSize;
  final int? itemCount;
  final Color? color;
  final Color? unselectedColor;
  Function(double)? onRatingUpdate;
  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? AlignmentDirectional.center,
            child: ratingBarWidget,
          )
        : ratingBarWidget;
  }

  Widget get ratingBarWidget => RatingBar.builder(
    ignoreGestures: ignoreGestures ?? false,
    initialRating: initialRating ?? 0,
    minRating: 0,
    direction: Axis.horizontal,
    allowHalfRating: false,
    itemSize: itemSize ?? 12.h,
    unratedColor: unselectedColor ?? Colors.grey,
    itemCount: itemCount ?? 5,
    updateOnDrag: true,
    itemBuilder: (context, _) {
      return Icon(Icons.star, color: color ?? appTheme.deepOrangeA20001);
    },
    onRatingUpdate: (rating) {
      onRatingUpdate?.call(rating);
    },
  );
}
