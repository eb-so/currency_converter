class FormValidators {
  static String? validateUnsignInteger(String? value) {
    if (value == null) return 'value cannot be null';

    final toInt = int.tryParse(value);
    if (toInt == null) return "Value isn't integer";

    if (toInt < 1) {
      return 'Value should be greater than 0';
    }

    return null;
  }
}
