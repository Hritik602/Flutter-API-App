// To parse this JSON data, do
//
//     final createNew = createNewFromJson(jsonString);

import 'dart:convert';

CreateNew createNewFromJson(String str) => CreateNew.fromJson(json.decode(str));

String createNewToJson(CreateNew data) => json.encode(data.toJson());

class CreateNew {
  CreateNew({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  String ? name;
  String ?job;
  String ?id;
  DateTime? createdAt;

  factory CreateNew.fromJson(Map<String, dynamic> json) => CreateNew(
    name: json["name"],
    job: json["job"],
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "id": id,
    "createdAt": createdAt!.toIso8601String(),
  };
}