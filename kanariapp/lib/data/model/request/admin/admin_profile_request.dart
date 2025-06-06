import 'dart:convert';

class AdminProfileRequest {
  final String? name;

  AdminProfileRequest({this.name});


  Map<String, String> toJson() {
    return {
      'name': name ?? '',
    };
  }
}