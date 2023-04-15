import 'package:http/http.dart' as http;
import 'dart:convert';


class DogApi {
  static const _baseUrl = 'https://dog.ceo/api/breeds/image/random';
  
  static Future<String> getRandomDogImageUrl() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['message'] as String;
    } else {
      throw Exception('Error getting dog image');
    }
  }
}