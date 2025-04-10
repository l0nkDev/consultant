// lib/presentation/widgets/organisms/input_area.dart
import 'package:flutter/material.dart';
import '../../widgets/atoms/custom_text_field.dart';
import '../../widgets/atoms/custom_button.dart';
import '../../../core/constants/app_text_constants.dart';

class InputArea extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;
  final VoidCallback ttsStart;

  const InputArea({
    super.key,
    required this.controller,
    required this.onSubmit,
    required this.ttsStart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: controller,
              label: AppText.queryFieldLabel,
            ),
          ),
          const SizedBox(width: 8),
          CustomButton(onPressed: onSubmit, text: AppText.sendButtonText_slim),
          const SizedBox(width: 8),
          CustomButton(onPressed: ttsStart, text: AppText.startTtsButton_slim),
        ],
      ),
    );
  }
}
