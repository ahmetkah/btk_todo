import 'package:formz/formz.dart';

import '/core/core.dart';

/// Parola alanının doğrulama mantığını ve durumunu yönetir.
class PasswordInput extends FormzInput<String, InputError> {
  /// Formun başlangıç durumu için kullanılan kurucu.
  /// değeri boş bir string olarak başlatır
  const PasswordInput.pure() : super.pure('');

  /// Formun değişken durumu için kullanılan kurucu.
  /// değeri verilen bir string ile başlatır.
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  /// Alanın geçerliliğini kontrol eder ve gerekli durumlarda hata döner
  @override
  InputError? validator(String value) {
    /// Değerin boş olup olmadığını kontrol eder.
    if (value.isEmpty) {
      return InputError.empty;
    }

    /// Değerin geçerli bir parola olup olmadığını kontrol eder.
    if (!value.isValidPassword) {
      return InputError.invalid;
    }

    /// Değer geçerli ise null döner.
    return null;
  }
}
