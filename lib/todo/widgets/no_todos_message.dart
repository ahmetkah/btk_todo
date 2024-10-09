import 'package:flutter/material.dart';

import '/core/core.dart';

class NoTodosMessage extends StatelessWidget {
  const NoTodosMessage({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    return Center(
      ///
      child: Text(
        context.translate.noTodosMessage,
      ),
    );
  }
}
