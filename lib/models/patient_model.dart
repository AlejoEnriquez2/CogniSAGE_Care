import 'dart:convert';

class Patient {
  int? id;
  String? name;
  String? email;
  String? password;
  String? status;
  int? grade;
  String? description;

  Patient({
    this.id,
    this.name,
    this.email,
    this.password,
    this.status,
    this.grade,
    this.description,
  });

  factory Patient.fromRawJson(String str) => Patient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        status: json["status"],
        grade: json["grade"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "status": status,
        "grade": grade,
        "description": description,
      };
}
