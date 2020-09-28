import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Color textColor;
  CustomAppBar(this.title, this.textColor);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: textColor,
      elevation: 5.0,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      leading: Icon(
        FontAwesomeIcons.userGraduate,
        size: 28,
        color: Colors.white,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
