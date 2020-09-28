import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pehape_sikp/Screens/presensi.dart';
import 'package:pehape_sikp/Screens/screens.dart';
import 'package:pehape_sikp/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String mhsNama = "", parentNama = "", parentNimMhs = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      mhsNama = preferences.getString("mhs_nama");
      parentNama = preferences.getString("parent_nama");
      parentNimMhs = preferences.getString("parent_nimmhs");
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        // fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: SvgPicture.asset(
                "assets/icons/home.svg",
                height: size.height * 0.4,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: kBlueColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: Text("Nama Wali"),
                                ),
                                Text(
                                  "$parentNama",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: kGreenColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: Text("Nama Mahasiswa"),
                                ),
                                Text(
                                  "$mhsNama",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.16,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: kPrimaryColor, width: 2),
                      // borderRadius: BorderRadius.only(
                      //   bottomLeft: Radius.circular(90),
                      //   bottomRight: Radius.circular(90),
                      // ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 90,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image: AssetImage('assets/images/Logo.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(16),
                  //   child: Text(
                  //     "Sistem Informasi\nPemantauan Hasil Pembelajaran (PHP)\nUNIB",
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),

                  // Container(
                  //   height: 64,
                  //   margin: EdgeInsets.only(bottom: 20),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       CircleAvatar(
                  //         radius: 32,
                  //         backgroundImage: NetworkImage(
                  //             'https://i.pinimg.com/originals/78/07/03/78070395106fcd1c3e66e3b3810568bb.jpg'),
                  //       ),
                  //       SizedBox(
                  //         width: 16,
                  //       ),
                  //       Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: <Widget>[
                  //           Text(
                  //             'Zainal Arifin',
                  //             style: TextStyle(
                  //                 // fontFamily: "Montserrat Medium",
                  //                 color: Colors.black,
                  //                 fontSize: 20),
                  //           ),
                  //           Text(
                  //             'Zainal@gmail.com',
                  //             style: TextStyle(
                  //               fontSize: 14,
                  //               color: Colors.black,
                  //               // fontFamily: "Montserrat Regular",
                  //             ),
                  //           )
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Get.to(Presensi()),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/icons/icon_presensi.svg',
                                  height: 120,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Presensi',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(KartuHasilStudi()),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/icons/icon_khs.svg',
                                  height: 120,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Kartu Hasil Studi',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(TranskripNilai()),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/icons/icon_transkrip_nilai.svg',
                                  height: 120,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Transkrip Nilai',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(ProfileUser(), arguments: parentNimMhs);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/icons/icon_profil.svg',
                                  height: 120,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Personal Data',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              child: FlatButton(
                color: kRedLightColor,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: kRedColor, width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
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
          ),
        ],
      ),
    );
  }
}
