import '/core/app_export.dart';

/// Paginator model for pagination information.
class Paginator {
  /// Total number of items
  num? total;

  /// Items per page
  num? perPage;

  /// Total number of pages
  num? pageCount;

  /// Current page number
  num? currentPage;

  /// Serial number
  num? slNo;

  /// Whether previous page exists
  bool? hasPrevPage;

  /// Whether next page exists
  bool? hasNextPage;

  /// Previous page number
  num? prev;

  /// Next page number
  num? next;

  /// Constructor for Paginator.
  Paginator({
    this.total,
    this.perPage,
    this.pageCount,
    this.currentPage,
    this.slNo,
    this.hasPrevPage,
    this.hasNextPage,
    this.prev,
    this.next,
  });

  /// Converts JSON to Paginator.
  Paginator transform(Map<String, dynamic> json, {Response? response}) {
    return Paginator.fromJson(json);
  }

  /// Factory constructor to create Paginator from JSON.
  factory Paginator.fromJson(Map other) {
    Map<String, dynamic> json = Map<String, dynamic>.from(other);

    return Paginator(
      total: json['total'],
      perPage: json['perPage'],
      pageCount: json['pageCount'],
      currentPage: json['currentPage'],
      slNo: json['slNo'],
      hasPrevPage: json['hasPrevPage'],
      hasNextPage: json['hasNextPage'],
      prev: json['prev'],
      next: json['next'],
    );
  }

  /// Converts Paginator to JSON.
  Map<String, dynamic> toJson({List<String> skip = const []}) {
    final Map<String, dynamic> dataMap = {};

    void addField(String key, dynamic value) {
      if (!skip.contains(key)) {
        if (value != null) dataMap[key] = value;
      }
    }

    addField('total', total);
    addField('perPage', perPage);
    addField('pageCount', pageCount);
    addField('currentPage', currentPage);
    addField('slNo', slNo);
    addField('hasPrevPage', hasPrevPage);
    addField('hasNextPage', hasNextPage);
    addField('prev', prev);
    addField('next', next);

    return dataMap;
  }

  /// Creates a copy of Paginator with updated values.
  Paginator copyWith({
    num? total,
    num? perPage,
    num? pageCount,
    num? currentPage,
    num? slNo,
    bool? hasPrevPage,
    bool? hasNextPage,
    num? prev,
    num? next,
  }) {
    return Paginator(
      total: total ?? this.total,
      perPage: perPage ?? this.perPage,
      pageCount: pageCount ?? this.pageCount,
      currentPage: currentPage ?? this.currentPage,
      slNo: slNo ?? this.slNo,
      hasPrevPage: hasPrevPage ?? this.hasPrevPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      prev: prev ?? this.prev,
      next: next ?? this.next,
    );
  }
}
