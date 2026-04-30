// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromJson(jsonString);

import 'dart:convert';

SignInResponse signInResponseFromJson(String str) => SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  final int? id;
  final String? fullName;
  final String? email;
  final String? phone;

  SignInResponse({
    this.id,
    this.fullName,
    this.email,
    this.phone,
  });

  SignInResponse copyWith({
    int? id,
    String? fullName,
    String? email,
    String? phone,
  }) =>
      SignInResponse(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
      );

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
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
