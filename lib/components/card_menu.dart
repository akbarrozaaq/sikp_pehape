import 'package:flutter/material.dart';
import 'package:pehape_sikp/constants.dart';

class CardMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color cardColor;

  const CardMenu(
      {Key key, this.icon, this.text, this.iconColor, this.cardColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shadowColor: kPrimaryLightColor,
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Container(
        height: size.width * 0.35,
        width: size.width * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              icon,
              size: 75,
              color: iconColor,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
