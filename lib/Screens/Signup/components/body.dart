// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:pehape_sikp/Screens/Login/login_screen.dart';
// import 'package:pehape_sikp/Screens/Signup/components/background.dart';
// import 'package:pehape_sikp/Screens/Signup/components/or_divider.dart';
// import 'package:pehape_sikp/components/already_have_an_account_acheck.dart';
// import 'package:pehape_sikp/components/components.dart';

// class Body extends StatelessWidget {
//   String email, password, name, npm, tglLhr;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Background(
//       child: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 16.0,
//               ),
//               Text(
//                 "SIGNUP",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: size.height * 0.03),
//               SvgPicture.asset(
//                 "assets/icons/signup.svg",
//                 height: size.height * 0.35,
//               ),
//               OrDivider(
//                 text: "Identitas Orang Tua",
//               ),
//               RoundedInputField(
//                 icon: Icons.email,
//                 hintText: "Your Email",
//                 onChanged: (value) {},
//                 onSaved: (e) => email = e,
//               ),
//               RoundedPasswordField(
//                 obsecureText: true,
//                 onChanged: (value) {},
//               ),
//               RoundedInputField(
//                 icon: Icons.person,
//                 hintText: "Your Name",
//                 onChanged: (value) {},
//               ),
//               OrDivider(
//                 text: "Identitas Mahasiswa",
//               ),
//               RoundedInputField(
//                 icon: Icons.school,
//                 hintText: "NPM Mahasiswa",
//                 onChanged: (value) {},
//               ),
//               RoundedInputField(
//                 icon: Icons.event_note,
//                 hintText: "Tanggal Lahir Mahasiswa",
//                 onChanged: (value) {},
//               ),
//               RoundedButton(
//                 text: "SIGNUP",
//                 press: () {},
//               ),
//               SizedBox(height: size.height * 0.03),
//               AlreadyHaveAnAccountCheck(
//                 login: false,
//                 press: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return LoginScreen();
//                       },
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: size.height * 0.03),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
