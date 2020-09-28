import 'package:flutter/material.dart';

class ListKhs extends StatelessWidget {
  final String namaMatkul;
  final String sksMatkul;
  final String nilaiMatkul;

  const ListKhs({Key key, this.namaMatkul, this.sksMatkul, this.nilaiMatkul})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.6,
            child: Text(
              namaMatkul,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          SizedBox(
            width: size.width * 0.025,
          ),
          SizedBox(
            width: size.width * 0.075,
            child: Text(
              sksMatkul,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          SizedBox(
            width: size.width * 0.025,
          ),
          SizedBox(
            width: size.width * 0.075,
            child: Text(
              nilaiMatkul,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
