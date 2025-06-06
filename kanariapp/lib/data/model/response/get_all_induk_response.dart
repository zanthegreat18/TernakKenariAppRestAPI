import 'dart:convert';

class GetIndukById {
  final String message;
  final int statusCode;
  final GetInduk data;

  GetIndukById({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  GetIndukById copyWith({String? message, int? statusCode, GetInduk? data}) =>
      GetIndukById(
        message: message ?? this.message,
        statusCode: statusCode ?? this.statusCode,
        data: data ?? this.data,
      );

  factory GetIndukById.fromRawJson(String str) =>
      GetIndukById.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetIndukById.fromJson(Map<String, dynamic> json) => GetIndukById(
    message: json["message"],
    statusCode: json["status_code"],
    data: GetInduk.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status_code": statusCode,
    "data": data.toJson(),
  };
}

class GetAllIndukModel {
  final String message;
  final int statusCode;
  final List<GetInduk> data;

  GetAllIndukModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  GetAllIndukModel copyWith({
    String? message,
    int? statusCode,
    List<GetInduk>? data,
  }) => GetAllIndukModel(
    message: message ?? this.message,
    statusCode: statusCode ?? this.statusCode,
    data: data ?? this.data,
  );

  factory GetAllIndukModel.fromRawJson(String str) =>
      GetAllIndukModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetAllIndukModel.fromJson(Map<String, dynamic> json) =>
      GetAllIndukModel(
        message: json["message"],
        statusCode: json["status_code"],
        data: List<GetInduk>.from(
          json["data"].map((x) => GetInduk.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status_code": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}