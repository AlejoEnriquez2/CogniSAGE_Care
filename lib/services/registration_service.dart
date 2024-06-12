import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class RegistrationService {
  // final String _baseUrl = 'http://192.168.0.38:3000';
  // final String _baseUrl = 'http://192.168.137.1:3000';
  final String _baseUrl = 'https://33b9-46-239-120-87.ngrok-free.app';

  Future<void> submitRegistration(
      registrationModel, BuildContext context) async {
    registrationModel.status = 'To be evaluated';
    registrationModel.grade = 0;
    registrationModel.description = 'New user';

    var url = Uri.parse('$_baseUrl/patient');
    print(url);
    var headers = {"Content-type": "application/json"};
    print(registrationModel.toRawJson());

    try {
      // First attempt without SSL bypass
      final response = await http.post(
        url,
        headers: headers,
        body: registrationModel.toRawJson(),
      );
      _processResponse(response);
    } catch (e) {
      await _retryWithSslBypass(url, headers, registrationModel.toRawJson());
    }
  }

  Future<void> _retryWithSslBypass(
      Uri url, Map<String, String> headers, String body) async {
    // Create a custom HttpClient that ignores SSL certificate errors
    HttpClient client = HttpClient();
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    IOClient ioClient = IOClient(client);

    final response = await ioClient.post(
      url,
      headers: headers,
      body: body,
    );
    _processResponse(response);
  }

  void _processResponse(http.Response response) {
    print(response.body);
    if (response.statusCode != 201) {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}
