import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormService extends ChangeNotifier {
  // final String _baseUrl = 'http://192.168.0.38:3000/';
  // final String _baseUrl = 'http://192.168.137.1:3000';
  final String _baseUrl = 'https://805a-46-239-120-87.ngrok-free.app';

  Future<void> submitForm(formModel, context) async {
    final url = Uri.parse('$_baseUrl/posts');
    final headers = {"Content-type": "application/json"};
    final response = await http.post(
      url,
      headers: headers,
      body: formModel.toRawJson(),
    );
    print(response.body);
  }
}
