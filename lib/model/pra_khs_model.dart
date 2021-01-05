class PraKhsModel {
  final String semester;
  final String ips;

  PraKhsModel({
    this.semester,
    this.ips,
  });

  factory PraKhsModel.fromJson(Map<String, dynamic> object) {
    return PraKhsModel(
      semester: object["krs_semid"],
      ips: object["ips"],
    );
  }
}
