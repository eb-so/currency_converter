class FormValidators {
  static String? validateUnsignInteger(String? value) {
    if (value is! int) {
      return "Value isn't integer";
    }

    if (value as int < 1) {
      return 'Value should be greater than 0';
    }

    return null;
  }
}
