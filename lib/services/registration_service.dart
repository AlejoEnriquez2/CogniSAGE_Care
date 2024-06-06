import 'dart:convert';

import 'package:http/http.dart' as http;

class RegistrationService {
  // final String _baseUrl = 'http://192.168.0.38:3000';
  // final String _baseUrl = 'http://192.168.137.1:3000';
  final String _baseUrl = 'https://33b9-46-239-120-87.ngrok-free.app';

  Future<void> submitRegistration(registrationModel, context) async {
    registrationModel.status = 'To be evaluated';
    registrationModel.grade = 0;
    registrationModel.description = 'New user';

    final url = Uri.parse('$_baseUrl/patient');
    print(url);
    final headers = {"Content-type": "application/json"};
    print(registrationModel.toRawJson());
    final response = await http.post(
      url,
      headers: headers,
      body: registrationModel.toRawJson(),
    );
    print(response.body);
    if (response.statusCode != 201) {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}
