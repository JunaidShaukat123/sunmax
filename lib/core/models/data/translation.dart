import '/core/app_export.dart';

/// Translation model representing a single translation entry.
class Translation {
  /// Unique identifier (both _id and id are mapped)
  String? id;

  /// Translation key
  String? key;

  /// Translated value
  String? value;

  /// Language ID this translation belongs to
  String? language;

  /// Sorting order
  num? orderBy;

  /// Publication status
  String? status;

  /// Creator user ID
  String? createdBy;

  /// Last updater user ID
  String? updatedBy;

  /// User who deleted the record
  String? deletedBy;

  /// Deletion timestamp
  DateTime? deletedAt;

  /// Creation timestamp
  DateTime? createdAt;

  /// Last update timestamp
  DateTime? updatedAt;

  /// Constructor for Translation.
  Translation({
    this.id,
    this.key,
    this.value,
    this.language,
    this.orderBy,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  /// Converts JSON to Translation.
  Translation transform(Map<String, dynamic> json, {Response? response}) {
    return Translation.fromJson(json);
  }

  /// Factory constructor to create Translation from JSON.
  factory Translation.fromJson(Map other) {
    Map<String, dynamic> json = Map<String, dynamic>.from(other);

    return Translation(
      id: json['_id'] ?? json['id'],
      key: json['key'],
      value: json['value'],
      language: json['language'],
      orderBy: json['orderBy'],
      status: json['status'],
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      deletedBy: json['deletedBy'],
      deletedAt: json['deletedAt'] != null
          ? DateTime.parse(json['deletedAt'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  /// Converts Translation to JSON.
  Map<String, dynamic> toJson({List<String> skip = const []}) {
    final Map<String, dynamic> dataMap = {};

    void addField(String key, dynamic value) {
      if (!skip.contains(key)) {
        if (value != null) dataMap[key] = value;
      }
    }

    addField('_id', id);
    addField('id', id);
    addField('key', key);
    addField('value', value);
    addField('language', language);
    addField('orderBy', orderBy);
    addField('status', status);
    addField('createdBy', createdBy);
    addField('updatedBy', updatedBy);
    addField('deletedBy', deletedBy);
    addField('deletedAt', deletedAt?.toIso8601String());
    addField('createdAt', createdAt?.toIso8601String());
    addField('updatedAt', updatedAt?.toIso8601String());

    return dataMap;
  }

  /// Creates a copy of Translation with updated values.
  Translation copyWith({
    String? id,
    String? key,
    String? value,
    String? language,
    num? orderBy,
    String? status,
    String? createdBy,
    String? updatedBy,
    String? deletedBy,
    DateTime? deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Translation(
      id: id ?? this.id,
      key: key ?? this.key,
      value: value ?? this.value,
      language: language ?? this.language,
      orderBy: orderBy ?? this.orderBy,
      status: status ?? this.status,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
