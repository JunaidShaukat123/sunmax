import '/core/app_export.dart';

/// Checks if string is email.
class Validator {
  static String? card(String? input) {
    const pattern = r'^(\d{4}\s?){3}\d{4}$';
    if (input == null || input.isEmpty) {
      return "please_enter_card_number".tr;
    }

    // Remove spaces and validate length
    final sanitizedInput = input.replaceAll(' ', '');
    if (sanitizedInput.length != 16) {
      return "invalid_card_number".tr;
    }

    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(input)) {
      return "invalid_card_number".tr;
    }

    return null;
  }

  static String? cvv(String? value) {
    if (value == null || value.isEmpty) {
      return "please_enter_cvv".tr;
    } else if (value.length < 3 || value.length > 4) {
      return "invalid_cvv".tr;
    }

    return null;
  }

  static String? expiryMonth(String? value) {
    if (value == null || value.isEmpty) {
      return "please_enter_expiry_month".tr;
    }

    final month = int.tryParse(value);
    if (month == null || month < 1 || month > 12) {
      return "invalid_expiry_month".tr;
    }

    return null;
  }

  static String? expiryYear(String? value) {
    if (value == null || value.isEmpty) {
      return "please_enter_expiry_year".tr;
    }

    final year = int.tryParse(value);
    final currentYear =
        DateTime.now().year % 100; // Get last two digits of the current year.
    if (year == null || year < currentYear || year > currentYear + 20) {
      return "invalid_expiry_year".tr;
    }

    return null;
  }

  static String? phone(String? input, {bool isRequired = true}) {
    // xxx xxxx xxx
    const pattern = r'^3\d{2}-\d{7}$';
    RegExp regExp = RegExp(pattern, caseSensitive: false);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_your_phone".tr;
      } else if (input.isEmpty) {
        return "please_enter_your_phone".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_your_phone".tr;
      } else {
        return null;
      }
    }
  }

  static String? email(String? input, {bool isRequired = true}) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern, caseSensitive: false);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_your_email".tr;
      } else if (input.isEmpty) {
        return "please_enter_your_email".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_a_valid_email".tr;
      } else {
        return null;
      }
    }
  }

  static String? password(String? input, {bool isRequired = true}) {
    String lengthPattern = r'^.{8,}$';
    String alphaPattern = r'^(?=.*[a-zA-Z])';
    String digitPattern = r'^(?=.*\d)';
    String specialCharPattern = r'^(?=.*[@$!%*?&])';

    // Check if password is required and non-empty
    if (!isRequired && (input == null || input.isEmpty)) {
      return null;
    }

    // Check if password is empty
    if (input == null || input.isEmpty) {
      return "please_enter_your_password".tr;
    }

    // Length validation
    if (!RegExp(lengthPattern).hasMatch(input)) {
      return "password_must_be_at_least_8_characters".tr;
    }

    // Alphabet check (should contain at least one letter)
    if (!RegExp(alphaPattern).hasMatch(input)) {
      return "password_must_contain_at_least_one_letter".tr;
    }

    // Digit check (should contain at least one digit)
    if (!RegExp(digitPattern).hasMatch(input)) {
      return "password_must_contain_at_least_one_digit".tr;
    }

    // Special character check (should contain at least one special character)
    if (!RegExp(specialCharPattern).hasMatch(input)) {
      return "password_must_contain_at_least_one_special_character".tr;
    }

    return null;
  }

  static String? password2(String? input, {bool isRequired = true}) {
    String lengthPattern = r'^.{8,}$';
    String alphaPattern = r'^(?=.*[a-zA-Z])';
    String digitPattern = r'^(?=.*\d)';
    String specialCharPattern = r'^(?=.*[@$!%*?&])';

    // Check if password is required and non-empty
    if (!isRequired && (input == null || input.isEmpty)) {
      return null;
    }

    // Check if password is empty
    if (input == null || input.isEmpty) {
      return "please_enter_your_password".tr;
    }

    // Length validation
    if (!RegExp(lengthPattern).hasMatch(input)) {
      return "please_enter_your_password".tr;
    }

    // Alphabet check (should contain at least one letter)
    if (!RegExp(alphaPattern).hasMatch(input)) {
      return "please_enter_your_password".tr;
    }

    // Digit check (should contain at least one digit)
    if (!RegExp(digitPattern).hasMatch(input)) {
      return "please_enter_your_password".tr;
    }

    // Special character check (should contain at least one special character)
    if (!RegExp(specialCharPattern).hasMatch(input)) {
      return "please_enter_your_password".tr;
    }

    return null;
  }

  static String? confirmPassword(
    String? input,
    String text, {
    bool isRequired = true,
  }) {
    String pattern = r'^.{6,100}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_re_enter_your_password_for_confirmation".tr;
      } else if (input.isEmpty) {
        return "please_re_enter_your_password_for_confirmation".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_re_enter_your_password_for_confirmation".tr;
      } else if (input != text) {
        return "please_re_enter_your_password_for_confirmation".tr;
      } else {
        return null;
      }
    }
  }

  static String? otp(String? input, {bool isRequired = true}) {
    String pattern = r'^.{6}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"please_enter_the_otp_code".tr}.";
      } else if (input.isEmpty) {
        return "${"please_enter_the_otp_code".tr}.";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_the_otp_code".tr}.";
      } else {
        return null;
      }
    }
  }

  static String? text(String? input, {bool isRequired = true}) {
    const pattern = r'^[A-Z][a-z]$';
    RegExp regExp = RegExp(pattern, caseSensitive: false);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_a_value".tr;
      } else if (input.isEmpty) {
        return "please_enter_a_value".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_a_valid_value".tr;
      } else {
        return null;
      }
    }
  }

  static String? name(String? input, {bool isRequired = true}) {
    const pattern = r'^[a-zA-Z]+(?:\s[a-zA-Z]+)*$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_the_valid_name".tr;
      } else if (input.isEmpty) {
        return "please_enter_the_valid_name".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_the_valid_name".tr;
      } else {
        return null;
      }
    }
  }

  static String? time(String? input, {bool isRequired = true}) {
    // Define a pattern for time in 'HH:mm' format
    String pattern = r'^(?:[01]\d|2[0-3]):[0-5]\d$';
    RegExp regExp = RegExp(pattern);

    // If input is not required and is empty or null, validation passes
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_a_valid_time".tr;
      } else if (input.isEmpty) {
        return "please_enter_a_valid_time".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_a_time_in_hh_mm_format".tr;
      } else {
        return null;
      }
    }
  }

  static String? dateOfBirth(String? input, {bool isRequired = true}) {
    // Define a pattern for date in 'dd/MM/yyyy' format
    String pattern = r'^\d{2}/\d{2}/\d{4}$';
    RegExp regExp = RegExp(pattern);

    // If input is not required and is empty or null, validation passes
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_your_date_of_birth".tr;
      } else if (input.isEmpty) {
        return "please_enter_your_date_of_birth".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_a_valid_date_in_dd_mm_yyyy_format".tr;
      } else {
        // Further validation: Parse the date from the input string 'dd/MM/yyyy'
        DateTime? date;
        try {
          List<String> dateParts = input.split('/');
          if (dateParts.length == 3) {
            // Convert 'dd/MM/yyyy' to 'yyyy-MM-dd' for DateTime parsing
            date = DateTime.parse(
              '${dateParts[2]}-${dateParts[1]}-${dateParts[0]}',
            );
          } else {
            return "please_enter_a_valid_date_in_dd_mm_yyyy_format".tr;
          }
        } catch (e) {
          return "please_enter_a_valid_date_in_dd_mm_yyyy_format".tr;
        }

        // Check if the date is in the future
        if (date.isAfter(DateTime.now())) {
          return "date_of_birth_cannot_be_in_the_future".tr;
        }

        // Age validation: Check if the person is at least 18 years old
        Duration age = DateTime.now().difference(date);
        if (age.inDays / 365 < 18) {
          return "you_must_be_at_least_18_years_old".tr;
        }

        return null;
      }
    }
  }

  static String? year(String? input, {bool isRequired = false}) {
    const pattern = r'^\d{4}$';
    RegExp regExp = RegExp(pattern, caseSensitive: false);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_a_value".tr;
      } else if (input.isEmpty) {
        return "please_enter_a_value".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_a_valid_value".tr;
      } else {
        return null;
      }
    }
  }

  static String? number(String? input, {bool isRequired = false}) {
    const pattern = r'^-?\d+(\.\d+)?$';
    RegExp regExp = RegExp(pattern, caseSensitive: false);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_select_a_option".tr;
      } else if (input.isEmpty) {
        return "please_select_a_option".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_select_a_option".tr;
      } else {
        return null;
      }
    }
  }

  static String? price(String? input, {bool isRequired = false}) {
    const pattern = r'^\d{4}$';
    RegExp regExp = RegExp(pattern, caseSensitive: false);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_a_value".tr;
      } else if (input.isEmpty) {
        return "please_enter_a_value".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_a_valid_value".tr;
      } else {
        return null;
      }
    }
  }

  static String? engineCapacity(String? input, {bool isRequired = false}) {
    const pattern = r'^.+$';
    RegExp regExp = RegExp(pattern, caseSensitive: false);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_engine_capacity".tr;
      } else if (input.isEmpty) {
        return "please_enter_engine_capacity".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_engine_capacity".tr;
      } else {
        return null;
      }
    }
  }

  static String? mileage(String? input, {bool isRequired = false}) {
    const pattern = r'^.+$';
    RegExp regExp = RegExp(pattern, caseSensitive: false);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_your_mileage".tr;
      } else if (input.isEmpty) {
        return "please_enter_your_mileage".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_your_mileage".tr;
      } else {
        return null;
      }
    }
  }

  static String? area(String? input, {bool isRequired = true}) {
    const pattern = r'^[a-zA-Z0-9\s,.-]+$';

    RegExp regExp = RegExp(pattern, caseSensitive: false);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_your_address".tr;
      } else if (input.isEmpty) {
        return "please_enter_your_address".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_a_valid_address".tr;
      } else {
        return null;
      }
    }
  }

  static String? website(String? input, {bool isRequired = true}) {
    final urlPattern = r'^(https?:\/\/)?([\w\-]+\.)+[\w]{2,}(\/\S*)?$';
    final regex = RegExp(urlPattern);

    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (!regex.hasMatch(input!)) {
        return "Invalid website".tr;
      }
    }

    return null;
  }

  static String? address(String? input, {bool isRequired = true}) {
    const pattern = r'^[a-zA-Z0-9\s,.-]+$';

    RegExp regExp = RegExp(pattern, caseSensitive: false);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_your_address".tr;
      } else if (input.isEmpty) {
        return "please_enter_your_address".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_a_valid_address".tr;
      } else {
        return null;
      }
    }
  }

  static String? message(
    String? input, {
    bool isRequired = true,
    int minLength = 5,
  }) {
    // If input is null or empty and the field is required
    if (isRequired && (input == null || input.isEmpty)) {
      return "please_enter_your_message".tr;
    }

    // If input is optional and empty, no validation required
    if (!isRequired && (input == null || input.isEmpty)) {
      return null;
    }

    // Check if the input length meets the minimum requirement
    if (input!.length < minLength) {
      return "message_too_short".tr;
    }

    return null; // Validation passed
  }

  static String? yesOrNo(String? input, {bool isRequired = true}) {
    const pattern = r'^(YES|NO)$';

    RegExp regExp = RegExp(pattern, caseSensitive: false);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_select_a_value".tr;
      } else if (input.isEmpty) {
        return "please_select_a_value".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_select_a_value".tr;
      } else {
        return null;
      }
    }
  }
}
