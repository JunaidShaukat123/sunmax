import '/core/app_export.dart';

/// UserData model representing a UserData with authentication and profile details.
/// UserData model representing detailed UserData information.
class UserData {
  /// The unique identifier of the user.
  num? id;

  /// The role ID of the user.
  num? role;

  /// The first name of the user.
  String? firstName;

  /// The last name of the user.
  String? lastName;

  /// The email address of the user.
  String? email;

  /// The country code of the user's phone number.
  String? countryCode;

  /// The phone number of the user.
  String? phoneNumber;

  /// The Firebase Cloud Messaging (FCM) token of the user.
  String? fcmToken;

  /// The URL of the user's avatar.
  String? avatar;

  /// A flag indicating whether the user's email is verified.
  bool isEmailVerified;

  /// A flag indicating whether the user's phone is verified.
  bool isPhoneVerified;

  /// A flag indicating whether the user is eligible for a free plan.
  bool isFreePlanEligible;

  /// The competition level of the user, e.g., "novice".
  String? competitionLevel;

  /// The provider used for authentication, e.g., "email".
  String? provider;

  /// The sort order of the user.
  num? sortOrder;

  /// The reason for the user's status or actions.
  String? reason;

  /// The status of the user, e.g., "Active".
  String? status;

  /// The ID or user data representing who created the user.
  UserData? createdBy;

  /// The ID or user data representing who last updated the user.
  UserData? updatedBy;

  /// The ID or user data representing who deleted the user.
  UserData? deletedBy;

  /// The date and time when the user was created.
  DateTime? createdAt;

  /// The date and time when the user was last updated.
  DateTime? updatedAt;

  /// The date and time when the user was deleted.
  DateTime? deletedAt;

  /// The slug of the user, e.g., "User".
  String? slug;

  /// The full name of the user.
  String? name;

  /// The formatted phone number of the user.
  String? phone;

  /// The name of the user's role.
  String? roleName;

  /// The type of jeans preferred by the user, e.g., "Father Fit".
  String? jeans;

  /// General information about the user.
  dynamic general;

  /// Paternal information about the user.
  dynamic paternal;

  /// Personal information about the user.
  dynamic personal;

  /// Institute information about the user.
  dynamic institute;

  /// Document information about the user.
  dynamic documents;

  /// Subscription information about the user.
  dynamic subscription;

  /// Assessment information about the user.
  dynamic assessment;

  /// Constructor for the User model.
  UserData({
    this.id,
    this.role,
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.phoneNumber,
    this.fcmToken,
    this.avatar,
    this.isEmailVerified = false,
    this.isPhoneVerified = false,
    this.isFreePlanEligible = false,
    this.competitionLevel,
    this.provider,
    this.sortOrder,
    this.reason,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.slug,
    this.name,
    this.phone,
    this.roleName,
    this.jeans,
    this.general,
    this.paternal,
    this.personal,
    this.institute,
    this.documents,
    this.subscription,
    this.assessment,
  });

  /// Converts a JSON map into a User object.
  ///
  /// [json] is the map containing the user data in JSON format.
  /// Returns a User instance.
  UserData transform(Map<String, dynamic> json, {Response? response}) {
    return UserData.fromJson(json);
  }

