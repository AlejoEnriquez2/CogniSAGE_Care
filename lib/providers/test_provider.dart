import 'package:flutter/material.dart';

import '../models/models.dart';

class TestProvider extends ChangeNotifier {
  TestModel test = TestModel(
    testDate: DateTime.now(),
    testTotalTime: 0,
    testTotalGrade: 0,
    patientName: '',
    patientBirthday: '',
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

  updateGender(bool selectedGender) {
    var gender = '';
    if (selectedGender) {
      gender = "man";
    } else {
      gender = "woman";
    }
    test.patientGender = gender;
    notifyListeners();
  }

  updateRelatives(bool selectedRelatives) {
    test.patientRelatives = selectedRelatives;
    notifyListeners();
  }

  updateMemoryProblems(String memoryProblems) {
    test.patientMemory = memoryProblems;
    notifyListeners();
  }

  updateBalanceProblems(String balanceProblems) {
    test.patientBalance = balanceProblems;
    notifyListeners();
  }

  updateMajorStroke(bool selectedMajorStroke) {
    test.patientMajorStroke = selectedMajorStroke;
    notifyListeners();
  }

  updateMinorStroke(bool selectedMinorStroke) {
    test.patientMinorStroke = selectedMinorStroke;
    notifyListeners();
  }

  updateDepression(String depression) {
    test.patientDepression = depression;
    notifyListeners();
  }

  updatePersonality(String personality) {
    test.patientPersonality = personality;
    notifyListeners();
  }
}
