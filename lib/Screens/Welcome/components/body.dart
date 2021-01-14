import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:pehape_sikp/Screens/screens.dart';
import 'package:pehape_sikp/Screens/Welcome/components/background.dart';
import 'package:pehape_sikp/components/components.dart';
import 'package:pehape_sikp/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to SI PHP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "(Pemantauan Hasil Pembelajaran)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/welcome.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Get.to(LoginScreen());
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Get.to(SignUpScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