  /// Factory constructor to create a User object from a JSON map.
  ///
  /// [json] is the map containing the user data in JSON format.
  factory UserData.fromJson(Map other) {
    Map<String, dynamic> json = Map<String, dynamic>.from(other);

    return UserData(
      id: json['id'],
      role: json['role'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      countryCode: json['country_code'],
      phoneNumber: json['phone_number'],
      fcmToken: json['fcm_token'],
      avatar: json['avatar'],
      isEmailVerified: json['is_email_verified'],
      isPhoneVerified: json['is_phone_verified'],
      isFreePlanEligible: json['is_free_plan_eligible'],
      competitionLevel: json['competition_level'],
      provider: json['provider'],
      sortOrder: json['sort_order'],
      reason: json['reason'],
      status: json['status'],
      createdBy:
          json['created_by'] != null
              ? UserData.fromJson(json['created_by'])
              : null,
      updatedBy:
          json['updated_by'] != null
              ? UserData.fromJson(json['updated_by'])
              : null,
      deletedBy:
          json['deleted_by'] != null
              ? UserData.fromJson(json['deleted_by'])
              : null,
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.parse(json['updated_at'])
              : null,
      deletedAt:
          json['deleted_at'] != null
              ? DateTime.parse(json['deleted_at'])
              : null,
      slug: json['slug'],
      name: json['name'],
      phone: json['phone'],
      roleName: json['role_name'],
      jeans: json['jeans'],
      general: json['general'],
      paternal: json['paternal'],
      personal: json['personal'],
      institute: json['institute'],
      documents: json['documents'],
      subscription: json['subscription'],
      assessment: json['assessment'],
    );
  }

  /// Converts the User object back to a JSON map.
  ///
  /// [skip] is a list of fields to exclude from the JSON map.
  /// Returns the JSON map representing the user.
  Map<String, dynamic> toJson({List<String> skip = const []}) {
    final Map<String, dynamic> dataMap = {};

    void addField(String key, dynamic value) {
      if (!skip.contains(key) && value != null) dataMap[key] = value;
    }

    addField('id', id);
    addField('role', role);
    addField('first_name', firstName);
    addField('last_name', lastName);
    addField('email', email);
    addField('country_code', countryCode);
    addField('phone_number', phoneNumber);
    addField('fcm_token', fcmToken);
    addField('avatar', avatar);
    addField('is_email_verified', isEmailVerified);
    addField('is_phone_verified', isPhoneVerified);
    addField('is_free_plan_eligible', isFreePlanEligible);
    addField('competition_level', competitionLevel);
    addField('provider', provider);
    addField('sort_order', sortOrder);
    addField('reason', reason);
    addField('status', status);
    addField('created_by', createdBy?.toJson());
    addField('updated_by', updatedBy?.toJson());
    addField('deleted_by', deletedBy?.toJson());
    addField('created_at', createdAt?.toIso8601String());
    addField('updated_at', updatedAt?.toIso8601String());
    addField('deleted_at', deletedAt?.toIso8601String());
    addField('slug', slug);
    addField('name', name);
    addField('phone', phone);
    addField('role_name', roleName);
    addField('jeans', jeans);
    addField('general', general);
    addField('paternal', paternal);
    addField('personal', personal);
    addField('institute', institute);
    addField('documents', documents);
    addField('subscription', subscription);
    addField('assessment', assessment);

    return dataMap;
  }

  /// Creates a copy of the current User instance with optional changes.
  ///
  /// [id], [firstName], [lastName], etc., are the fields that can be overridden.
  /// Returns a new User instance with the updated values.
  UserData copyWith({
    num? id,
    num? role,
    String? firstName,
    String? lastName,
    String? email,
    String? countryCode,
    String? phoneNumber,
    String? fcmToken,
    String? avatar,
    bool? isEmailVerified,
    bool? isPhoneVerified,
    bool? isFreePlanEligible,
    String? competitionLevel,
    String? provider,
    num? sortOrder,
    String? reason,
    String? status,
    UserData? createdBy,
    UserData? updatedBy,
    UserData? deletedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    String? slug,
    String? name,
    String? phone,
    String? roleName,
    String? jeans,
    dynamic general,
    dynamic paternal,
    dynamic personal,
    dynamic institute,
    dynamic documents,
    dynamic subscription,
    dynamic assessment,
  }) {
    return UserData(
      id: id ?? this.id,
      role: role ?? this.role,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fcmToken: fcmToken ?? this.fcmToken,
      avatar: avatar ?? this.avatar,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      isFreePlanEligible: isFreePlanEligible ?? this.isFreePlanEligible,
      competitionLevel: competitionLevel ?? this.competitionLevel,
      provider: provider ?? this.provider,
      sortOrder: sortOrder ?? this.sortOrder,
      reason: reason ?? this.reason,
      status: status ?? this.status,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      deletedBy: deletedBy ?? this.deletedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      roleName: roleName ?? this.roleName,
      jeans: jeans ?? this.jeans,
      general: general ?? this.general,
      paternal: paternal ?? this.paternal,
      personal: personal ?? this.personal,
      institute: institute ?? this.institute,
      documents: documents ?? this.documents,
      subscription: subscription ?? this.subscription,
      assessment: assessment ?? this.assessment,
    );
  }
}
