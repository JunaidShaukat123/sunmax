import 'package:flutter/material.dart';

import '../core/app_export.dart';

class SelectionPopupModel {
  SelectionPopupModel({
    this.id,
    required this.title,
    this.value,
    this.isSelected = false,
  });
  int? id;
  String title;
  dynamic value;
  bool isSelected;
}

extension DropDownStyleHelper on CustomDropDown {
  static OutlineInputBorder get outlineBlueGray => OutlineInputBorder(
    borderRadius: BorderRadius.circular(22.h),
    borderSide: BorderSide(color: appTheme.blueGray50, width: 1),
  );
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.focusNode,
    this.icon,
    this.iconSize,
    this.autofocus = false,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.items,
    this.prefix,
    this.prefixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
    this.onChanged,
  });
  final AlignmentGeometry? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final FocusNode? focusNode;
  final Widget? icon;
  final double? iconSize;
  final bool? autofocus;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final List<SelectionPopupModel>? items;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<SelectionPopupModel>? validator;
  final Function(SelectionPopupModel)? onChanged;
  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? AlignmentDirectional.center,
            child: dropDownWidget,
          )
        : dropDownWidget;
  }

  Widget get dropDownWidget => Container(
    width: width ?? double.maxFinite,
    decoration: boxDecoration,
    child: DropdownButtonFormField<SelectionPopupModel>(
      focusNode: focusNode,
      icon: icon,
      iconSize: iconSize ?? 24,
      autofocus: autofocus!,
      isExpanded: true,
      style: textStyle ?? CustomTextStyles.labelLargeSenGray900,
      hint: Text(
        hintText ?? "",
        style: hintStyle ?? CustomTextStyles.bodyMediumGray500_1,
        overflow: TextOverflow.ellipsis,
      ),
      items: items?.map((SelectionPopupModel item) {
        return DropdownMenuItem<SelectionPopupModel>(
          value: item,
          child: Text(
            item.title,
            overflow: TextOverflow.ellipsis,
            style: hintStyle ?? CustomTextStyles.bodyMediumGray500_1,
          ),
        );
      }).toList(),
      decoration: decoration,
      validator: validator,
      onChanged: (value) {
        onChanged!(value!);
      },
    ),
  );
  InputDecoration get decoration => InputDecoration(
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    isDense: true,
    contentPadding: contentPadding ?? EdgeInsetsDirectional.all(12.h),
    fillColor: fillColor,
    filled: filled,
    border:
        borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.h),
          borderSide: BorderSide(color: appTheme.gray200),
        ),
    enabledBorder:
        borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.h),
          borderSide: BorderSide(color: appTheme.gray200),
        ),
    focusedBorder:
        (borderDecoration ??
                OutlineInputBorder(borderRadius: BorderRadius.circular(6.h)))
            .copyWith(
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 1,
              ),
            ),
  );
}
