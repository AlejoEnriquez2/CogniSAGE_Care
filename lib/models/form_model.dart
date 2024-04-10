import 'dart:convert';

class FormModel {
  String? formImage;
  String? draw;
  String? answer1;
  String? answer2;

  FormModel({
    this.formImage,
    this.draw,
    this.answer1,
    this.answer2,
  });

  factory FormModel.fromRawJson(String str) =>
      FormModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        formImage: json["formImage"],
        draw: json["draw"],
        answer1: json["answer1"],
        answer2: json["answer2"],
      );

  Map<String, dynamic> toJson() => {
        "formImage": formImage,
        "draw": draw,
        "answer1": answer1,
        "answer2": answer2,
      };
}
