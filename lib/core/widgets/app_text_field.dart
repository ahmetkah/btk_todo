import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
class AppTextField extends StatelessWidget {
  ///
  const AppTextField({
    super.key,
    this.initialValue,
    this.autoFillHints,
    this.controller,
    this.inputFormatters,
    this.autocorrect = true,
    this.readOnly = false,
    this.hintText,
    this.errorText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.onTap,
    this.fillColorWhiteEnabled = false,
    this.minLines,
    this.maxLines,
  });

  /// A value to initialize the field to.
  final String? initialValue;

  /// List of auto fill hints.
  final Iterable<String>? autoFillHints;

  ///
  final TextEditingController? controller;

  /// Optional input validation and formatting overrides.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether to enable autocorrect.
  final bool autocorrect;

  /// Whether the text field should be read-only.
  final bool readOnly;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Text that appears below the field.
  final String? errorText;

  /// A widget that appears before the editable part of the text field.
  final Widget? prefix;

  /// A widget that appears after the editable part of the text field.
  final Widget? suffix;

  ///
  final TextInputType? keyboardType;

  ///
  final TextInputAction? textInputAction;

  /// Called when the user inserts or deletes texts in the text field.
  final ValueChanged<String>? onChanged;

  ///
  final ValueChanged<String>? onSubmitted;

  ///
  final String? Function(String?)? validator;

  /// Called when the text field has been tapped.
  final VoidCallback? onTap;

  /// Obscure text when type a password.
  final bool obscureText;

  ///
  final bool fillColorWhiteEnabled;

  ///
  final int? minLines;

  ///
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 80),
          child: TextFormField(
            key: key,
            initialValue: initialValue,
            controller: controller,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            obscureText: obscureText,
            autocorrect: autocorrect,
            readOnly: readOnly,
            minLines: minLines,
            maxLines: maxLines,
            autofillHints: autoFillHints,

            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
            onFieldSubmitted: onSubmitted,
            decoration: InputDecoration(
              filled: fillColorWhiteEnabled ? true : null,
              fillColor: fillColorWhiteEnabled ? Colors.white : null,
              contentPadding: const EdgeInsets.all(16),
              hintText: hintText,
              errorText: errorText,
              prefixIcon: prefix,
              suffixIcon: suffix,
              suffixIconConstraints: const BoxConstraints.tightFor(
                width: 32,
                height: 32,
              ),
              prefixIconConstraints: const BoxConstraints.tightFor(
                width: 48,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            ///  Değer değiştiğinde bu değişikliğe yanıt ver
            onChanged: onChanged,
            onTap: onTap,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
