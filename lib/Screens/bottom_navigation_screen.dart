import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pehape_sikp/components/components.dart';
import 'package:pehape_sikp/constants.dart';
import 'screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screen = [
    Presensi(),
    KartuHasilStudi(),
    MenuDashboard(),
    TranskripNilai(),
    ProfileUser(),
  ];

  final List _title = [
    "Presensi",
    "Kartu Hasil Studi",
    "Dashboard",
    "Transkrip Nilai",
    "Profil"
  ];

  final List _colorLight = [
    kYellowLightColor,
    kBlueLightColor,
    kPrimaryLightColor,
    kRedLightColor,
    kGreenLightColor
  ];

  final List _colorPrimary = [
    kYellowColor,
    kBlueColor,
    kPrimaryColor,
    kRedColor,
    kGreenColor
  ];

  int currentindex = 2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(_title[currentindex], _colorPrimary[currentindex]),
      body: Stack(
        children: [
          _screen[currentindex],
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height * 0.025,
              width: size.width,
              color: _colorLight[currentindex],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: _colorLight[currentindex],
        buttonBackgroundColor: Colors.white,
        height: 55,
        items: <Widget>[
          Icon(
            FontAwesomeIcons.fingerprint,
            size: 20,
            color: kYellowColor,
          ),
          Icon(
            FontAwesomeIcons.solidClipboard,
            size: 20,
            color: kBlueColor,
          ),
          Icon(
            Icons.dashboard,
            size: 20,
            color: kPrimaryColor,
          ),
          Icon(
            FontAwesomeIcons.book,
            size: 20,
            color: kRedColor,
          ),
          Icon(
            FontAwesomeIcons.solidUser,
            size: 20,
            color: Colors.green[300],
          ),
        ],
        onTap: (index) => setState(() => currentindex = index),
        animationDuration: Duration(
          milliseconds: 200,
        ),
        animationCurve: Curves.bounceInOut,
        index: 2,
      ),
    );
  }
}
