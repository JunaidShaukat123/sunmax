class Functions {
  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  static String formattedText(String? input) {
    // Check for null or invalid input
    if (input == null || double.tryParse(input) == null) {
      return 'Invalid value';
    }

    // Safe non-null value
    final value = double.parse(input);

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

  static String phoneWithOutCode(String? input) {
    if (input == null) return 'Invalid value';

    return input
        .replaceAll(RegExp(r"^\+?(920|92)-?"), '')
        .replaceAll(RegExp(r"-"), '');
  }

  /// if phone start with +92,92,+920,920,0 then replace it with ''
  /// output: 318-1524864
  static String phoneWithMask(String? input,
      {String? prefix, String placeholder = ''}) {
    if (input == null) {
      return placeholder;
    } else {
      input = input.replaceAll(RegExp(r'\D'), '');

      // Remove any of the prefixes: +92, 92, +920, 920, 0
      if (input.startsWith('+92')) {
        input = input.substring(3); // Remove +92
      } else if (input.startsWith('92')) {
        input = input.substring(2); // Remove 92
      } else if (input.startsWith('+920')) {
        input = input.substring(4); // Remove +920
      } else if (input.startsWith('920')) {
        input = input.substring(3); // Remove 920
      } else if (input.startsWith('0')) {
        input = input.substring(1); // Remove 0
      }

      if (prefix != null) {
        return '$prefix${input.substring(0, 3)}-${input.substring(3)}';
      }
      return '${input.substring(0, 3)}-${input.substring(3)}';
    }
  }
}
