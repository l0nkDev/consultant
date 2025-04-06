import 'package:flutter/material.dart';
import '../molecules/query_input.dart';
import '../molecules/query_result_display.dart';
import '../../../core/constants/app_text_constants.dart';

class QuerySection extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;
  final String answer;
  final String error;
  final bool isLoading;

  const QuerySection({
    super.key,
    required this.controller,
    required this.onSubmit,
    required this.answer,
    required this.error,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QueryInput(controller: controller, onSubmit: onSubmit),
        const SizedBox(height: 16),
        isLoading
            ? Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 8),
                Text(AppText.loadingMessage),
              ],
            )
            : QueryResultDisplay(answer: answer, error: error),
      ],
    );
  }
}
