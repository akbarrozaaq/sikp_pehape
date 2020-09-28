import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingCrab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/loading_crab.json',
              height: size.height * 0.6,
              width: size.width * 0.6,
            ),
            Text(
              "Please wait...",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
