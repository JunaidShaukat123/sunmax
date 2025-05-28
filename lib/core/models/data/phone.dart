import '/core/app_export.dart';

/// A model representing phone details.
class Phone {
  /// The phone number prefix.
  String? prefix;

  /// The phone number.
  String? number;

  Phone({this.prefix, this.number});

  /// Converts JSON to Phone.
  Phone transform(Map<String, dynamic> json, {Response? response}) {
    return Phone.fromJson(json);
  }

  /// Factory constructor to create Phone from JSON.
  factory Phone.fromJson(Map other) {
    Map<String, dynamic> json = Map<String, dynamic>.from(other);
    return Phone(prefix: json['prefix'], number: json['number']);
  }

  /// Converts Phone to JSON.
  Map<String, dynamic> toJson({List<String> skip = const []}) {
    final Map<String, dynamic> dataMap = {};
    void addField(String key, dynamic value) {
      if (!skip.contains(key)) dataMap[key] = value;
    }

    addField('prefix', prefix);
    addField('number', number);

    return dataMap;
  }

  /// Creates a copy of Phone with updated values.
  Phone copyWith({String? prefix, String? number}) {
    return Phone(prefix: prefix ?? this.prefix, number: number ?? this.number);
  }
}
