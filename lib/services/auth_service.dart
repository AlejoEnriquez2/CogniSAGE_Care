import 'dart:io';

import 'package:frontend_form/models/models.dart';
import 'package:frontend_form/providers/providers.dart';
import 'package:frontend_form/services/secure_storage.dart';
import 'package:frontend_form/services/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/io_client.dart';

class AuthService {
  // final String _baseUrl = 'http://192.168.0.38:3000';
  // final String _baseUrl = 'http://192.168.137.1:3000';
  final String _baseUrl = 'https://60ae-46-239-120-87.ngrok-free.app';

  PatientProvider patientProvider = PatientProvider();
  DatabaseService databaseService = DatabaseService();
  SecureStorage storage = SecureStorage();
  Patient? patient;

  Future<String?> login(String email, String password) async {
    var url = Uri.parse('$_baseUrl/auth/login');

    try {
      // First attempt without SSL bypass
      var response =
          await http.post(url, body: {'email': email, 'password': password});
      return _processResponse(response);
    } catch (e) {
      return await _retryWithSslBypass(url, email, password);
    }
  }

  Future<String?> _retryWithSslBypass(
      Uri url, String email, String password) async {
    // Create a custom HttpClient that ignores SSL certificate errors
    HttpClient client = HttpClient();
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    IOClient ioClient = IOClient(client);

    var response =
        await ioClient.post(url, body: {'email': email, 'password': password});
    return _processResponse(response);
  }

  String? _processResponse(http.Response response) {
    print(response.body);
    if (response.statusCode != 201) {
      throw Exception(jsonDecode(response.body)['message']);
    } else {
      var data = jsonDecode(response.body);
      return data['access_token'];
    }
  }
}
