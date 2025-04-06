import '../datasources/query_api_client.dart';

class QueryRepository {
  final QueryApiClient apiClient;

  QueryRepository({required this.apiClient});

  Future<String> fetchAnswer(String query) async {
    return await apiClient.postQuery(query);
  }
}
