import 'dart:convert';

class AnswersModel {
  String? orientationMonth;
  String? orientationDay;
  String? orientationYear;
  String? namingPicture1;
  String? namingPicture2;
  String? similarities;
  double? calculation1;
  double? calculation2;
  List<int>? constructionsRedraw;
  List<int>? constructionsDraw;
  List<String>? verbalWords;
  String? executiveTrail;
  String? executiveLines;
  List<int>? executiveDraw;
  String? memoryPhrase;
  String? w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12;

  AnswersModel({
    this.orientationMonth,
    this.orientationDay,
    this.orientationYear,
    this.namingPicture1,
    this.namingPicture2,
    this.similarities,
    this.calculation1,
    this.calculation2,
    this.constructionsRedraw,
    this.constructionsDraw,
    this.verbalWords,
    this.executiveTrail,
    this.executiveLines,
    this.executiveDraw,
    this.memoryPhrase,
    this.w1,
    this.w2,
    this.w3,
    this.w4,
    this.w5,
    this.w6,
    this.w7,
    this.w8,
    this.w9,
    this.w10,
    this.w11,
    this.w12,
  });

  factory AnswersModel.fromRawJson(String str) =>
      AnswersModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnswersModel.fromJson(Map<String, dynamic> json) => AnswersModel(
        orientationMonth: json["orientationMonth"],
        orientationDay: json["orientationDay"],
        orientationYear: json["orientationYear"],
        namingPicture1: json["namingPicture1"],
        namingPicture2: json["namingPicture2"],
        similarities: json["similarities"],
        calculation1: json["calculation1"],
        calculation2: json["calculation2"],
        constructionsRedraw: json["constructionsRedraw"],
        constructionsDraw: json["constructionsDraw"],
        verbalWords: List<String>.from(json["verbalWords"].map((x) => x)),
        executiveTrail: json["executiveTrail"],
        executiveLines: json["executiveLines"],
        executiveDraw: json["executiveDraw"],
        memoryPhrase: json["memoryPhrase"],
      );

  Map<String, dynamic> toJson() => {
        "orientationMonth": orientationMonth,
        "orientationDay": orientationDay,
        "orientationYear": orientationYear,
        "namingPicture1": namingPicture1,
        "namingPicture2": namingPicture2,
        "similarities": similarities,
        "calculation1": calculation1,
        "calculation2": calculation2,
        "constructionsRedraw": constructionsRedraw,
        "constructionsDraw": constructionsDraw,
        "verbalWords": verbalWords != null
            ? List<dynamic>.from(verbalWords!.map((x) => x))
            : [],
        "executiveTrail": executiveTrail,
        "executiveLines": executiveLines,
        "executiveDraw": executiveDraw,
        "memoryPhrase": memoryPhrase,
      };
}

class Draw {
  Draw();

  factory Draw.fromRawJson(String str) => Draw.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Draw.fromJson(Map<String, dynamic> json) => Draw();

  Map<String, dynamic> toJson() => {};
}
