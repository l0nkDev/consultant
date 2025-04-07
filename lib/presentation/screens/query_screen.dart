import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/query_provider.dart';
import '../widgets/organisms/query_section.dart';
import '../../core/constants/app_text_constants.dart';

class QueryScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  QueryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final queryProvider = Provider.of<QueryProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(AppText.queryScreenTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: QuerySection(
          controller: _controller,
          onSubmit: () {
            final query = _controller.text.trim();
            if (query.isNotEmpty) {
              queryProvider.sendQuery(query);
            }
          },
          response: queryProvider.response,
          error: queryProvider.errorMessage,
          isLoading: queryProvider.isLoading,
        ),
      ),
    );
  }
}
