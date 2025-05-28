import '/core/app_export.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove all non-digit characters
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Remove leading zero(s)
    digitsOnly = digitsOnly.replaceFirst(RegExp(r'^0+'), '');

    // Limit to 10 digits
    if (digitsOnly.length > 10) {
      digitsOnly = digitsOnly.substring(0, 10);
    }

    return TextEditingValue(
      text: digitsOnly,
      selection: TextSelection.collapsed(offset: digitsOnly.length),
    );
  }
}

class CardInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove any non-digit characters
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Insert spaces every 4 digits
    final formatted = digitsOnly.replaceAllMapped(
      RegExp(r'.{1,4}'),
      (match) => '${match.group(0)} ',
    );

    // Trim trailing space
    final trimmed = formatted.trim();

    // Set the new selection position
    final newSelectionIndex =
        newValue.selection.baseOffset + (trimmed.length - newValue.text.length);

    return TextEditingValue(
      text: trimmed,
      selection: TextSelection.collapsed(offset: newSelectionIndex),
    );
  }
}

class ExpiryMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;

    final int? value = int.tryParse(newValue.text);
    if (value == null || value < 1 || value > 12) {
      return oldValue;
    }
    return newValue;
  }
}

class ExpiryYearInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If the new value is empty, return it as is.
    if (newValue.text.isEmpty) return newValue;

    // Get the current year as a two-digit string
    final int currentYear = int.parse(DateFormat('yy').format(DateTime.now()));

    if (newValue.text.length < 2) return newValue;

    // Try parsing the new input to an integer.
    final int? value = int.tryParse(newValue.text);

    // If parsing fails, return the old value.
    if (value == null) {
      return oldValue;
    }

    // Ensure the value is between 0 and 99 for a valid year format (e.g., 23 for 2023).

    if (value < currentYear) {
      return oldValue;
    }

    // Return the new value if it's valid.
    return newValue;
  }
}
