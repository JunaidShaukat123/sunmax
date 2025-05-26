import 'package:flutter/material.dart';

import '/core/app_export.dart';

class NoDataFound extends StatelessWidget {
  final String? message;
  final void Function()? onTryAgain;

  const NoDataFound({super.key, this.onTryAgain, this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: InkWell(
        splashColor: appTheme.transparent,
        highlightColor: appTheme.transparent,
        onTap: onTryAgain,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
               ],
        ),
      ),
    );
  }
}
