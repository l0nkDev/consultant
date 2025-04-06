import 'package:flutter/material.dart';
import '../../domain/use_cases/query_use_case.dart';

class QueryProvider extends ChangeNotifier {
  final QueryUseCase queryUseCase;

  bool isLoading = false;
  String answer = '';
  String errorMessage = '';

  QueryProvider({required this.queryUseCase});

  Future<void> sendQuery(String query) async {
    isLoading = true;
    answer = '';
    errorMessage = '';
    notifyListeners();

    try {
      answer = await queryUseCase.execute(query);
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
