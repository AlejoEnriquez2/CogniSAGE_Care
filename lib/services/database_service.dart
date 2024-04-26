import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:frontend_form/services/secure_storage.dart';
import '../models/models.dart';

class DatabaseService extends ChangeNotifier {
  final String _baseUrl = 'http://192.168.0.38:3000';
  // final String _baseUrl = 'http://192.168.137.1:3000';
  Patient? patient;
  final storage = SecureStorage();

  Future<Patient> getPatientInfo() async {
    String? token = await storage.getToken();
    Map<String, dynamic> decodedToken = decodeToken(token!);
    // Maybe patientId
    String patientId = decodedToken['id'].toString();
    final response = await http.get(
      Uri.parse('$_baseUrl/patient/$patientId'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      patient = Patient.fromJson(jsonDecode(response.body));
      print(patient!.email);
      return patient!;
    } else if (response.statusCode == 404) {
      throw Exception('USER NOT FOUND');
    } else {
      throw Exception('Something went wrong');
    }
  }

  Map<String, dynamic> decodeToken(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = parts[1];
    final normalized = base64Url.normalize(payload);
    final resp = utf8.decode(base64Url.decode(normalized));
    final payloadMap = json.decode(resp);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload');
    }

    return payloadMap;
  }
}
