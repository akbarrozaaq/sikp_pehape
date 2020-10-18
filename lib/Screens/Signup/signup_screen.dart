import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pehape_sikp/Screens/screens.dart';
import 'package:pehape_sikp/components/components.dart';
import 'package:pehape_sikp/Screens/Signup/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pehape_sikp/Screens/Login/login_screen.dart';
import 'package:pehape_sikp/Screens/Signup/components/or_divider.dart';
import 'package:pehape_sikp/constants.dart';
import 'package:pehape_sikp/service/services.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String nama, email, password, mhsnpm, mhstgllhr;
  final _key = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save(); //bikin counterflow disini disini
      signUp();
    }
  }

  signUp() async {
    if (nama.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "-",
        "-",
        backgroundColor: kRedColor,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        titleText: Text(
          "Error",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        messageText: Text(
          "Data identitas orang tua tidak boleh kosong. Silahkan coba lagi",
          style: TextStyle(fontSize: 16),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      );
    }
    // else if (email.contains("@") && !(email.contains(regex)))

    else if (!(email.contains("@"))) {
      Get.snackbar(
        "-",
        "-",
        backgroundColor: kRedColor,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        titleText: Text(
          "Error",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        messageText: Text(
          "Format email salah. Silahkan coba lagi",
          style: TextStyle(fontSize: 16),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      );
    } else if (mhsnpm.isEmpty || mhstgllhr.isEmpty) {
      Get.snackbar(
        "-",
        "-",
        backgroundColor: kRedColor,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        titleText: Text(
          "Error",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        messageText: Text(
          "Data identitas mahasiswa tidak boleh kosong. Silahkan coba lagi",
          style: TextStyle(fontSize: 16),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      );
    } else {
      final response = await http.post(BaseUrl.registerURL, body: {
        "parent_email": email,
        "parent_password": password,
        "parent_nama": nama,
        "parent_nimmhs": mhsnpm,
        "mhs_tgllhr": mhstgllhr
      });
      final data = jsonDecode(response.body);
      int value = data['value'];
      String pesan = data['message'];
      if (value == 1) {
        // _showDialog("Berhasil", "Pendaftaran Sukses", () {
        //   Get.off(LoginScreen());
        // });
        print(pesan);
      } else if (value == 2) {
        Get.snackbar(
          "-",
          "-",
          backgroundColor: kRedColor,
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.TOP,
          titleText: Text(
            "Error",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: Text(
            "Email telah digunakan. Silahkan coba lagi",
            style: TextStyle(fontSize: 16),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        );
        print(pesan);
      } else {
        Get.snackbar(
          "-",
          "-",
          backgroundColor: kRedColor,
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.TOP,
          titleText: Text(
            "Error",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: Text(
            "NPM dan Tanggal lahir mahasiswa salah. Silahkan coba lagi",
            style: TextStyle(fontSize: 16),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        );
        print(pesan);
      }
    }
  }

  DateTime tgl = new DateTime.now();
  final TextStyle valueStyle = TextStyle(fontSize: 16.0);
  Future<Null> _selectedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: tgl,
      firstDate: DateTime(1980),
      lastDate: DateTime(2080),
    );
    if (picked != null && picked != tgl) {
      setState(() {
        tgl = picked;
        mhstgllhr = new DateFormat('dd-MM-yyyy').format(tgl);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: Background(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.06),
                  Text(
                    "SIGNUP",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/sign_up.svg",
                    height: size.height * 0.35,
                  ),
                  OrDivider(
                    text: "Identitas Orang Tua",
                  ),
                  RoundedInputField(
                    icon: Icons.person,
                    onSaved: (e) => nama = e,
                    hintText: "Your Name",
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    icon: Icons.email,
                    onSaved: (e) => email = e,
                    hintText: "Your Email",
                    onChanged: (value) {},
                  ),
                  RoundedPasswordField(
                    obsecureText: _secureText,
                    showPass: showHide,
                    colorIcon: _secureText ? kPrimaryColor : Colors.grey,
                    onSaved: (e) => password = e,
                    onChanged: (value) {},
                  ),
                  OrDivider(
                    text: "Identitas Mahasiswa",
                  ),
                  RoundedInputField(
                    icon: Icons.school,
                    onSaved: (e) => mhsnpm = e,
                    hintText: "NPM Mahasiswa",
                    onChanged: (value) {},
                  ),
                  // DateDropDown(
                  //   // valueText: tgl.toString(), //format tanggal lengkap
                  //   valueText: new DateFormat('dd-MM-yyyy')
                  //       .format(tgl), // format tanggal biasa
                  //   valueStyle: valueStyle,
                  //   onPressed: () {
                  //     _selectedDate(context);
                  //   },
                  // ),
                  RoundedInputField(
                    icon: Icons.event_note,
                    onSaved: (e) => mhstgllhr = e,
                    hintText: "Tanggal Lahir Mahasiswa",
                    onChanged: (value) {},
                  ),
                  RoundedButton(
                    text: "SIGNUP",
                    press: () {
                      check();
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Get.off(LoginScreen());
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
