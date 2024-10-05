import 'package:formz/formz.dart';
import '/core/core.dart';

/// İsim ve soyisim alanlarının doğrulama mantığını ve durumunu yönetir.
class NameInput extends FormzInput<String, InputError> {
  /// Formun başlangıç durumu için kullanılan kurucu.
  /// değeri boş bir string olarak başlatır.
  const NameInput.pure() : super.pure('');

  /// Formun değişken durumu için kullanılan kurucu.
  /// değeri verilen bir string ile başlatır.
  const NameInput.dirty([super.value = '']) : super.dirty();

  /// Alanın geçerliliğini kontrol eder ve gerekli durumlarda hata döner.
  @override
  InputError? validator(String value) {
    /// Değerin boş olup olmadığını kontrol eder.
    if (value.isEmpty) {
      return InputError.empty;
    }

    /// Değerin geçerli bir isim veya soyisim olup olmadığını kontrol eder.
    if (!value.isValidNameOrSurname) {
      return InputError.invalid;
    }

    /// Değer geçerli ise null döner.
    return null;
  }
}
