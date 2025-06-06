import 'dart:convert';

class PostingJualRequestModel {
  final int? burungId;
  final String? burungType;
  final int? harga;
  final String? deskripsi;

  PostingJualRequestModel({
    this.burungId,
    this.burungType,
    this.harga,
    this.deskripsi,
  });

  Map<String, String> toJson() {
    return {
      'burung_id': burungId?.toString() ?? '',
      'burung_type': burungType ?? '',
      'harga': harga?.toString() ?? '',
      'deskripsi': deskripsi ?? '',
    };
  }
}