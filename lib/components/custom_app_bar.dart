import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Color bgColor;
  final Color textColor;
  CustomAppBar(this.title, this.bgColor, this.textColor);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      iconTheme: IconThemeData(color: textColor),
      elevation: 5.0,
      automaticallyImplyLeading: true,
      title: Text(
        title,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
