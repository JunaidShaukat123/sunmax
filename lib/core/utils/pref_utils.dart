import 'dart:async';

import 'package:flutter/material.dart';

import '/core/app_export.dart';

class PrefUtils extends GetxController {
  Rx<String> theme = Rx<String>('light');

  Box box = Hive.box(HiveBox.preferences);

  PrefUtils();

  @override
  void onInit() {
    super.onInit();
    theme.value = box.get('themeData', defaultValue: 'light');
  }

  Future<void> setThemeData(String value) async {
    theme.value = value;
    await box.put('theme', value);
  }

  String getThemeData() {
    try {
      theme.value = box.get('theme', defaultValue: 'light');

      return theme.value;
    } catch (e) {
      return 'light';
    }
  }

  Future<void> onChangeTheme(String value) async {
    theme.value = value;
    Get.changeThemeMode(
      theme.value == 'dark' ? ThemeMode.dark : ThemeMode.light,
    );
    Get.forceAppUpdate();
    await box.put('theme', value);
  }
}
