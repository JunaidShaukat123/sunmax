import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '/core/app_export.dart';

class PhoneNumber extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? flagEmoji;
  final String? labelText;
  final String? suffixIcon;
  final String? countryCode;
  final String? textInputType;
  final EdgeInsetsGeometry? padding;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final void Function(Country)? onChanged;
  final String? Function(String?)? validator;

  const PhoneNumber({
    super.key,
    this.label,
    this.padding,
    this.hintText,
    this.onChanged,
    this.flagEmoji,
    this.labelText,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.countryCode,
    this.textInputType,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Input(
      label: label,
      padding: padding,
      hintText: hintText,
      validator: validator,
      controller: controller,
      suffixIcon: suffixIcon,
      textInputAction: textInputAction,
      textInputType: TextInputType.phone,
      inputFormatters: [
        PhoneNumberFormatter(),
        FilteringTextInputFormatter.digitsOnly,
      ],
      prefixConstraints: BoxConstraints(minWidth: 80.h, maxWidth: 80.h),
      prefix: Padding(
        padding: EdgeInsets.only(top: 7.h),
        child: InkWell(
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: true,
              countryListTheme: CountryListThemeData(
                flagSize: 25,
                backgroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
                bottomSheetHeight: 500,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                inputDecoration: InputDecoration(
                  filled: true,
                  labelText: 'search'.tr,
                  hintText: 'Start typing to search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.h),
                    borderSide: BorderSide(color: appTheme.indigo50, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.h),
                    borderSide: BorderSide(color: appTheme.indigo50, width: 1),
                  ),
                ),
              ),
              onSelect: onChanged ?? (_) {},
            );
          },
          child: Row(
            spacing: 2.h,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("$flagEmoji", style: theme.textTheme.labelLarge),
              Text("+$countryCode", style: theme.textTheme.labelLarge),
              Text("▼"),
            ],
          ),
        ),
      ),
    );
  }
}
