class TranskripRumusModel {
  final String jmlhMatkul;
  final String jmlhSks;
  final String ipk;

  TranskripRumusModel({
    this.jmlhMatkul,
    this.jmlhSks,
    this.ipk,
  });

  factory TranskripRumusModel.fromJson(Map<String, dynamic> object) {
    return TranskripRumusModel(
      jmlhMatkul: object["jmlh_matkul"],
      jmlhSks: object["jmlh_sks"],
      ipk: object["ipk"],
    );
  }
}
