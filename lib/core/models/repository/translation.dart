import '/core/app_export.dart';

class TranslationRequest {
  num? page;
  num? perPage;
  String? language;

  TranslationRequest({this.language, this.page, this.perPage});

  /// Converts JSON to TranslationResponse.
  TranslationRequest transform(
    Map<String, dynamic> json, {
    Response? response,
  }) {
    return TranslationRequest.fromJson(json);
  }

  /// Factory constructor to create TranslationResponse from JSON.
  factory TranslationRequest.fromJson(Map other) {
    Map<String, dynamic> json = Map<String, dynamic>.from(other);

    return TranslationRequest(
      page: json['page'],
      perPage: json['perPage'],
      language: json['language'],
    );
  }

  /// Converts TranslationResponse to JSON.
  Map<String, dynamic> toJson({List<String> skip = const []}) {
    final Map<String, dynamic> dataMap = {};

    void addField(String key, dynamic value) {
      if (!skip.contains(key)) {
        dataMap[key] = value;
      }
    }

    addField('page', page);
    addField('perPage', perPage);
    addField('language', language);

    return dataMap;
  }

  /// Creates a copy of TranslationResponse with updated values.
  TranslationRequest copyWith({String? language, num? page, num? perPage}) {
    return TranslationRequest(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      language: language ?? this.language,
    );
  }
}

/// TranslationResponse model representing the API response for languages.
class TranslationResponse {
  /// The status code of the response.
  num code;

  /// Indicates if the request was successful.
  bool status;

  /// The list of language data.
  List<Translation> data;

  /// The response message.
  String? message;

  /// Pagination information.
  Paginator? paginator;

  /// Error object (typically empty in successful responses)
  dynamic error;

  /// List of error messages
  List<String>? errors;

  /// Constructor for TranslationResponse.
  TranslationResponse({
    this.error,
    this.errors,
    this.message,
    this.paginator,
    this.code = 500,
    this.status = false,
    this.data = const [],
  });

  /// Converts JSON to TranslationResponse.
  TranslationResponse transform(
    Map<String, dynamic> json, {
    Response? response,
  }) {
    return TranslationResponse.fromJson(json);
  }

  /// Factory constructor to create TranslationResponse from JSON.
  factory TranslationResponse.fromJson(Map other) {
    Map<String, dynamic> json = Map<String, dynamic>.from(other);

    return TranslationResponse(
      code: json['code'],
      error: json['error'],
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List<Translation>.from(
              json['data'].map((item) => Translation.fromJson(item)),
            )
          : <Translation>[],
      paginator: json['paginator'] != null
          ? Paginator.fromJson(json['paginator'])
          : null,
      errors: json['errors'] != null ? List<String>.from(json['errors']) : null,
    );
  }

  /// Converts TranslationResponse to JSON.
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

  /// Creates a copy of TranslationResponse with updated values.
  TranslationResponse copyWith({
    num? code,
    bool? status,
    dynamic error,
    String? message,
    List<Translation>? data,
    Paginator? paginator,
    List<String>? errors,
  }) {
    return TranslationResponse(
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
