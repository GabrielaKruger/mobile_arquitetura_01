import 'package:http/http.dart' as http;
import 'dart:convert';
import '../errors/failure.dart';

class HttpClient {
  Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Failure("Erro na requisição: ${response.statusCode}");
    }
  }
}