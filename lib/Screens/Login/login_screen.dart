import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pehape_sikp/Screens/Login/components/background.dart';
import 'package:pehape_sikp/Screens/screens.dart';
import 'package:pehape_sikp/components/components.dart';
import 'package:pehape_sikp/constants.dart';
import 'package:pehape_sikp/service/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
      login();
    }
  }

  login() async {
    // Get.defaultDialog(title: "", middleText: "", actions: [
    //   LoadingCrab(),
    // ]);
    if (email.isEmpty && password.isEmpty) {
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
          "Email atau Password tidak boleh kosong",
          style: TextStyle(fontSize: 16),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      );
    } else if (email.contains("@")) {
      final response = await http.post(BaseUrl.loginURL,
          body: {"parent_email": email, "parent_password": password});
      final data = jsonDecode(response.body);
      int value = data['value'];
      String parentNamaAPI = data['parent_nama'];
      String mhsNamaAPI = data['mhs_nama'];
      String parentNimMhsAPI = data['parent_nimmhs'];
      String pesan = data['message'];
      if (value == 1) {
        Get.offAll(HomeScreen());
        setState(() {
          savePref(value, parentNamaAPI, mhsNamaAPI, parentNimMhsAPI);
        });
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
            "Email salah atau tidak terdaftar. Silahkan coba lagi",
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
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          messageText: Text(
            "Password salah. Silahkan coba lagi",
            style: TextStyle(fontSize: 16),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        );
        print(pesan);
      }
    } else {
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
    }
  }

  savePref(
      int value, String parentNama, String mhsNama, String parentNimMhs) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("parent_nama", parentNama);
      preferences.setString("mhs_nama", mhsNama);
      preferences.setString("parent_nimmhs", parentNimMhs);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  icon: Icons.email,
                  onSaved: (e) => email = e,
                  controller: emailController,
                  hintText: "Your Email",
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  obsecureText: _secureText,
                  showPass: showHide,
                  colorIcon: _secureText ? kPrimaryColor : Colors.grey,
                  onSaved: (e) => password = e,
                  controller: passwordController,
                  onChanged: (value) {},
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () {
                    check();
                    // Get.offAll(BottomNavScreen());
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Get.off(SignUpScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
