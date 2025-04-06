import 'dart:convert';
import 'package:http/http.dart' as http;

class QueryApiClient {
  // La URL del servidor se puede definir en core/config.dart
  final String baseUrl;

  QueryApiClient({required this.baseUrl});

  Future<String> postQuery(String query) async {
    final url = Uri.parse('$baseUrl/ask');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'query': query}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Asume que la respuesta es un String o extrae según la estructura.
      return data['answer'] is String
          ? data['answer']
          : data['answer']['text'] ?? '';
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
