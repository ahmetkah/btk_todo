import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  ///
  const AppTextButton({
    required this.onPressed,
    required this.primaryText,
    required this.actionText,
    super.key,
    this.primaryTextStyle,
    this.actionTextStyle,
  });

  ///
  final VoidCallback onPressed;
  final String primaryText;
  final String actionText;
  final TextStyle? primaryTextStyle;
  final TextStyle? actionTextStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      ///
      onPressed: onPressed,
      child: RichText(
        text: TextSpan(
          ///
          text: '$primaryText ',
          style: primaryTextStyle ??
              TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
          children: [
            TextSpan(
              text: actionText,
              style: actionTextStyle ??
                  TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
