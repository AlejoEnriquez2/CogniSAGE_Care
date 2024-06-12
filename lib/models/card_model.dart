import 'dart:convert';

class CardModel {
  int id;
  String name;
  bool isCorrect;
  String? description;

  CardModel({
    required this.id,
    required this.name,
    this.isCorrect = false,
    this.description,
  });

  factory CardModel.fromRawJson(String str) =>
      CardModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json["id"],
        name: json["name"],
        isCorrect: json["isCorrect"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isCorrect": isCorrect,
        "description": description,
      };
}
