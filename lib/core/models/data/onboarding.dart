import '/core/app_export.dart';

class Onboarding {
  int id;
  String title;
  String subtitle;
  String? imagePath;

  /// Constructor for Onboarding.
  Onboarding({
    required this.id,
    required this.title,
    required this.subtitle,
    this.imagePath,
  });

  /// Converts JSON to Onboarding.
  Onboarding transform(Map<String, dynamic> json, {Response? response}) {
    return Onboarding.fromJson(json);
  }

  /// Factory constructor to create Onboarding from JSON.
  factory Onboarding.fromJson(Map other) {
    Map<String, dynamic> json = Map<String, dynamic>.from(other);

    return Onboarding(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      imagePath: json['imagePath'],
    );
  }

  /// Converts Onboarding to JSON.
  Map<String, dynamic> toJson({List<String> skip = const []}) {
    final Map<String, dynamic> dataMap = {};

    void addField(String key, dynamic value) {
      if (!skip.contains(key)) {
        if (value != null) dataMap[key] = value;
      }
    }

    addField('id', id);
    addField('title', title);
    addField('subtitle', subtitle);
    addField('imagePath', imagePath);

    return dataMap;
  }

  /// Creates a copy of Onboarding with updated values.
  Onboarding copyWith({
    int? id,
    String? title,
    String? subtitle,
    String? imagePath,
  }) {
    return Onboarding(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
