import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SizeText extends StatelessWidget {
  final String nilaiangka;
  final String nilaihuruf;

  const SizeText({Key key, this.nilaiangka, this.nilaihuruf}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
          text: nilaihuruf,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            TextSpan(
                text: " : " + nilaiangka,
                style: TextStyle(fontWeight: FontWeight.normal))
          ]),
      minFontSize: 10,
      maxLines: 1,
    );
  }
}
