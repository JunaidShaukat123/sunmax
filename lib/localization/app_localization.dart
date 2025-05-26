import 'package:flutter/material.dart';

import '/core/app_export.dart';
import 'en.dart';

// class AppLocalization extends Translations {
//   final translations = Get.find<TranslationsController>();

//   @override
//   Map<String, Map<String, String>> get keys => translations.keys;
// }

class AppLocalization extends GetxController {
  Locale? currentLocale = Get.locale ?? Locale('en');
  Locale? fallbackLocale = Locale('en');

  Box get box => Hive.box(HiveBox.translations);

  final RxMap<String, Map<String, String>> keys =
      <String, Map<String, String>>{}.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    box.listenable().addListener(() {
      getTranslations();
    });
    Future.wait([syncTranslation()]);
  }

  Future<void> syncTranslation() async {
    Box preferences = Hive.box(HiveBox.preferences);
    Language language = Language.fromBox(preferences.get('language'));
    if (language.code == null) {
      return await put('en', en);
    } else {
      Get.lazyPut(() => Api());
      Get.lazyPut(() => Preference());
      Get.lazyPut(() => LanguageController());
      await Get.find<LanguageController>().getTranslation(
        language,
        processing: false,
      );
    }
  }

  String translate(String key) {
    Locale locale = Get.locale ?? Locale('en');

    final fullKey = "${locale.languageCode}_${locale.countryCode}";
    final langKey = locale.languageCode;

    // Try full locale (e.g., en_US)
    if (keys.containsKey(fullKey) && keys[fullKey]!.containsKey(key)) {
      return keys[fullKey]![key]!;
    }

    // Try language only (e.g., en)
    if (keys.containsKey(langKey) && keys[langKey]!.containsKey(key)) {
      return keys[langKey]![key]!;
    }

    // Try fallback
    if (fallbackLocale != null) {
      final fbFull =
          "${fallbackLocale!.languageCode}_${fallbackLocale!.countryCode}";
      final fbLang = fallbackLocale!.languageCode;

      if (keys.containsKey(fbFull) && keys[fbFull]!.containsKey(key)) {
        return keys[fbFull]![key]!;
      }

      if (keys.containsKey(fbLang) && keys[fbLang]!.containsKey(key)) {
        return keys[fbLang]![key]!;
      }
    }

    return key; // fallback to key itself
  }

  void getTranslations() {
    Map<String, Map<String, String>> temp = {};
    for (var key in box.keys) {
      var value = box.get(key);
      temp[key.toString()] = Map<String, String>.from(value);
    }
    keys.value = temp;
    update();
  }

  Future<void> put(String code, Map<String, String> translations) async {
    try {
      await box.put(code, translations);
    } catch (e) {
      console.error(e);
    }
  }
}

extension Trans on String {
  String get tr => Get.find<AppLocalization>().translate(this);

  String trArgs([List<String> args = const []]) {
    var translated = tr;
    for (final arg in args) {
      translated = translated.replaceFirst(RegExp(r'%s'), arg);
    }
    return translated;
  }

  String trParams([Map<String, String> params = const {}]) {
    var translated = tr;
    params.forEach((key, value) {
      translated = translated.replaceAll('@$key', value);
    });
    return translated;
  }

  String trPlural([
    String? pluralKey,
    int? count,
    List<String> args = const [],
  ]) {
    return (count ?? 1) == 1 ? trArgs(args) : (pluralKey ?? this).trArgs(args);
  }

  String trPluralParams([
    String? pluralKey,
    int? count,
    Map<String, String> params = const {},
  ]) {
    return (count ?? 1) == 1
        ? trParams(params)
        : (pluralKey ?? this).trParams(params);
  }
}
