import '/core/app_export.dart';

class HiveBox {
  static const String theme = 'theme';
  static const String preferences = 'preferences';
  static const String translations = 'translations';

  static Future<void> onInit() async {
    await Hive.openBox(theme);
    await Hive.openBox(preferences);
    await Hive.openBox(translations);
  }

  static Future<void> onClear() async {
    await Hive.openBox(theme).then((box) => box.clear());
    await Hive.openBox(preferences).then((box) => box.clear());
    await Hive.openBox(translations).then((box) => box.clear());
  }
}
