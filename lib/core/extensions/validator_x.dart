extension ValidatorX on String {
  ///
  bool get isValidEmail =>
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(this);

  ///
  bool get isValidNameOrSurname =>
      RegExp(r'^[a-zA-ZçÇğĞıİöÖşŞüÜ\s.]+$').hasMatch(this);

  ///
  bool get isValidPassword =>
      RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>]).*$').hasMatch(this);
}
