import 'dart:convert';

class IndukRequestModel {
  final String? noRing;
  final DateTime? tanggalLahir;
  final String? jenisKelamin;
  final String? jenisKenari;
  final String? keterangan;
  final String? gambarInduk;

  IndukRequestModel({
    this.noRing,
    this.tanggalLahir,
    this.jenisKelamin,
    this.jenisKenari,
    this.keterangan,
    this.gambarInduk,
  });

  Map<String, String> toJson() {
    return {
      'no_ring': noRing ?? '',
      'tanggal_lahir': tanggalLahir != null
          ? "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}"
          : '',
      'jenis_kelamin': jenisKelamin ?? '',
      'jenis_kenari': jenisKenari ?? '',
      'keterangan': keterangan ?? '',
      'gambar_induk': gambarInduk ?? '',
    };
  }
}