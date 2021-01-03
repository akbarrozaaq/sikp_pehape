class PresensiModel {
  final String matkulId;
  final String matkulNama;
  final String matkulSks;
  final String presensiTgl;
  final String presensiKet;
  final String matkulNamaDosen;

  PresensiModel({
    this.matkulId,
    this.matkulNama,
    this.matkulSks,
    this.presensiTgl,
    this.presensiKet,
    this.matkulNamaDosen,
  });

  factory PresensiModel.fromJson(Map<String, dynamic> object) {
    return PresensiModel(
      matkulId: object["matkul_id"],
      matkulNama: object["matkul_nama"],
      matkulSks: object["matkul_sks"],
      presensiTgl: object["presensi_tgl"],
      presensiKet: object["presensi_ket"],
      matkulNamaDosen: object["matkul_namadosen"],
    );
  }
}
