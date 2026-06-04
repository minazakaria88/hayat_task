class AppRegex {
  static bool isEmailValid(final String email) {
    return RegExp(
      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
    ).hasMatch(email);
  }

  static bool isPasswordValid(final String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$',
    ).hasMatch(password);
  }

  static bool isPhoneNumberValid(final String phoneNumber) {
    if (phoneNumber.length == 11 && phoneNumber.startsWith('0')) {
      return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber);
    } else {
      return RegExp(r'^(10|11|12|15)[0-9]{8}$').hasMatch(phoneNumber);
    }
  }

  static bool hasLowerCase(final String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(final String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(final String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(final String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(final String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  static bool isArabicLetter(final String char) {
    // Comprehensive Arabic Unicode range including all Arabic letters
    return RegExp(r'^[\u0600-\u06FF]$').hasMatch(char);
  }

  static bool containsEmoji(final String text) {
    return RegExp(
      r'[\u{1F600}-\u{1F64F}]|'  // Emoticons
      r'[\u{1F300}-\u{1F5FF}]|'  // Misc Symbols and Pictographs
      r'[\u{1F680}-\u{1F6FF}]|'  // Transport and Map
      r'[\u{1F700}-\u{1F77F}]|'  // Alchemical Symbols
      r'[\u{1F780}-\u{1F7FF}]|'  // Geometric Shapes Extended
      r'[\u{1F800}-\u{1F8FF}]|'  // Supplemental Arrows-C
      r'[\u{1F900}-\u{1F9FF}]|'  // Supplemental Symbols and Pictographs
      r'[\u{1FA00}-\u{1FA6F}]|'  // Chess Symbols
      r'[\u{1FA70}-\u{1FAFF}]|'  // Symbols and Pictographs Extended-A
      r'[\u{2600}-\u{26FF}]|'    // Misc symbols
      r'[\u{2700}-\u{27BF}]',    // Dingbats
      unicode: true,
    ).hasMatch(text);
  }

  static String convertArabicToEnglishNumbers(final String value) {
    return value
        .replaceAll('٠', '0')
        .replaceAll('١', '1')
        .replaceAll('٢', '2')
        .replaceAll('٣', '3')
        .replaceAll('٤', '4')
        .replaceAll('٥', '5')
        .replaceAll('٦', '6')
        .replaceAll('٧', '7')
        .replaceAll('٨', '8')
        .replaceAll('٩', '9');
  }
}
