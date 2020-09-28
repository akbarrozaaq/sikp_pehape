import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pehape_sikp/Screens/screens.dart';
import 'package:pehape_sikp/components/components.dart';
import 'package:pehape_sikp/constants.dart';
import 'package:pehape_sikp/model/mahasiswa_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileUser extends StatefulWidget {
  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  MahasiswaModel mahasiswaModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => MahasiswaModel.connectToAPI(Get.arguments).then((value) {
              mahasiswaModel = value;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kGreenLightColor,
        body: (mahasiswaModel != null)
            ? Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: size.height * 0.2,
                            decoration: BoxDecoration(
                              color: kGreenColor,
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image:
                                    AssetImage('assets/images/bg_profil.png'),
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
                                    mahasiswaModel.parentNama,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  mahasiswaModel.parentEmail,
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
                            color: kGreenLightColor,
                            width: 5.0,
                          ),
                        ),
                        child: Text(
                          "Z",
                          style: TextStyle(
                              fontSize: 30,
                              color: kGreenColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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
                            border: Border.all(color: kGreenColor, width: 2.0)),
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text("Nama : " + mahasiswaModel.nama),
                            Text("NPM : " + mahasiswaModel.npm),
                            Text("Jenis Kelamin : " + "Laki-laki"),
                            Text("Tanggal Lahir : " + "11 - 12 - 1999"),
                            Text("Prodi : " + mahasiswaModel.prodi),
                            Text("Jurusan :" + mahasiswaModel.jurusan),
                            Text("Fakultas : " + mahasiswaModel.fakultas),
                          ],
                        ),
                      ),
                      Positioned(
                        top: size.height * -0.015,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: kGreenColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Identitas Mahasiswa",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
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
                                  image:
                                      AssetImage('assets/images/pas foto.jpg'),
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
                      color: kRedLightColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: kRedColor,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50)),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      onPressed: () async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.remove('value');
                        Get.off(LoginScreen());
                      },
                      child: Text(
                        "Log out",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: kRedColor,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : LoadingCrab());
  }
}
