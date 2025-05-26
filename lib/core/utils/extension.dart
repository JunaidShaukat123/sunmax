import 'package:flutter/material.dart';

import '/core/app_export.dart';

extension TimestampFormatter on int {
  /// Converts a Unix timestamp (in seconds) to a formatted date string.
  String toDate({String format = 'dd/MM/yyyy'}) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat(format).format(dateTime);
  }

  String get toFixed {
    return toStringAsFixed(2);
  }
}

extension Bools on bool {
  num get toNum {
    return this == true ? 1 : 0;
  }
}

extension PriceFormatter on dynamic {
  bool get toBool {
    if (this == null) return false;
    return this == 1 ? true : false;
  }

  /// Calculates the fluctuation rate (%) between the current price (this)
  /// and the regular price.
  /// Returns a positive value for an increase and a negative value for a decrease.
  double fluctuationRate(num regularPrice) {
    if (regularPrice == 0) {
      throw ArgumentError("Regular price cannot be zero.");
    }
    return ((this - regularPrice) / regularPrice) * 100;
  }

  /// Determines if the current price (this) is higher than the regular price.
  bool isPriceIncreased(num regularPrice) {
    return this > regularPrice;
  }

  /// Determines if the current price (this) is lower than the regular price.
  bool isPriceDecreased(num regularPrice) {
    return this < regularPrice;
  }

  /// Formats the integer with thousand separators.
  String get formatWithCommas {
    num? number = num.tryParse(this.replaceAll(',', ''));
    if (number == null) {
      throw const FormatException("Invalid number format");
    }
    return NumberFormat.decimalPattern().format(number);
  }

  /// Formats the integer as currency, optionally with a locale.
  String formatAsCurrency({String locale = 'en_US', String symbol = '\$'}) {
    final format = NumberFormat.currency(locale: locale, symbol: symbol);
    return format.format(this);
  }
}

extension DateExtension on DateTime {
  String getDay({
    ///EEEE
    String pattern = 'E',
  }) {
    return DateFormat(pattern).format(this);
  }

  DateTime? addMonths(String? number) {
    if (number == null) {
      return null; // Handle null input gracefully
    }

    int months = int.parse(number);

    // Calculate the new date by adding months
    int newYear = year + ((month + months - 1) ~/ 12);
    int newMonth = (month + months - 1) % 12 + 1;
    int day = this.day;

    // Adjust day for months with fewer days
    int lastDayOfNewMonth = DateTime(newYear, newMonth + 1, 0).day;
    if (day > lastDayOfNewMonth) {
      day = lastDayOfNewMonth;
    }

    return DateTime(
      newYear,
      newMonth,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  String format({String pattern = 'dd/MM/yyyy', String? locale}) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  List<int> yearsList([int end = 5, bool reversed = true]) {
    final currentYear = DateTime.now().year;
    return [
      for (int year = currentYear - end; year <= currentYear; year++) year,
    ].reversed.toList();
  }
}

extension TimeExtension on TimeOfDay {
  String formatt({String pattern = 'HH:mm'}) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, hour, minute);
    return DateFormat(pattern).format(dateTime);
  }
}

extension HexColor on String? {
  String get phone {
    if (this == null) return '';
    return this!
        .replaceAll(RegExp(r"^\+?(920|92)-?"), '')
        .replaceAll(RegExp(r"-"), '');
  }

  // Returns the phone number without the country code (+920, 920, or 92)
  String? get phoneWithoutCode {
    if (this == null) return null;
    return this!.replaceFirst(RegExp(r"^\+?(920|92)"), '');
  }

  // Returns the phone number with the country code (+92) if missing
  String? get phoneWithCode {
    if (this == null) return null;

    // If it already starts with +92 or 92 or the specific number pattern, return as is
    if (this!.startsWith('+92')) {
      return this;
    }

    if (this!.startsWith('92')) {
      return '+$this';
    }

    // If it starts with 3, prepend +92 (for numbers like 3xxxxxxx or 03xxxxxxx)
    if (this!.startsWith('3') || this!.startsWith('03')) {
      return '+92${this!.substring(this!.startsWith('03') ? 2 : 0)}';
    }

    // Otherwise, return the number prepended with +92
    return '+92${this!}';
  }

