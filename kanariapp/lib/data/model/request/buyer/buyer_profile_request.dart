import 'dart:convert';

class BuyerProfileRequestModel {
  final String? name;
  final String? address;
  final String? phone;
  final String? photo;

  BuyerProfileRequestModel({
    this.name,
    this.address,
    this.phone,
    this.photo,
  });

  factory BuyerProfileRequestModel.fromJson(String str) =>
      BuyerProfileRequestModel.fromMap(json.decode(str));

  factory BuyerProfileRequestModel.fromMap(Map<String, dynamic> json) =>
      BuyerProfileRequestModel(
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        photo: json["photo"],
      );

  Map<String, String> toJson() => {
        "name": name ?? '',
        "address": address ?? '',
        "phone": phone ?? '',
        "photo": photo ?? '',
      };
}
