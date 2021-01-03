import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pehape_sikp/Screens/screens.dart';
import 'package:pehape_sikp/components/components.dart';
import 'package:pehape_sikp/constants.dart';
import 'package:pehape_sikp/model/mahasiswa_model.dart';
import 'package:pehape_sikp/service/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PersonalData extends StatefulWidget {
  @override
  _PersonalDataState createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  PersonalDataModel personalDataModel;
  var loading = false;
  Future<PersonalDataModel> getMahasiswa() async {
    setState(() {
      loading = true;
    });
    final response = await http.get(BaseUrl.dataMahasiswaURl + Get.arguments);
    personalDataModel = PersonalDataModel.fromJson(jsonDecode(response.body));
    setState(() {
      loading = false;
    });
    return personalDataModel;
  }

  // _fetchDataMahasiswa() async {
  //   final response = await http.get(BaseUrl.dataMahasiswaURl + Get.arguments);
  //   final data = jsonDecode(response.body);
  //   print(data);
  // }

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback(
    //     (_) => PersonalDataModel.connectToAPI(Get.arguments).then((value) {
    //           PersonalDataModel = value;
    //         }));
    // _fetchDataMahasiswa();
    getMahasiswa();
    super.initState();
  }

  _jeniskelamin(String data) {
    if (data == "L") {
      return "Laki-laki";
    } else {
      return "Perempuan";
    }
  }

  _convertFormatDateFromString(String data) {
    DateTime datetime = DateTime.parse(data);
    data = new DateFormat('dd-MM-yyyy').format(datetime);
    return data;
  }

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('value');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kRedLightColor,
      appBar: CustomAppBar("Personal Data", kRedColor, Colors.white),
      body: loading
          ? LoadingCrab()
          : Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                            color: kRedColor,
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image:
                                  AssetImage('assets/images/rektorat_unib.jpg'),
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.2,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(90),
                              bottomRight: Radius.circular(90),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.06,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  personalDataModel.parentNama.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                personalDataModel.parentEmail,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kRedLightColor,
                          width: 5.0,
                        ),
                      ),
                      child: Text(
                        "${personalDataModel.parentNama[0].toUpperCase()}",
                        style: TextStyle(
                            fontSize: 30,
                            color: kRedColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/logo_unib.png"))),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: size.height * 0.3,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: kRedColor, width: 2.0)),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text("Nama : " + personalDataModel.nama),
                          Text("NPM : " + personalDataModel.npm),
                          Text("Jenis Kelamin : " +
                              _jeniskelamin(personalDataModel.jenkel)),
                          Text(
                            "Tanggal Lahir : " +
                                _convertFormatDateFromString(
                                        personalDataModel.tglLhr)
                                    .toString(),
                          ),
                          Text("Prodi : " + personalDataModel.prodi),
                          Text("Fakultas : " + personalDataModel.fakultas),
                          if (personalDataModel.jurusan != null)
                            Text("Jurusan : " + personalDataModel.jurusan),
                        ],
                      ),
                    ),
                    Positioned(
                      top: size.height * -0.015,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: kRedColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Identitas Mahasiswa",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      child: Container(
                        height: size.height * 0.25,
                        width: size.width * 0.30,
                        child: Center(
                          child: Container(
                            height: size.height * 0.20,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/pas foto.jpg'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: FlatButton(
                    color: kRedColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: kRedColor,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    onPressed: () {
                      logOut();
                      Get.offAll(LoginScreen());
                    },
                    child: Text(
                      "Log out",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
