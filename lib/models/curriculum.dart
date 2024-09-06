import 'dart:convert';

class Curriculum {
  String? section;
  int? totalMins;
  List<Video>? videos;

  Curriculum({
    this.section,
    this.totalMins,
    this.videos,
  });

  factory Curriculum.fromRawJson(String str) =>
      Curriculum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Curriculum.fromJson(Map<String, dynamic> json) => Curriculum(
        section: json["section"],
        totalMins: json["total_mins"],
        videos: json["videos"] == null
            ? []
            : List<Video>.from(json["videos"]!.map((x) => Video.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "section": section,
        "total_mins": totalMins,
        "videos": videos == null
            ? []
            : List<dynamic>.from(videos!.map((x) => x.toJson())),
      };

  List<Curriculum> fromJsonList(List json) {
    return json.map((e) => Curriculum.fromJson(e)).toList();
  }
}

class Video {
  int? id;
  int? trainingId;
  String? section;
  String? title;
  int? minutes;
  String? path;
  String? videoTitle;
  DateTime? createdAt;
  DateTime? updatedAt;

  Video({
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

  factory Video.fromRawJson(String str) => Video.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Video.fromJson(Map<String, dynamic> json) => Video(
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
}
