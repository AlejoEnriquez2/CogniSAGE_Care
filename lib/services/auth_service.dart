import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String _baseUrl = 'http://192.168.0.38:3000';

  Future<String?> login(String email, String password) async {
    try {
      var url = Uri.parse('$_baseUrl/auth/login');
      print(url);
      var response =
          await http.post(url, body: {'email': email, 'password': password});

      print(response.body);
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        return data['access_token'];
      } else {
        return null;
      }
    } catch (e) {
      print('Caught error: $e');
      return null;
    }
  }
}
