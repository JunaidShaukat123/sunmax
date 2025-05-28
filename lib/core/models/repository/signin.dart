import '/core/app_export.dart';

/// SigninRequest model representing authentication credentials.
class SigninRequest {
  /// Authentication provider (email or phone)
  String? provider;

  /// Identifier (email address or phone number object)
  dynamic identifier;

  /// Account password
  String? password;

  /// Constructor for SigninRequest.
  SigninRequest({this.provider, this.identifier, this.password});

  /// Converts a JSON map into an SigninRequest object.
  ///
  /// [json] is the map containing the authentication data in JSON format.
  /// Returns an SigninRequest instance.
  SigninRequest transform(Map<String, dynamic> json, {Response? response}) {
    return SigninRequest.fromJson(json);
  }

  /// Factory constructor to create an SigninRequest object from a JSON map.
  ///
  /// [json] is the map containing the authentication data in JSON format.
  factory SigninRequest.fromJson(Map other) {
    Map<String, dynamic> json = Map<String, dynamic>.from(other);

    return SigninRequest(
      provider: json['provider'],
      identifier: json['identifier'],
      password: json['password'],
    );
  }

  /// Converts the SigninRequest object back to a JSON map.
  ///
  /// [skip] is a list of fields to exclude from the JSON map.
  /// Returns the JSON map representing the SigninRequest.
  Map<String, dynamic> toJson({List<String> skip = const []}) {
    final Map<String, dynamic> dataMap = {};

    void addField(String key, dynamic value) {
      if (!skip.contains(key)) {
        if (value != null) dataMap[key] = value;
      }
    }

    addField('provider', provider);
    addField('identifier', identifier);
    addField('password', password);

    return dataMap;
  }

  /// Creates a copy of the current SigninRequest instance with optional changes.
  ///
  /// [provider], [identifier], and [password] can be overridden.
  /// Returns a new SigninRequest instance with the updated values.
  SigninRequest copyWith({
    String? provider,
    dynamic identifier,
    String? password,
  }) {
    return SigninRequest(
      provider: provider ?? this.provider,
      identifier: identifier ?? this.identifier,
      password: password ?? this.password,
    );
  }

  /// Helper method to check if the identifier is an email
  bool get isEmailIdentifier => provider == 'email' && identifier is String;

  /// Helper method to check if the identifier is a phone number object
  bool get isPhoneIdentifier =>
      provider == 'phone' && identifier is Map<String, dynamic>;

  /// Gets the email address if provider is email
  String? get email => isEmailIdentifier ? identifier as String? : null;

  /// Gets the phone number object if provider is phone
  Map<String, dynamic>? get phoneNumber =>
      isPhoneIdentifier ? identifier as Map<String, dynamic>? : null;
}

/// PhoneIdentifier model for phone number authentication
class PhoneIdentifier {
  /// Country calling code prefix (e.g., "92")
  String? prefix;

  /// Local phone number (e.g., "3181524867")
  String? number;

  /// Constructor for PhoneIdentifier
  PhoneIdentifier({this.prefix, this.number});

  /// Converts to a map for JSON serialization
  Map<String, dynamic> toMap() {
    return {'prefix': prefix, 'number': number};
  }

  /// Creates from a map (JSON deserialization)
  factory PhoneIdentifier.fromMap(Map<String, dynamic> map) {
    return PhoneIdentifier(prefix: map['prefix'], number: map['number']);
  }
}

/// SigninResponse model representing the API response for languages.
class SigninResponse {
  /// The status code of the response.
  num code = 500;

  /// Indicates if the request was successful.
  bool status = false;

  /// The userdata data.
  UserData? data;

  /// The response message.
  String? message;

  /// Pagination information.
  Paginator? paginator;

  /// Error object (typically empty in successful responses).
  dynamic error;

  /// List of error messages.
  List<String> errors = [];

  /// Authentication token.
  String? token;

  SigninResponse({
    this.code = 500,
    this.status = false,
    this.data,
    this.message,
    this.paginator,
    this.error,
    this.errors = const [],
    this.token,
  });

  /// Converts JSON to SigninResponse.
  SigninResponse transform(Map<String, dynamic> json, {Response? response}) {
    return SigninResponse.fromJson(json);
  }

  /// Factory constructor to create SigninResponse from JSON.
  factory SigninResponse.fromJson(Map other) {
    Map<String, dynamic> json = Map<String, dynamic>.from(other);
    return SigninResponse(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      token: json['token'],
      error: json['error'],
      errors: json['errors'] != null ? List<String>.from(json['errors']) : [],
      paginator: json['paginator'] != null
          ? Paginator.fromJson(json['paginator'])
          : null,
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  /// Converts SigninResponse to JSON.
  Map<String, dynamic> toJson({List<String> skip = const []}) {
    final Map<String, dynamic> dataMap = {};
    void addField(String key, dynamic value) {
      if (!skip.contains(key)) {
        if (value != null) dataMap[key] = value;
      }
    }

    addField('code', code);
    addField('status', status);
    addField('message', message);
    addField('token', token);
    addField('error', error);
    addField('errors', errors);
    addField('paginator', paginator?.toJson());
    addField('data', data?.toJson());

    return dataMap;
  }

  /// Creates a copy of SigninResponse with updated values.
  SigninResponse copyWith({
    num? code,
    bool? status,
    String? message,
    String? token,
    dynamic error,
    List<String>? errors,
    Paginator? paginator,
    UserData? data,
  }) {
    return SigninResponse(
      code: code ?? this.code,
      status: status ?? this.status,
      message: message ?? this.message,
      token: token ?? this.token,
      error: error ?? this.error,
      errors: errors ?? this.errors,
      paginator: paginator ?? this.paginator,
      data: data ?? this.data,
    );
  }
}
