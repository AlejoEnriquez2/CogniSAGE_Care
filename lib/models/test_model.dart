import 'dart:convert';

class TestModel {
  DateTime? testDate;
  int? testTotalTime;
  int? testTotalGrade;
  String? patientName;
  String? patientBirthday;
  String? patientEducation;
  String? patientGender;
  String? patientRace;
  String? patientMemory;
  bool? patientRelatives;
  String? patientBalance;
  bool? patientMajorStroke;
  bool? patientMinorStroke;
  String? patientDepression;
  String? patientPersonality;
  bool? patientDifficulties;
  String? testLanguage;
  int? answersId;
  int? formId;
  int? patientId;

  TestModel({
    this.testDate,
    this.testTotalTime,
    this.testTotalGrade,
    this.patientName,
    this.patientBirthday,
    this.patientEducation,
    this.patientGender,
    this.patientRace,
    this.patientMemory,
    this.patientRelatives,
    this.patientBalance,
    this.patientMajorStroke,
    this.patientMinorStroke,
    this.patientDepression,
    this.patientPersonality,
    this.patientDifficulties,
    this.testLanguage,
    this.answersId,
    this.formId,
    this.patientId,
  });

  factory TestModel.fromRawJson(String str) =>
      TestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        testDate: DateTime.parse(json["testDate"]),
        testTotalTime: json["testTotalTime"],
        testTotalGrade: json["testTotalGrade"],
        patientName: json["patientName"],
        patientBirthday: json["patientBirthday"],
        patientEducation: json["patientEducation"],
        patientGender: json["patientGender"],
        patientRace: json["patientRace"],
        patientMemory: json["patientMemory"],
        patientRelatives: json["patientRelatives"],
        patientBalance: json["patientBalance"],
        patientMajorStroke: json["patientMajorStroke"],
        patientMinorStroke: json["patientMinorStroke"],
        patientDepression: json["patientDepression"],
        patientPersonality: json["patientPersonality"],
        patientDifficulties: json["patientDifficulties"],
        testLanguage: json["testLanguage"],
        answersId: json["answersId"],
        formId: json["formId"],
        patientId: json["patientId"],
      );

  Map<String, dynamic> toJson() => {
        "testDate": testDate.toString(),
        "testTotalTime": testTotalTime,
        "testTotalGrade": testTotalGrade,
        "patientName": patientName,
        "patientBirthday": patientBirthday,
        "patientEducation": patientEducation,
        "patientGender": patientGender,
        "patientRace": patientRace,
        "patientMemory": patientMemory,
        "patientRelatives": patientRelatives,
        "patientBalance": patientBalance,
        "patientMajorStroke": patientMajorStroke,
        "patientMinorStroke": patientMinorStroke,
        "patientDepression": patientDepression,
        "patientPersonality": patientPersonality,
        "patientDifficulties": patientDifficulties,
        "testLanguage": testLanguage,
        "answersId": answersId,
        "formId": formId,
        "patientId": patientId,
      };
}
