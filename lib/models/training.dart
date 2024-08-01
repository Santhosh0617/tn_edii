import 'dart:convert';

import 'package:tn_edii/models/user.dart';

class Training {
  int? id;
  String? title;
  String? description;
  String? code;
  bool? isCourse;
  String? mode;
  String? rating;
  String? startDate;
  String? endDate;
  int? feeAmount;
  bool? isFullTime;
  String? location;
  String? mentorId;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  Training({
    this.id,
    this.title,
    this.description,
    this.code,
    this.isCourse,
    this.mode,
    this.rating,
    this.startDate,
    this.endDate,
    this.feeAmount,
    this.isFullTime,
    this.location,
    this.mentorId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Training.fromRawJson(String str) =>
      Training.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Training.fromJson(Map<String, dynamic> json) => Training(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        code: json["code"],
        isCourse: json["isCourse"],
        mode: json["mode"],
        rating: json["rating"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        feeAmount: json["fee_amount"],
        isFullTime: json["is_fullTime"],
        location: json["location"],
        mentorId: json["mentorId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        user: json["User"] == null ? null : User.fromJson(json["User"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "code": code,
        "isCourse": isCourse,
        "mode": mode,
        "rating": rating,
        "start_date": startDate,
        "end_date": endDate,
        "fee_amount": feeAmount,
        "is_fullTime": isFullTime,
        "location": location,
        "mentorId": mentorId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "User": user?.toJson(),
      };

  List<Training> fromJsonList(List json) {
    return json.map((e) => Training.fromJson(e)).toList();
  }
}
