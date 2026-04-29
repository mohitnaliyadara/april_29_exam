// To parse this JSON data, do
//
//     final signupResponse = signupResponseFromJson(jsonString);

import 'dart:convert';

SignupResponse signupResponseFromJson(String str) =>
    SignupResponse.fromJson(json.decode(str));

String signupResponseToJson(SignupResponse data) => json.encode(data.toJson());

class SignupResponse {
  final String? code;
  final String? message;
  final Data? data;

  SignupResponse({this.code, this.message, this.data});

  SignupResponse copyWith({String? code, String? message, Data? data}) =>
      SignupResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final int? id;
  final String? fullName;
  final String? email;
  final String? phone;

  Data({this.id, this.fullName, this.email, this.phone});

  Data copyWith({int? id, String? fullName, String? email, String? phone}) =>
      Data(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    fullName: json["full_name"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "email": email,
    "phone": phone,
  };
}
