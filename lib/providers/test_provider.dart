import 'package:flutter/material.dart';
import 'package:frontend_form/services/test_service.dart';

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
    patientDifficulties: false,
    answersId: 0,
    formId: 1,
    patientId: 0,
    mentalDemand: 0,
    physicalDemand: 0,
    temporalDemand: 0,
    performance: 0,
    effort: 0,
    frustration: 0,
  );

  bool _isLoading = false;
  bool get isLoading => _isLoading;

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

  updateTestForm(int formId) {
    test.formId = formId;
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

  updateDifficulties(bool selectedDifficulties) {
    test.patientDifficulties = selectedDifficulties;
    notifyListeners();
  }

  void updateMentalDemand(double value) {
    test.mentalDemand = value;
    notifyListeners();
  }

  void updatePhysicalDemand(double value) {
    test.physicalDemand = value;
    notifyListeners();
  }

  void updateTemporalDemand(double value) {
    test.temporalDemand = value;
    notifyListeners();
  }

  void updatePerformance(double value) {
    test.performance = value;
    notifyListeners();
  }

  void updateEffort(double value) {
    test.effort = value;
    notifyListeners();
  }

  void updateFrustration(double value) {
    test.frustration = value;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
