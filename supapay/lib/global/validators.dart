extension PhoneNumberValidation on String {
  bool isMobileNumberValid() {
    String regexPattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    var regExp = RegExp(regexPattern);

    if (isEmpty) {
      return false;
    } else if (regExp.hasMatch(this)) {
      return true;
    }
    return false;
  }
}

