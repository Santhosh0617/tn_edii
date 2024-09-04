import 'dart:convert';

class Curriculum {
  int? id;
  int? trainingId;
  String? section;
  String? title;
  int? minutes;
  String? path;
  String? videoTitle;
  DateTime? createdAt;
  DateTime? updatedAt;

  Curriculum({
    this.id,
    this.trainingId,
    this.section,
    this.title,
    this.minutes,
    this.path,
    this.videoTitle,
    this.createdAt,
    this.updatedAt,
  });

  factory Curriculum.fromRawJson(String str) =>
      Curriculum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Curriculum.fromJson(Map<String, dynamic> json) => Curriculum(
        id: json["id"],
        trainingId: json["trainingId"],
        section: json["section"],
        title: json["Title"],
        minutes: json["minutes"],
        path: json["path"],
        videoTitle: json["videoTitle"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trainingId": trainingId,
        "section": section,
        "Title": title,
        "minutes": minutes,
        "path": path,
        "videoTitle": videoTitle,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
  List<Curriculum> fromJsonList(List json) {
    return json.map((e) => Curriculum.fromJson(e)).toList();
  }
}
