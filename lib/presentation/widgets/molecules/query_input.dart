import 'package:flutter/material.dart';
import '../../widgets/atoms/custom_text_field.dart';
import '../../widgets/atoms/custom_button.dart';
import '../../../core/constants/app_text_constants.dart';

class QueryInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;

  const QueryInput({
    super.key,
    required this.controller,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(controller: controller, label: AppText.queryFieldLabel),
        const SizedBox(height: 8),
        CustomButton(onPressed: onSubmit, text: AppText.sendButtonText),
      ],
    );
  }
}
