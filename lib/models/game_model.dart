import 'dart:convert';

class GameModel {
  String id;
  String name;
  List<String> focus = [];
  String description;
  String imageName;

  GameModel({
    required this.id,
    required this.name,
    required this.focus,
    required this.description,
    required this.imageName,
  });

  factory GameModel.fromRawJson(String str) =>
      GameModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        id: json["id"],
        name: json["name"],
        focus: json["focus"],
        description: json["description"],
        imageName: json["imageName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "focus": focus,
        "description": description,
        "imageName": imageName,
      };
}
