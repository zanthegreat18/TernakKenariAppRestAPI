import 'dart:convert';

class AnakRequestModel {
  final String? noRing;
  final DateTime? tanggalLahir;
  final String? jenisKelamin;
  final String? jenisKenari;
  final String? gambarAnak;
  final int? ayahId;
  final int? ibuId;

  AnakRequestModel({
    this.noRing,
    this.tanggalLahir,
    this.jenisKelamin,
    this.jenisKenari,
    this.gambarAnak,
    this.ayahId,
    this.ibuId,
  });

  Map<String, String> toJson() {
    return {
      'no_ring': noRing ?? '',
      'tanggal_lahir': tanggalLahir != null
          ? "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}"
          : '',
      'jenis_kelamin': jenisKelamin ?? '',
      'jenis_kenari': jenisKenari ?? '',
      'gambar_anak': gambarAnak ?? '',
      'ayah_id': ayahId?.toString() ?? '',
      'ibu_id': ibuId?.toString() ?? '',
    };
  }
}