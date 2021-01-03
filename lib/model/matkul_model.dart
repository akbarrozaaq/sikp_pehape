class PresensiModel {
  final String matkulId;
  final String matkulNama;
  final String matkulSks;
  final String matkulNamaDosen;
  final String matkulNamaDosen2;

  PresensiModel({
    this.matkulId,
    this.matkulNama,
    this.matkulSks,
    this.matkulNamaDosen,
    this.matkulNamaDosen2,
  });

  factory PresensiModel.fromJson(Map<String, dynamic> object) {
    return PresensiModel(
      matkulId: object["matkul_id"],
      matkulNama: object["matkul_nama"],
      matkulSks: object["matkul_sks"],
      matkulNamaDosen: object["matkul_namadosen"],
      matkulNamaDosen2: object["matkul_namadosen"],
    );
  }
}
