import 'dart:convert';

import 'package:tn_edii/models/training.dart';

class MyCourse {
  int? id;
  int? userId;
  int? trainingId;
  bool? isCourseCompleted;
  bool? isCertificateGenerated;
  dynamic certificatePath;
  bool? isPaymentDone;
  String? paymentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Training? training;

  MyCourse({
    this.id,
    this.userId,
    this.trainingId,
    this.isCourseCompleted,
    this.isCertificateGenerated,
    this.certificatePath,
    this.isPaymentDone,
    this.paymentId,
    this.createdAt,
    this.updatedAt,
    this.training,
  });

  factory MyCourse.fromRawJson(String str) =>
      MyCourse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyCourse.fromJson(Map<String, dynamic> json) => MyCourse(
        id: json["id"],
        userId: json["userId"],
        trainingId: json["trainingId"],
        isCourseCompleted: json["is_course_completed"],
        isCertificateGenerated: json["is_certificate_generated"],
        certificatePath: json["certificate_path"],
        isPaymentDone: json["is_payment_done"],
        paymentId: json["payment_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        training: json["Training"] == null
            ? null
            : Training.fromJson(json["Training"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "trainingId": trainingId,
        "is_course_completed": isCourseCompleted,
        "is_certificate_generated": isCertificateGenerated,
        "certificate_path": certificatePath,
        "is_payment_done": isPaymentDone,
        "payment_id": paymentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "Training": training?.toJson(),
      };

  List<MyCourse> fromJsonList(List json) {
    return json.map((e) => MyCourse.fromJson(e)).toList();
  }
}
