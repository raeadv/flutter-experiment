import 'package:http/http.dart' as http;

class Authenticator {
  final String baseUrl = 'https://dummyapi.io/data/api';

  Future<String> authenticate(String username, String password) async {
    var response = await _sendAuthenticationRequest(username, password);

    if (response.statusCode == 200) {
      return _parseAccessToken(response.body);
    } else {
      throw Exception('Failed to authenticate');
    }
  }

  Future<http.Response> _sendAuthenticationRequest(
      String username, String password) async {
    var response = await http.post(
      Uri.parse('$baseUrl/user/login'),
      headers: {
        'app-id': 'YOUR_APP_ID_HERE',
        'Content-Type': 'application/json',
      },
      body: {
        'username': username,
        'password': password,
      },
    );

    return response;
  }

  String _parseAccessToken(String responseBody) {
    return responseBody['accessToken'];
  }
}
