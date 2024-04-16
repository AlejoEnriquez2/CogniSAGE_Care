import 'dart:developer';

import 'package:frontend_form/models/models.dart';
import 'package:http/http.dart' as http;

class TestService {
  final String _baseUrl = 'http://192.168.0.38:3000';

  Future<void> saveTestPersonalInfo(TestModel testModel, context) async {
    testModel.testTotalTime =
        DateTime.now().difference(testModel.testDate!).inSeconds;
    testModel.testTotalGrade = 0;
    testModel.answersId = 1;
    testModel.formId = 1;
    testModel.patientId = 1;

    final url = Uri.parse('$_baseUrl/test');
    print(url);
    final headers = {"Content-type": "application/json"};
    log(testModel.toRawJson());
    final response = await http.post(
      url,
      headers: headers,
      body: testModel.toRawJson(),
    );
    log(response.body);
  }

  Future<void> saveTestAnswers(AnswersModel answersModel, context) async {
    final url = Uri.parse('$_baseUrl/user-answers');
    print(url);
    final headers = {"Content-type": "application/json"};
    log(answersModel.toRawJson());
    final response = await http.post(
      url,
      headers: headers,
      body: answersModel.toRawJson(),
    );
    log(response.body);
  }
}
