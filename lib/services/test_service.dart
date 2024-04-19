import 'dart:convert';

import 'package:frontend_form/models/models.dart';
import 'package:http/http.dart' as http;

class TestService {
  final String _baseUrl = 'http://192.168.0.38:3000';

  Future<void> saveTestPersonalInfo(
      TestModel testModel, AnswersModel answersModel, context) async {
    testModel.testTotalTime =
        DateTime.now().difference(testModel.testDate!).inSeconds;
    testModel.testTotalGrade = 0;
    testModel.formId = 1;

    int testId = await saveTestAnswers(answersModel, context);
    if (testId == -1) {
      throw Exception('Error saving test answers');
    }
    testModel.answersId = testId;

    final url = Uri.parse('$_baseUrl/test');
    print(url);
    final headers = {"Content-type": "application/json"};
    print(testModel.toRawJson());
    final response = await http.post(
      url,
      headers: headers,
      body: testModel.toRawJson(),
    );
    print(response.body);
  }

  Future<int> saveTestAnswers(AnswersModel answersModel, context) async {
    final url = Uri.parse('$_baseUrl/user-answers');
    final headers = {"Content-type": "application/json"};
    print(answersModel.toPrint());
    final response = await http.post(
      url,
      headers: headers,
      body: answersModel.toRawJson(),
    );

    if (response.statusCode == 201) {
      var jsonData = json.decode(response.body);
      return jsonData['id'];
    } else {
      return -1;
    }

    // print(response.body);
    // return -1;
  }
}
