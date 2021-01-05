class PresensiModel {
  final String matkulNama;
  final String matkulSks;
  final String presensiTgl;
  final String presensiKet;
  final String matkulNamaDosen;
  final String matkulNamaDosen2;

  PresensiModel({
    this.matkulNama,
    this.matkulSks,
    this.presensiTgl,
    this.presensiKet,
    this.matkulNamaDosen,
    this.matkulNamaDosen2,
  });

  factory PresensiModel.fromJson(Map<String, dynamic> object) {
    return PresensiModel(
      matkulNama: object["matkul_nama"],
      matkulSks: object["matkul_sks"],
      presensiTgl: object["presensi_tgl"],
      presensiKet: object["presensi_ket"],
      matkulNamaDosen: object["matkul_namadosen"],
      matkulNamaDosen2: object["matkul_namadosen2"],
    );
  }
}
