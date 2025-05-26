import '/core/app_export.dart';

/// Language model representing a single language entry.
class Language {
  /// Unique identifier (both _id and id are mapped)
  String? id;

  /// Language name
  String? name;

  /// Native name of the language
  String? nativeName;

  /// Description of the language
  String? description;

  /// Language code (e.g., 'ar', 'en')
  String? code;

  /// Script direction (rtl/ltr)
  String? script;

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

  /// Constructor for Language.
  Language({
    this.id,
    this.name,
    this.nativeName,
    this.description,
    this.code,
    this.script,
    this.orderBy,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  String get displayName {
    if (name == null || name!.isEmpty) {
      return "";
    }

    if (nativeName == null || nativeName!.isEmpty) {
      return name!;
    }

    return "$name (${nativeName!})";
  }

  /// Converts JSON to Language.
  Language transform(Map<String, dynamic> json, {Response? response}) {
    return Language.fromJson(json);
  }

  /// Factory constructor to create Language from JSON.
  factory Language.fromJson(Map other) {
    Map<String, dynamic> json = Map<String, dynamic>.from(other);

    return Language(
      id: json['_id'] ?? json['id'],
      name: json['name'],
      nativeName: json['nativeName'],
      description: json['description'],
      code: json['code'],
      script: json['script'],
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

  /// Converts Language to JSON.
  Map<String, dynamic> toJson({List<String> skip = const []}) {
    final Map<String, dynamic> dataMap = {};

    void addField(String key, dynamic value) {
      if (!skip.contains(key)) {
        if (value != null) dataMap[key] = value;
      }
    }

    addField('_id', id);
    addField('id', id);
    addField('name', name);
    addField('nativeName', nativeName);
    addField('description', description);
    addField('code', code);
    addField('script', script);
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

  /// Creates a copy of Language with updated values.
  Language copyWith({
    String? id,
    String? name,
    String? nativeName,
    String? description,
    String? code,
    String? script,
    num? orderBy,
    String? status,
    String? createdBy,
    String? updatedBy,
    String? deletedBy,
    DateTime? deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Language(
      id: id ?? this.id,
      name: name ?? this.name,
      nativeName: nativeName ?? this.nativeName,
      description: description ?? this.description,
      code: code ?? this.code,
      script: script ?? this.script,
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

  factory Language.fromBox(Map? other) {
    if (other == null) {
      return Language();
    }

    Map<String, dynamic> json = Map<String, dynamic>.from(other);

    return Language(
      id: json['_id'] ?? json['id'],
      name: json['name'],
      nativeName: json['nativeName'],
      description: json['description'],
      code: json['code'],
      script: json['script'],
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
}
