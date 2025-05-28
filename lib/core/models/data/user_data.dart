import '/core/app_export.dart';

/// UserData model representing a UserData with authentication and profile details.
/// UserData model representing detailed UserData information.
class UserData {
  /// Phone details.
  Phone? phone;

  /// User ID.
  String? id;

  /// First name.
  String? firstName;

  /// Last name.
  String? lastName;

  /// Email address.
  String? email;

  /// Role ID.
  String? role;

  /// Order number.
  num? orderBy;

  /// Account status.
  String? status;

  /// ID of the user who last updated this record.
  dynamic updatedBy;

  /// ID of the user who deleted this record.
  dynamic deletedBy;

  /// Deletion timestamp.
  DateTime? deletedAt;

  /// Creation timestamp.
  DateTime? createdAt;

  /// Update timestamp.
  DateTime? updatedAt;

  UserData({
    this.phone,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.orderBy,
    this.status,
    this.updatedBy,
    this.deletedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  /// Converts JSON to UserData.
  UserData transform(Map<String, dynamic> json, {Response? response}) {
    return UserData.fromJson(json);
  }

  /// Factory constructor to create UserData from JSON.
  factory UserData.fromJson(Map other) {
    Map<String, dynamic> json = Map<String, dynamic>.from(other);
    return UserData(
      phone: json['phone'] != null ? Phone.fromJson(json['phone']) : null,
      id: json['id'] ?? json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      role: json['role'],
      orderBy: json['orderBy'],
      status: json['status'],
      updatedBy: json['updatedBy'],
      deletedBy: json['deletedBy'],
      deletedAt: json['deletedAt'] != null
          ? DateTime.tryParse(json['deletedAt'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  /// Converts UserData to JSON.
  Map<String, dynamic> toJson({List<String> skip = const []}) {
    final Map<String, dynamic> dataMap = {};
    void addField(String key, dynamic value) {
      if (!skip.contains(key)) dataMap[key] = value;
    }

    addField('phone', phone?.toJson());
    addField('id', id);
    addField('firstName', firstName);
    addField('lastName', lastName);
    addField('email', email);
    addField('role', role);
    addField('orderBy', orderBy);
    addField('status', status);
    addField('updatedBy', updatedBy);
    addField('deletedBy', deletedBy);
    addField('deletedAt', deletedAt?.toIso8601String());
    addField('createdAt', createdAt?.toIso8601String());
    addField('updatedAt', updatedAt?.toIso8601String());

    return dataMap;
  }

  /// Creates a copy of UserData with updated values.
  UserData copyWith({
    Phone? phone,
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? role,
    num? orderBy,
    String? status,
    dynamic updatedBy,
    dynamic deletedBy,
    DateTime? deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserData(
      phone: phone ?? this.phone,
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      role: role ?? this.role,
      orderBy: orderBy ?? this.orderBy,
      status: status ?? this.status,
      updatedBy: updatedBy ?? this.updatedBy,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
