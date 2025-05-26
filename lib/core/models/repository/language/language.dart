import '/core/app_export.dart';

class LanguageRequest {
  num? perPage;
  LanguageRequest({this.perPage});

  /// Converts JSON to LanguageResponse.
  LanguageRequest transform(Map<String, dynamic> json, {Response? response}) {
    return LanguageRequest.fromJson(json);
  }

  /// Factory constructor to create LanguageResponse from JSON.
  factory LanguageRequest.fromJson(Map other) {
    Map<String, dynamic> json = Map<String, dynamic>.from(other);

    return LanguageRequest(perPage: json['perPage']);
  }

  /// Converts LanguageResponse to JSON.
  Map<String, dynamic> toJson({List<String> skip = const []}) {
    final Map<String, dynamic> dataMap = {};

    void addField(String key, dynamic value) {
      if (!skip.contains(key)) {
        dataMap[key] = value;
      }
    }

    addField('perPage', 'perPage');

    return dataMap;
  }

  /// Creates a copy of LanguageResponse with updated values.
  LanguageRequest copyWith({num? perPage}) {
    return LanguageRequest(perPage: perPage ?? this.perPage);
  }
}

/// LanguageResponse model representing the API response for languages.
class LanguageResponse {
  /// The status code of the response.
  num code;

  /// Indicates if the request was successful.
  bool status;

  /// The list of language data.
  List<Language> data;

  /// The response message.
  String? message;

  /// Pagination information.
  Paginator? paginator;

  /// Error object (typically empty in successful responses)
  dynamic error;

  /// List of error messages
  List<String>? errors;

  /// Constructor for LanguageResponse.
  LanguageResponse({
    this.error,
    this.errors,
    this.message,
    this.paginator,
    this.code = 500,
    this.status = false,
    this.data = const [],
  });

  /// Converts JSON to LanguageResponse.
  LanguageResponse transform(Map<String, dynamic> json, {Response? response}) {
    return LanguageResponse.fromJson(json);
  }

  /// Factory constructor to create LanguageResponse from JSON.
  factory LanguageResponse.fromJson(Map other) {
    Map<String, dynamic> json = Map<String, dynamic>.from(other);

    return LanguageResponse(
      code: json['code'],
      error: json['error'],
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List<Language>.from(
              json['data'].map((item) => Language.fromJson(item)),
            )
          : <Language>[],
      paginator: json['paginator'] != null
          ? Paginator.fromJson(json['paginator'])
          : null,
      errors: json['errors'] != null ? List<String>.from(json['errors']) : null,
    );
  }

  /// Converts LanguageResponse to JSON.
  Map<String, dynamic> toJson({List<String> skip = const []}) {
    final Map<String, dynamic> dataMap = {};

    void addField(String key, dynamic value) {
      if (!skip.contains(key)) {
        if (value != null) dataMap[key] = value;
      }
    }

    addField('code', code);
    addField('error', error);
    addField('status', status);
    addField('errors', errors);
    addField('message', message);
    addField('paginator', paginator?.toJson());
    addField('data', data.map((item) => item.toJson()).toList());

    return dataMap;
  }

  /// Creates a copy of LanguageResponse with updated values.
  LanguageResponse copyWith({
    num? code,
    bool? status,
    dynamic error,
    String? message,
    List<Language>? data,
    Paginator? paginator,
    List<String>? errors,
  }) {
    return LanguageResponse(
      code: code ?? this.code,
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
      paginator: paginator ?? this.paginator,
      error: error ?? this.error,
      errors: errors ?? this.errors,
    );
  }
}
