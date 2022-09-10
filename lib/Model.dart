// To parse this JSON data, do
//
//     final getapimodel = getapimodelFromJson(jsonString);

import 'dart:convert';

List<Getapimodel> getapimodelFromJson(String str) => List<Getapimodel>.from(
    json.decode(str).map((x) => Getapimodel.fromJson(x)));

String getapimodelToJson(List<Getapimodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Getapimodel {
  Getapimodel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory Getapimodel.fromJson(Map<String, dynamic> json) => Getapimodel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
