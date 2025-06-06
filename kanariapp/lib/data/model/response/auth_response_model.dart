import 'dart:convert';

class AuthResponseModel {
    final String? message;
    final int? statusCode;
    final User? user;

    AuthResponseModel({
        this.message,
        this.statusCode,
        this.user,
    });

    factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
        message: json["message"],
        statusCode: json["status_code"],
        user: json["data"] == null ? null : User.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "status_code": statusCode,
        "data": user?.toMap(),
    };
}