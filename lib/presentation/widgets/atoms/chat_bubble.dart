// lib/presentation/widgets/atoms/chat_bubble.dart
import 'package:consultant/domain/entities/document.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final bool isError; // Nuevo campo para distinguir errores
  final List<Document>? references;
  final VoidCallback? onViewReferences;

  const ChatBubble({
    super.key,
    required this.message,
    this.isUser = false,
    this.isError = false,
    this.references,
    this.onViewReferences,
  });

  @override
  Widget build(BuildContext context) {
    // Si es un error, usamos un color distinto, por ejemplo rojo pálido
    final bubbleColor =
        isError
            ? Colors.red[100]
            : (isUser ? Colors.blue[100] : Colors.grey[300]);
    final align = isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final textAlign = isUser ? TextAlign.right : TextAlign.left;

    return Column(
      crossAxisAlignment: align,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            message,
            textAlign: textAlign,
            style: TextStyle(
              fontSize: 16,
              color: isError ? Colors.red : Colors.black,
            ),
          ),
        ),
        if (!isUser &&
            references != null &&
            references!.isNotEmpty &&
            onViewReferences != null)
          TextButton(
            onPressed: onViewReferences,
            child: const Text("Ver Referencias"),
          ),
      ],
    );
  }
}
