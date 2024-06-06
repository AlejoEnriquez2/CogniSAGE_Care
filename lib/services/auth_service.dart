import 'package:frontend_form/models/models.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/services/secure_storage.dart';
import 'package:frontend_form/services/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  // final String _baseUrl = 'http://192.168.0.38:3000';
  // final String _baseUrl = 'http://192.168.137.1:3000';
  final String _baseUrl = 'https://33b9-46-239-120-87.ngrok-free.app';

  PatientProvider patientProvider = PatientProvider();
  DatabaseService databaseService = DatabaseService();
  SecureStorage storage = SecureStorage();
  Patient? patient;

  Future<String?> login(String email, String password) async {
    var url = Uri.parse('$_baseUrl/auth/login');

    var response =
        await http.post(url, body: {'email': email, 'password': password});

    print(response.body);
    if (response.statusCode != 201) {
      throw Exception(jsonDecode(response.body)['message']);
    } else {
      var data = jsonDecode(response.body);
      return data['access_token'];
    }
  }
}
