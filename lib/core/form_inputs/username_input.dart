import 'package:formz/formz.dart';

import '/core/core.dart';

/// Eposta alanının doğrulama mantığını ve durumunu yönetir.
class UsernameInput extends FormzInput<String, InputError> {
  /// Formun başlangıç durumu için kullanılan kurucu.
  /// değeri boş bir string olarak başlatır
  const UsernameInput.pure() : super.pure('');

  /// Formun değişken durumu için kullanılan kurucu.
  /// değeri verilen bir string ile başlatır.
  const UsernameInput.dirty([super.value = '']) : super.dirty();

  /// Alanın geçerliliğini kontrol eder ve gerekli durumlarda hata döner
  @override
  InputError? validator(String value) {
    /// Değerin boş olup olmadığını kontrol eder.
    if (value.isEmpty) {
      return InputError.empty;
    }

    /// Değerin geçerli bir e-posta adresi olup olmadığını kontrol eder.
    if (!value.isValidEmail) {
      return InputError.invalid;
    }

    /// Değer geçerli ise null döner.
    return null;
  }
}
