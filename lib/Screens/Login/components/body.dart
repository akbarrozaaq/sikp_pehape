// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:pehape_sikp/Screens/Login/components/background.dart';
// import 'package:pehape_sikp/Screens/screens.dart';
// import 'package:pehape_sikp/components/components.dart';

// String email, password;

// class Body extends StatelessWidget {
//   const Body({
//     Key key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Background(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               "LOGIN",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: size.height * 0.03),
//             SvgPicture.asset(
//               "assets/icons/login.svg",
//               height: size.height * 0.35,
//             ),
//             SizedBox(height: size.height * 0.03),
//             RoundedInputField(
//               icon: Icons.email,
//               onSaved: (e) => email = e,
//               hintText: "Your Email",
//               onChanged: (value) {},
//             ),
//             RoundedPasswordField(
//               obsecureText: true,
//               onSaved: (e) => password = e,
//               onChanged: (value) {},
//             ),
//             RoundedButton(
//               text: "LOGIN",
//               press: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return BottomNavScreen();
//                     },
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: size.height * 0.03),
//             AlreadyHaveAnAccountCheck(
//               press: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return SignUpScreen();
//                     },
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
