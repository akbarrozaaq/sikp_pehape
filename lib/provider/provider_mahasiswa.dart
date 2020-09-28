import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:pehape_sikp/model/mahasiswa_model.dart';
import 'package:http/http.dart' as http;
import 'package:pehape_sikp/service/base_url.dart';

class ProviderMahasiswa extends ChangeNotifier {
  MahasiswaModel _mahasiswaModel;
  MahasiswaModel get mahasiswaBiodata => _mahasiswaModel;

  set mahasiswaBiodata(MahasiswaModel val) {
    _mahasiswaModel = val;
    notifyListeners();
  }

  Future<MahasiswaModel> getMahasiswa() async {}
}
