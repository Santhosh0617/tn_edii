import 'dart:convert';

import 'package:tn_edii/models/weather/weather_data.dart';

class CurrentObservation {
  int? pubDate;
  Wind? wind;
  Atmosphere? atmosphere;
  Astronomy? astronomy;
  Condition? condition;

  CurrentObservation({
    this.pubDate,
    this.wind,
    this.atmosphere,
    this.astronomy,
    this.condition,
  });

  factory CurrentObservation.fromRawJson(String str) =>
      CurrentObservation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CurrentObservation.fromJson(Map<String, dynamic> json) =>
      CurrentObservation(
        pubDate: json["pubDate"],
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        atmosphere: json["atmosphere"] == null
            ? null
            : Atmosphere.fromJson(json["atmosphere"]),
        astronomy: json["astronomy"] == null
            ? null
            : Astronomy.fromJson(json["astronomy"]),
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
      );

  Map<String, dynamic> toJson() => {
        "pubDate": pubDate,
        "wind": wind?.toJson(),
        "atmosphere": atmosphere?.toJson(),
        "astronomy": astronomy?.toJson(),
        "condition": condition?.toJson(),
      };
}
