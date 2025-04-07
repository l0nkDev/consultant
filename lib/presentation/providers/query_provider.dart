import 'package:flutter/material.dart';
import '../../domain/use_cases/query_use_case.dart';
import '../../domain/entities/query_response.dart';

class QueryProvider extends ChangeNotifier {
  final QueryUseCase queryUseCase;

  bool isLoading = false;
  QueryResponse? response;
  String errorMessage = '';

  QueryProvider({required this.queryUseCase});

  Future<void> sendQuery(String query) async {
    isLoading = true;
    response = null;
    errorMessage = '';
    notifyListeners();

    try {
      response = await queryUseCase.execute(query);
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
