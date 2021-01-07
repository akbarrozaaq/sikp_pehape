class KhsRumusModel {
  final String rataNilai;
  final String jumlahSks;
  final String jumlahMatkul;

  KhsRumusModel({
    this.rataNilai,
    this.jumlahSks,
    this.jumlahMatkul,
  });

  factory KhsRumusModel.fromJson(Map<String, dynamic> object) {
    return KhsRumusModel(
      rataNilai: object["rata_nilai"],
      jumlahSks: object["jumlah_sks"],
      jumlahMatkul: object["jumlah_matkul"],
    );
  }
}
