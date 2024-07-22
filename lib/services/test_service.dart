import 'dart:convert';
import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend_form/models/answers_model.dart';
import 'package:frontend_form/models/models.dart';
import 'package:frontend_form/providers/locale_provider.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:provider/provider.dart';

class TestService {
  // final String _baseUrl = 'http://192.168.0.38:3000';
  // final String _baseUrl = 'http://192.168.137.1:3000';
  final String _baseUrl = 'https://60ae-46-239-120-87.ngrok-free.app';

  int formId = 1;
  String testLanguage = 'en';

  Future<String> saveTestPersonalInfo(
      TestModel testModel, AnswersModel answersModel, context) async {
    testModel.testTotalTime =
        DateTime.now().difference(testModel.testDate!).inSeconds;
    testModel.testTotalGrade = 0;
    LocaleProvider localeProvider =
        Provider.of<LocaleProvider>(context, listen: false);

    testModel.testLanguage = localeProvider.locale.toString();
    formId = testModel.formId!;
    testLanguage = testModel.testLanguage!;

    AnswersModel fillEmptyFields(AnswersModel am) {
      am.orientationDay = answersModel.orientationDay ?? 'null';
      am.orientationMonth = answersModel.orientationMonth ?? 'null';
      am.orientationYear = answersModel.orientationYear ?? 'null';
      am.namingPicture1 = answersModel.namingPicture1 ?? 'null';
      am.namingPicture2 = answersModel.namingPicture2 ?? 'null';
      am.similarities = answersModel.similarities ?? 'null';
      am.calculation1 = answersModel.calculation1 ?? 0;
      am.calculation2 = answersModel.calculation2 ?? 0;
      am.constructionsDraw = answersModel.constructionsDraw ?? [];
      am.constructionsRedraw = answersModel.constructionsRedraw ?? [];
      am.verbalWords = answersModel.verbalWords ?? [];
      am.executiveTrail = answersModel.executiveTrail ?? 'null';
      am.executiveLines = answersModel.executiveLines ?? 'null';
      am.executiveLinesDraw = answersModel.executiveLinesDraw ?? [];
      am.executiveDraw = answersModel.executiveDraw ?? [];
      am.memoryPhrase = answersModel.memoryPhrase ?? 'null';
      return am;
    }

    int testId = await saveTestAnswers(fillEmptyFields(answersModel), context);
    if (testId == -1) {
      throw Exception('Error saving test answers');
    }

    testModel.answersId = testId;

    final url = Uri.parse('$_baseUrl/test');
    print(url);
    final headers = {"Content-type": "application/json"};
    print(testModel.toRawJson());

    try {
      // First attempt without SSL bypass
      final response = await http.post(
        url,
        headers: headers,
        body: testModel.toRawJson(),
      );
      return response.body;
    } catch (e) {
      await _retryWithSslBypass(url, headers, testModel.toRawJson());
      return 'trying again...';
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

  Future<int> saveTestAnswers(AnswersModel answersModel, context) async {
    var url = Uri.parse('$_baseUrl/user-answers');
    var headers = {"Content-type": "application/json"};
    print(answersModel.toPrint());
    answersModel.formId = formId;
    answersModel.testLanguage = testLanguage;

    try {
      // First attempt without SSL bypass
      final response = await http.post(
        url,
        headers: headers,
        body: answersModel.toRawJson(),
      );
      return _processAnswersResponse(response);
    } catch (e) {
      return await _retrySaveTestAnswersWithSslBypass(
          url, headers, answersModel.toRawJson());
    }
  }

  Future<int> _retrySaveTestAnswersWithSslBypass(
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
    return _processAnswersResponse(response);
  }

  int _processAnswersResponse(http.Response response) {
    print('RESPONSE FROM ANSWERS POST');
    print(response.body);

    if (response.statusCode == 201) {
      var jsonData = json.decode(response.body);
      print(jsonData);
      return jsonData['id'];
    } else {
      return -1;
    }
  }

  Future<void> saveNasaTlx(int id, String nasa, context) async {
    final url = Uri.parse('$_baseUrl/test/$id');
    final headers = {"Content-type": "application/json"};
    print(nasa);

    try {
      // First attempt without SSL bypass
      final response = await http.put(
        url,
        headers: headers,
        body: nasa,
      );
      print(response.body);
    } catch (e) {
      print('ERROR: ' + e.toString());
    }
  }
}
