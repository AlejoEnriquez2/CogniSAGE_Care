import 'package:flutter/material.dart';

import '../models/models.dart';

class TestProvider extends ChangeNotifier {
  TestModel test = TestModel(
    testDate: DateTime.now(),
    testTotalTime: 0,
    testTotalGrade: 0,
    patientName: '',
    patientBirthday: DateTime.now(),
    patientEducation: '',
    patientGender: '',
    patientRace: '',
    patientMemory: '',
    patientRelatives: false,
    patientBalance: '',
    patientMajorStroke: false,
    patientMinorStroke: false,
    patientDepression: '',
    patientPersonality: '',
    patientDifficulties: '',
    answersId: 0,
    formId: 0,
    patientId: 0,
  );

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
