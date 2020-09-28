import 'package:flutter/material.dart';
import 'package:pehape_sikp/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pehape_sikp/components/components.dart';

class MenuDashboard extends StatefulWidget {
  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                      border: Border.all(color: kPrimaryColor, width: 2.0)),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("Nama : " + "Akbar Rozaaq Arda"),
                      Text("NPM : " + "G1A017036"),
                      Text("Jenis Kelamin : " + "Laki-laki"),
                      Text("Tanggal Lahir : " + "11 - 12 - 1999"),
                      Text("Prodi : " + "Informatika"),
                      Text("Fakultas : " + "Teknik"),
                    ],
                  ),
                ),
                Positioned(
                  top: size.height * -0.015,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
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
            SizedBox(
              height: size.height * 0.03,
            ),
            CardMenu(
              icon: FontAwesomeIcons.fingerprint,
              text: "Presensi",
              iconColor: kYellowColor,
              cardColor: kYellowLightColor,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CardMenu(
                  icon: FontAwesomeIcons.solidClipboard,
                  text: "Kartu Hasil Studi",
                  iconColor: kBlueColor,
                  cardColor: kBlueLightColor,
                ),
                CardMenu(
                  icon: FontAwesomeIcons.book,
                  text: "Transkrip Nilai",
                  iconColor: kRedColor,
                  cardColor: kRedLightColor,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