  String get capitalize {
    if (this != null) {
      if (this!.isEmpty) return this!;
      return this![0].toUpperCase() + this!.substring(1);
    }
    return "";
  }

  String get stripeAmount {
    final double parsedAmount = double.parse(this ?? "") * 100;
    return parsedAmount.round().toString();
  }

  num? get toNum {
    return num.tryParse("$this");
  }

  Color toColor() {
    if (this == null || this!.isEmpty) {
      return const Color(0x00000000);
    }

    String hex = this!.replaceAll('#', '');

    try {
      return Color(int.parse('0xFF$hex'));
    } catch (e) {
      return const Color(0x00000000);
    }
  }

  ImageProvider get provider {
    if (this != null && this!.isNotEmpty) {
      return this!.startsWith('http') ? NetworkImage(this!) : AssetImage(this!);
    } else {
      return AssetImage('assets/images/placeholder.jpg');
    }
  }

  String get symbol {
    // Safe non-null value
    if (this == null || num.tryParse(this!) == null) {
      return 'Invalid value';
    }

    // Safe non-null value
    final value = num.parse(this ?? '0');

    // Conversion logic
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M'; // Millions
    } else if (value >= 100000) {
      return '${(value / 100000).toStringAsFixed(1)}L'; // Lacs
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K'; // Thousands
    } else {
      return value.toString(); // Direct value for < 1000
    }
  }
}

extension Drawable on String {
  String get icon => "assets/icons/$this.svg";
  String get font => "assets/fonts/$this.ttf";
  String get image => "assets/images/$this.png";
  String get flag => "assets/flags/$this.svg";

  String get greeting {
    int hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning 🔥';
    } else if (hour < 17) {
      return 'Good Afternoon 🔥';
    } else if (hour < 20) {
      return 'Good Evening 🔥';
    } else {
      return 'Good Night 🔥';
    }
  }

  String get special {
    return replaceAllMapped(RegExp(r"\\([ntrbfvu'\'\\])"), (match) {
      switch (match[1]) {
        case 'n':
          return '\n'; // New line
        case 't':
          return '\t'; // Tab
        case 'r':
          return '\r'; // Carriage return
        case 'b':
          return '\b'; // Backspace
        case 'f':
          return '\f'; // Form feed
        case 'v':
          return '\v'; // Vertical tab
        case 'u':
          return '\\u'; // Unicode
        case '\\':
          return '\\'; // Backslash
        default:
          return match[0] ?? ''; // Fallback (if needed)
      }
    });
  }

  String get phone {
    return replaceAll(
      RegExp(r"^\+?(920|92)-?"),
      '',
    ).replaceAll(RegExp(r"-"), '');
  }

  /// hostname
  String get hostname {
    return replaceFirst('{{base}}', '');
  }

  String get filename {
    int lastIndex = lastIndexOf('/');
    if (lastIndex == -1) {
      return this;
    }
    return substring(lastIndex + 1);
  }

  /// hostname
  String get km {
    return "$this ${"km".tr}";
  }

  String get pkr => "${"pkr".tr} $this";

  String ext([String e = 'png']) {
    if (contains('.')) {
      List<String> splitName = split('.');
      if (splitName.last != e) {
        splitName[splitName.length - 1] = e;
      }
      return splitName.join('.');
    }
    return this;
  }

  DateTime? get toDateTime {
    if (isEmpty) {
      return DateTime.now();
    }
    return DateTime.tryParse(this);
  }

  String format([String pattern = 'dd/MM/yyyy']) {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat(pattern).format(dateTime);
  }

  num? get toNum {
    return num.tryParse(this);
  }

  String get symbol {
    // Safe non-null value
    final value = double.parse(this);

    // Conversion logic
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M'; // Millions
    } else if (value >= 100000) {
      return '${(value / 100000).toStringAsFixed(1)}L'; // Lacs
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K'; // Thousands
    } else {
      return value.toString(); // Direct value for < 1000
    }
  }
}
