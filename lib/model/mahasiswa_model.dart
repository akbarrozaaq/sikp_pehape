import 'dart:convert';
import 'package:pehape_sikp/service/base_url.dart';
import 'package:http/http.dart' as http;

class MahasiswaModel {
  final String parentNama;
  final String parentEmail;
  final String nama;
  final String npm;
  final String jenkel;
  final String tglLhr;
  final String prodi;
  final String fakultas;
  final String jurusan;

  MahasiswaModel(
      {this.parentNama,
      this.parentEmail,
      this.nama,
      this.npm,
      this.jenkel,
      this.tglLhr,
      this.prodi,
      this.fakultas,
      this.jurusan});

  factory MahasiswaModel.fromJson(Map<String, dynamic> object) {
    return MahasiswaModel(
      parentNama: object["parent_nama"],
      parentEmail: object["parent_email"],
      nama: object["mhs_nama"],
      npm: object["mhs_nim"],
      jenkel: object["mhs_jenkel"],
      tglLhr: object["mhs_tgllhr"],
      prodi: object["prodi_nama"],
      fakultas: object["fkt_nama"],
      jurusan: object["jurusan_nama"],
    );
  }

  static Future<MahasiswaModel> connectToAPI(String parentNimMhs) async {
    var apiResult = await http
        .post(BaseUrl.dataMahasiswaURl, body: {"parent_nimmhs": parentNimMhs});
    var jsonObject = jsonDecode(apiResult.body);

    return MahasiswaModel.fromJson(jsonObject);
  }
}
