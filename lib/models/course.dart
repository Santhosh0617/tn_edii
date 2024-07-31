import 'dart:convert';

class Course {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? profileImage;
  String? imageUrl;
  dynamic emailVerifiedAt;
  dynamic role;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Course({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.profileImage,
    this.imageUrl,
    this.emailVerifiedAt,
    this.role,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Course.fromRawJson(String str) => Course.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Course.fromJson(Map<String, dynamic> json) {
    String profile = json["profile_image"] ?? '';
    return Course(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      mobile: json["mobile"],
      profileImage: profile,
      // imageUrl: profile.toImageUrl(StoragePaths.profileImages),
      emailVerifiedAt: json["email_verified_at"],
      role: json["role"],
      status: json["status"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "profile_image": profileImage,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  List<Course> fromJsonList(List json) {
    return json.map((e) => Course.fromJson(e)).toList();
  }
}
