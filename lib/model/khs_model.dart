class KhsModel {
  final String semester;
  final String matkulNama;
  final String matkulSks;
  final String nilaiAngka;
  final String nilaiHuruf;

  KhsModel({
    this.semester,
    this.matkulNama,
    this.matkulSks,
    this.nilaiAngka,
    this.nilaiHuruf,
  });

  factory KhsModel.fromJson(Map<String, dynamic> object) {
    return KhsModel(
      semester: object["krs_semid"],
      matkulNama: object["matkul_nama"],
      matkulSks: object["matkul_sks"],
      nilaiAngka: object["nilai_angka"],
      nilaiHuruf: object["nilai_huruf"],
    );
  }
}
