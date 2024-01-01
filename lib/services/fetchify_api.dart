import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchifyService {
  final String accessToken;

  FetchifyService(this.accessToken);

  Future<Map<String, dynamic>> fetchData(String address) async {
    final url =
        'https://api.craftyclicks.co.uk/address/1.1/find?'; // Adjust the endpoint
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'key': accessToken, 'query': address, 'country': 'GBR'}),
      );

      if (response.statusCode == 200) {
        print('response with 200 ${response.body}');
        return jsonDecode(response.body);
        //print(object)
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data. Error: $e');
    }
  }
}
