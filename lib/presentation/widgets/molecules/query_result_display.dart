import 'package:flutter/material.dart';
import '../../../core/constants/app_text_constants.dart';

class QueryResultDisplay extends StatelessWidget {
  final String answer;
  final String error;

  const QueryResultDisplay({
    super.key,
    required this.answer,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    if (error.isNotEmpty) {
      return Text(
        '${AppText.errorPrefix}$error',
        style: const TextStyle(color: Colors.red),
      );
    }
    return Text(answer);
  }
}
