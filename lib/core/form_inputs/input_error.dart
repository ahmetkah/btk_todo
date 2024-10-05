import 'package:flutter/material.dart';

import '/core/core.dart';

enum InputError {
  /// Form alanının boş bırakılması
  /// hata durumunu belirtir.
  empty,

  /// Geçersiz Form formatının
  /// hata durumunu belirtir.
  invalid;

  /// Bu metot, enum değerine göre uygun
  /// hata mesajını döndürür.
  String errorText(BuildContext context, String fieldname) {
    /// enum değerine göre kontrol yapar ve
    /// ilgili hata mesajını döner
    switch (this) {
      /// empty durumu için hata mesajı
      case InputError.empty:
        return context.translate.authFormErrorsFill(fieldname);

      /// invalid durumu için hata mesajı
      case InputError.invalid:
        return context.translate.authFormErrorsInvalid(fieldname);
    }
  }
}
