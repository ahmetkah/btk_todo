import 'package:flutter/material.dart';

///
/// Birincil ve ikincil stilleri destekleyen özel bir ElevatedButton.
class AppElevatedButton extends StatelessWidget {
  /// {
  const AppElevatedButton({
    required this.child,
    super.key,
    this.onPressed,
    this.isSecondary = false,
    BorderSide? borderSide,
    Size? maximumSize,
    Size? minimumSize,
    EdgeInsets? padding,
  })  : _borderSide = borderSide,
        _maximumSize = maximumSize ?? _defaultMaximumSize,
        _minimumSize = minimumSize ?? _defaultMinimumSize,
        _padding = padding ?? _defaultPadding;

  /// Butonun alabileceği maksimum boyut
  static const _defaultMaximumSize = Size(double.infinity, 56);

  /// Butonun alabileceği minimum boyut
  static const _defaultMinimumSize = Size(double.infinity, 56);

  /// Butonun iç boşlukları
  static const _defaultPadding = EdgeInsets.fromLTRB(
    24,
    9,
    24,
    12,
  );

  /// Butona basıldığında çağrılan [VoidCallback].
  /// Null olduğunda buton devre dışı kalır.
  final VoidCallback? onPressed;

  /// Butonun ikincil stil kullanıp kullanmayacağını belirler.
  final bool isSecondary;

  /// Butonun kenarlığı
  final BorderSide? _borderSide;

  /// Butonun maksimum boyutu.
  ///
  /// Varsayılan değer [_defaultMaximumSize].
  final Size _maximumSize;

  /// Butonun minimum boyutu.
  ///
  /// Varsayılan değer [_defaultMinimumSize].
  final Size _minimumSize;

  /// Butonun iç boşlukları.
  ///
  /// Varsayılan değer [_defaultPadding].
  final EdgeInsets _padding;

  /// Butonda görüntülenen [Widget].
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        /// Butonun alabileceği maksimum boyut
        maximumSize: WidgetStateProperty.all(_maximumSize),

        /// Buton içeriği etrafındaki iç boşluk
        padding: WidgetStateProperty.all(_padding),

        /// Butonun alabileceği minimum boyut
        minimumSize: WidgetStateProperty.all(_minimumSize),

        /// Buton içindeki metnin stili (yazı tipi büyüklüğü vb.)
        textStyle: onPressed == null
            ? WidgetStateProperty.all(
                TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              )
            : WidgetStateProperty.all(
                const TextStyle(color: Colors.white),
              ),

        /// Metnin rengi
        foregroundColor: onPressed == null
            ? WidgetStateProperty.all(
                Theme.of(context).colorScheme.primary,
              )
            : WidgetStateProperty.all(
                isSecondary
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onPrimary,
              ),

        /// Butonun arka plan rengi
        backgroundColor: onPressed == null
            ? WidgetStateProperty.all(
                Theme.of(context).colorScheme.secondaryContainer,
              )
            : WidgetStateProperty.all(
                isSecondary
                    ? Theme.of(context).colorScheme.secondaryContainer
                    : Theme.of(context).colorScheme.primary,
              ),

        /// Buton kenar çizgisinin stili (kalınlık, renk)
        side: WidgetStateProperty.all(_borderSide),

        /// Butonun köşe yuvarlaklıklarını belirler
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: child,
    );
  }
}
