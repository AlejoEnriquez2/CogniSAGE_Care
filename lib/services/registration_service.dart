import 'package:http/http.dart' as http;

class RegistrationService {
  final String _baseUrl = 'http://192.168.0.38:3000';

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
  }
}
