import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormService extends ChangeNotifier {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';

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
