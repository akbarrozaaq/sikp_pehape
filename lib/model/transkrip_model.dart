class TranskripModel {
  final String semester;
  final String matkulNama;
  final String matkulSks;
  final String nilaiAngka;
  final String nilaiHuruf;

  TranskripModel({
    this.semester,
    this.matkulNama,
    this.matkulSks,
    this.nilaiAngka,
    this.nilaiHuruf,
  });

  factory TranskripModel.fromJson(Map<String, dynamic> object) {
    return TranskripModel(
      semester: object["krs_semid"],
      matkulNama: object["matkul_nama"],
      matkulSks: object["matkul_sks"],
      nilaiAngka: object["nilai_angka"],
      nilaiHuruf: object["nilai_huruf"],
    );
  }
}
