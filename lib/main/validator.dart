class Validator {
  static String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 characters';
    else
      return null;
  }

  static String validateCity(String value) {
    if (value.length < 3)
      return 'City must be more than 2 characters';
    else
      return null;
  }
  static String adminValidate(String value) {
    if (value.length < 3)
      return 'Message should be more than 2 characters';
    else
      return null;
  }

  static String describeProblem(String value) {
    if (value.length < 3)
      return 'Description must be more than 2 characters';
    else
      return null;
  }

  static String postalCode(String value) {
    if (value.isEmpty) {
      return 'Please enter postalcode';
    }
    return null;
  }

  static String validateAddress(String value) {
    if (value.length < 3)
      return 'Address must be more than 2 characters';
    else
      return null;
  }

  static String validateFirstName(String value) {
    if (value.length < 3)
      return 'First Name must be more than 2 characters';
    else
      return null;
  }

  static String validateLastName(String value) {
    if (value.length < 1)
      return 'Last Name must be more than 1 character';
    else
      return null;
  }

  static String validateDependents(String value) {
    if (value.length < 1)
      return 'Number of Dependents must be minimum 1 character';
    else
      return null;
  }

  static String validPassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'Password must have 8 characters and a mix with uppercase, lowercase & special characters.';
      else
        return null;
    }
  }

  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value.trim()))
      return 'Enter valid Email';
    else
      return null;
  }

  // static String validateMobile(String value) {
  //   String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  //   RegExp regExp = new RegExp(pattern);
  //   if (value.length == 0) {
  //     return 'Please enter phone number';
  //   } else if (!regExp.hasMatch(value)) {
  //     return 'Please enter valid phone number';
  //   }
  //   return null;
  // }
  static String validateMobile(String value) {
    // Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digits';
    else
      return null;
  }

  static bool validateNumber(String text) {
    Pattern pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(text);
  }
}
