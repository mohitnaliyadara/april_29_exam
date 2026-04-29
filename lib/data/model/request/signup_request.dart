import 'dart:convert';

SignupRequest signupRequestFromJson(String str) =>
    SignupRequest.fromJson(json.decode(str));

String signupRequestToJson(SignupRequest data) => json.encode(data.toJson());

class SignupRequest {
  final String? fullName;
  final String? email;
  final String? phone;
  final String? password;

  SignupRequest({this.fullName, this.email, this.phone, this.password});

  SignupRequest copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? password,
  }) => SignupRequest(
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    password: password ?? this.password,
  );

  factory SignupRequest.fromJson(Map<String, dynamic> json) => SignupRequest(
    fullName: json["full_name"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "email": email,
    "phone": phone,
    "password": password,
  };
}
