import 'dart:convert';

import 'package:tn_edii/utilities/extensions/string_extenstion.dart';
import 'package:tn_edii/view/course_screen/widget/course_details_container.dart';

class Resourses {
  int? id;
  String? name;
  String? role;
  String? email;
  String? phonenumber;
  String? password;
  bool? isMentor;
  bool? isInvestor;
  bool? isEntrepreneur;
  String? level;
  String? location;
  String? contactDetails;
  String? qualification;
  String? dateOfBirth;
  String? age;
  String? gender;
  String? permanentAddress;
  String? community;
  String? religion;
  bool? differentlyAbled;
  String? nameOfUniversity;
  String? nameOfDegree;
  String? yearOfCompletion;
  String? percentageOfMarks;
  String? fatherName;
  String? motherName;
  String? guardianNumber;
  String? addressOfCommunication;
  String? pincode;
  String? oneTimePassword;
  bool? isForgotPassword;
  String? forgotOneTimePassword;
  bool? isOtpVerified;
  String? profilePicture;
  DateTime? createdAt;
  DateTime? updatedAt;

  Resourses({
    this.id,
    this.name,
    this.role,
    this.email,
    this.phonenumber,
    this.password,
    this.isMentor,
    this.isInvestor,
    this.isEntrepreneur,
    this.level,
    this.location,
    this.contactDetails,
    this.qualification,
    this.dateOfBirth,
    this.age,
    this.gender,
    this.permanentAddress,
    this.community,
    this.religion,
    this.differentlyAbled,
    this.nameOfUniversity,
    this.nameOfDegree,
    this.yearOfCompletion,
    this.percentageOfMarks,
    this.fatherName,
    this.motherName,
    this.guardianNumber,
    this.addressOfCommunication,
    this.pincode,
    this.oneTimePassword,
    this.isForgotPassword,
    this.forgotOneTimePassword,
    this.isOtpVerified,
    this.profilePicture,
    this.createdAt,
    this.updatedAt,
  });

  factory Resourses.fromRawJson(String str) =>
      Resourses.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Resourses.fromJson(Map<String, dynamic> json) => Resourses(
        id: json["id"],
        name: json["name"],
        role: json["role"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        password: json["password"],
        isMentor: json["is_mentor"],
        isInvestor: json["is_investor"],
        isEntrepreneur: json["is_entrepreneur"],
        level: json["level"],
        location: json["location"],
        contactDetails: json["contact_details"],
        qualification: json["qualification"],
        dateOfBirth: json["date_of_birth"],
        age: json["age"],
        gender: json["gender"],
        permanentAddress: json["permanent_address"],
        community: json["community"],
        religion: json["religion"],
        differentlyAbled: json["differently_abled"],
        nameOfUniversity: json["name_of_university"],
        nameOfDegree: json["name_of_degree"],
        yearOfCompletion: json["year_of_completion"],
        percentageOfMarks: json["percentage_of_marks"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        guardianNumber: json["guardian_number"],
        addressOfCommunication: json["address_of_communication"],
        pincode: json["pincode"],
        oneTimePassword: json["one_time_password"],
        isForgotPassword: json["is_forgot_password"],
        forgotOneTimePassword: json["forgot_one_time_password"],
        isOtpVerified: json["is_otp_verified"],
        profilePicture: json["profile_picture"].toString().toImageUrl(),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
        "email": email,
        "phonenumber": phonenumber,
        "password": password,
        "is_mentor": isMentor,
        "is_investor": isInvestor,
        "is_entrepreneur": isEntrepreneur,
        "level": level,
        "location": location,
        "contact_details": contactDetails,
        "qualification": qualification,
        "date_of_birth": dateOfBirth,
        "age": age,
        "gender": gender,
        "permanent_address": permanentAddress,
        "community": community,
        "religion": religion,
        "differently_abled": differentlyAbled,
        "name_of_university": nameOfUniversity,
        "name_of_degree": nameOfDegree,
        "year_of_completion": yearOfCompletion,
        "percentage_of_marks": percentageOfMarks,
        "father_name": fatherName,
        "mother_name": motherName,
        "guardian_number": guardianNumber,
        "address_of_communication": addressOfCommunication,
        "pincode": pincode,
        "one_time_password": oneTimePassword,
        "is_forgot_password": isForgotPassword,
        "forgot_one_time_password": forgotOneTimePassword,
        "is_otp_verified": isOtpVerified,
        "profile_picture": profilePicture,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
  List<Resourses> fromJsonList(List json) {
    return json.map((e) => Resourses.fromJson(e)).toList();
  }
}
