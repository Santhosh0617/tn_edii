import 'dart:convert';

import 'package:tn_edii/models/weather/current_observation.dart';

class WeatherData {
  Location? location;
  CurrentObservation? currentObservation;
  List<Forecast>? forecasts;

  WeatherData({
    this.location,
    this.currentObservation,
    this.forecasts,
  });

  factory WeatherData.fromRawJson(String str) =>
      WeatherData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        currentObservation: json["current_observation"] == null
            ? null
            : CurrentObservation.fromJson(json["current_observation"]),
        forecasts: json["forecasts"] == null
            ? []
            : List<Forecast>.from(
                json["forecasts"]!.map((x) => Forecast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "current_observation": currentObservation?.toJson(),
        "forecasts": forecasts == null
            ? []
            : List<dynamic>.from(forecasts!.map((x) => x.toJson())),
      };
}

class Astronomy {
  String? sunrise;
  String? sunset;

  Astronomy({
    this.sunrise,
    this.sunset,
  });

  factory Astronomy.fromRawJson(String str) =>
      Astronomy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Astronomy.fromJson(Map<String, dynamic> json) => Astronomy(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Atmosphere {
  int? humidity;
  double? visibility;
  double? pressure;

  Atmosphere({
    this.humidity,
    this.visibility,
    this.pressure,
  });

  factory Atmosphere.fromRawJson(String str) =>
      Atmosphere.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Atmosphere.fromJson(Map<String, dynamic> json) => Atmosphere(
        humidity: json["humidity"],
        visibility: json["visibility"]?.toDouble(),
        pressure: json["pressure"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "humidity": humidity,
        "visibility": visibility,
        "pressure": pressure,
      };
}

class Condition {
  int? temperature;
  String? text;
  int? code;

  Condition({
    this.temperature,
    this.text,
    this.code,
  });

  factory Condition.fromRawJson(String str) =>
      Condition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        temperature: json["temperature"],
        text: json["text"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "text": text,
        "code": code,
      };
}

class Wind {
  int? chill;
  String? direction;
  int? speed;

  Wind({
    this.chill,
    this.direction,
    this.speed,
  });

  factory Wind.fromRawJson(String str) => Wind.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        chill: json["chill"],
        direction: json["direction"],
        speed: json["speed"],
      );

  Map<String, dynamic> toJson() => {
        "chill": chill,
        "direction": direction,
        "speed": speed,
      };
}

class Forecast {
  String? day;
  int? date;
  int? high;
  int? low;
  String? text;
  int? code;

  Forecast({
    this.day,
    this.date,
    this.high,
    this.low,
    this.text,
    this.code,
  });

  factory Forecast.fromRawJson(String str) =>
      Forecast.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        day: json["day"],
        date: json["date"],
        high: json["high"],
        low: json["low"],
        text: json["text"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "date": date,
        "high": high,
        "low": low,
        "text": text,
        "code": code,
      };
}

class Location {
  String? city;
  String? region;
  int? woeid;
  String? country;
  double? lat;
  double? long;
  String? timezoneId;

  Location({
    this.city,
    this.region,
    this.woeid,
    this.country,
    this.lat,
    this.long,
    this.timezoneId,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        city: json["city"],
        region: json["region"],
        woeid: json["woeid"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        timezoneId: json["timezone_id"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "region": region,
        "woeid": woeid,
        "country": country,
        "lat": lat,
        "long": long,
        "timezone_id": timezoneId,
      };
}
