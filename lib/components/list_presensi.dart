import 'package:flutter/material.dart';

class ListPresensi extends StatelessWidget {
  final String tanggalMatkul;
  final String keteranganMatkul;

  const ListPresensi({Key key, this.tanggalMatkul, this.keteranganMatkul})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: size.width * 0.35,
            child: Text(
              tanggalMatkul,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          SizedBox(
            width: size.width * 0.35,
            child: Text(
              keteranganMatkul,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
