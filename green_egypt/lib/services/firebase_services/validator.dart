class Validator {
  /**
   * Validator class is custom class used to validate email and password 
   */
  static String? validateEmail({required String email}) {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email.isEmpty) {
      return 'Name can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'enter correct email';
    }
    return null;
  }

  static String validatePassword({required String password}) {
    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 8) {
      return 'enter a password with lenght at least 8';
    } else {
      return "";
    }
  }
}
