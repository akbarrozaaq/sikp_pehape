import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pehape_sikp/Screens/screens.dart';
import 'package:pehape_sikp/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum LoginStatus { notSignIn, signIn }

class _MyAppState extends State<MyApp> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      var value = preferences.getInt("value");
      print(value);
      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      // preferences.setString("level", null);
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  // Future<void> main() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var value = preferences.getInt("value");
  //   print("value " + value.toString());

  //   runApp(MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       title: 'PeHaPe_SI-KP',
  //       theme: ThemeData(
  //         primaryColor: kPrimaryColor,
  //         scaffoldBackgroundColor: Colors.white,
  //       ),
  //       home: value == 1 ? BottomNavScreen() : WelcomeScreen()));
  // }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PeHaPe_SI-KP',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: WelcomeScreen(),
        );
        break;
      case LoginStatus.signIn:
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PeHaPe_SI-KP',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: Home(),
        );
        break;
    }
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'PeHaPe_SI-KP',
    //   theme: ThemeData(
    //     primaryColor: kPrimaryColor,
    //     scaffoldBackgroundColor: Colors.white,
    //   ),
    //   home: WelcomeScreen(),
    // );
  }
}
