class Mask {
  /// Applies a mask to the input string using the provided regex and mask pattern.
  ///
  /// - [input]: The input string to be masked.
  /// - [regex]: A map of regex patterns for masking (e.g., {"#": RegExp(r'[0-9]')}).
  /// - [mask]: The mask pattern (e.g., "(###) ###-####").
  ///
  /// Returns the masked string.
  static String maskWith({
    required String input,
    required Map<String, RegExp> regex,
    required String mask,
  }) {
    final maskChars = regex.keys.toList();
    final maskedText = StringBuffer();
    int inputIndex = 0;

    for (int i = 0; i < mask.length; i++) {
      final maskChar = mask[i];
      if (maskChars.contains(maskChar)) {
        if (inputIndex < input.length) {
          final inputChar = input[inputIndex];
          if (regex[maskChar]?.hasMatch(inputChar) ?? false) {
            maskedText.write(inputChar);
            inputIndex++;
          } else {
            // If the input character doesn't match the regex, skip it
            continue;
          }
        } else {
          // If there are no more input characters, stop
          break;
        }
      } else {
        // If it's not a mask character, add it to the result
        maskedText.write(maskChar);
      }
    }

    return maskedText.toString();
  }

  /// Removes the mask from a masked string.
  ///
  /// - [maskedInput]: The masked input string (e.g., "(123) 456-7890").
  /// - [regex]: A map of regex patterns used for masking (e.g., {"#": RegExp(r'[0-9]')}).
  /// - [mask]: The mask pattern (e.g., "(###) ###-####").
  ///
  /// Returns the unmasked string.
  static String maskRemove({
    required String maskedInput,
    required Map<String, RegExp> regex,
    required String mask,
  }) {
    final maskChars = regex.keys.toList();
    final unmaskedText = StringBuffer();
    int maskIndex = 0;

    for (int i = 0; i < maskedInput.length; i++) {
      if (maskIndex >= mask.length) break;

      final maskChar = mask[maskIndex];
      if (maskChars.contains(maskChar)) {
        final inputChar = maskedInput[i];
        if (regex[maskChar]?.hasMatch(inputChar) ?? false) {
          unmaskedText.write(inputChar);
        }
        maskIndex++;
      } else {
        // If it's not a mask character, skip it in the input
        if (maskedInput[i] == maskChar) {
          maskIndex++;
        }
      }
    }

    return unmaskedText.toString();
  }
}
