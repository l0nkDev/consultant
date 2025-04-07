import 'package:consultant/core/constants/app_text_constants.dart';
import 'package:flutter/material.dart';
import '../molecules/query_input.dart';
import '../molecules/query_result_display.dart';

class QuerySection extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;
  final bool isLoading;
  final String error;
  final dynamic
  response; // Puedes cambiar dynamic por QueryResponse? si importas la entidad.

  const QuerySection({
    super.key,
    required this.controller,
    required this.onSubmit,
    required this.isLoading,
    required this.error,
    required this.response,
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
            : QueryResultDisplay(response: response, error: error),
      ],
    );
  }
}
