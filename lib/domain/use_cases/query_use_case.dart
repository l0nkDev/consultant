import '../../data/repositories/query_repository.dart';

class QueryUseCase {
  final QueryRepository repository;

  QueryUseCase({required this.repository});

  Future<String> execute(String query) async {
    return await repository.fetchAnswer(query);
  }
}
