import 'dart:convert';

class ArticlesModel {
    int? id;
    String? name;
    String? content;
    String? type;
    String? path;
    DateTime? createdAt;
    DateTime? updatedAt;

    ArticlesModel({
        this.id,
        this.name,
        this.content,
        this.type,
        this.path,
        this.createdAt,
        this.updatedAt,
    });

    factory ArticlesModel.fromRawJson(String str) => ArticlesModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        type: json["type"],
        path: json["path"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
        "type": type,
        "path": path,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
    List<ArticlesModel> fromJsonList(List json) {
    return json.map((e) => ArticlesModel.fromJson(e)).toList();
  }
}
