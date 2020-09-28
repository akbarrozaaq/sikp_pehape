import 'package:flutter/material.dart';
import 'package:pehape_sikp/components/components.dart';
import '../constants.dart';

class Presensi extends StatefulWidget {
  @override
  _PresensiState createState() => _PresensiState();
}

class _PresensiState extends State<Presensi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kYellowLightColor,
      body: ListView(
        children: [
          CardPresensi(
            namaMatkul: "Sistem Pendukung Keputusan",
            sksMatkul: 3.toString(),
            tglMatkul: "04-08-2020",
            ketMatkul: "Hadir",
            dosenMatkul: "Mochammad Yusa S.Kom., M.Kom",
          ),
          CardPresensi(
            namaMatkul: "Natural Language Processing",
            sksMatkul: 3.toString(),
            tglMatkul: "04-08-2020",
            ketMatkul: "Hadir",
            dosenMatkul: "Mochammad Yusa S.Kom., M.Kom",
          ),
          CardPresensi(
            namaMatkul: "Wereless/Mobile Computing",
            sksMatkul: 3.toString(),
            tglMatkul: "04-08-2020",
            ketMatkul: "Hadir",
            dosenMatkul: "Mochammad Yusa S.Kom., M.Kom",
          ),
          CardPresensi(
            namaMatkul: "Fuzzy Logic",
            sksMatkul: 3.toString(),
            tglMatkul: "04-08-2020",
            ketMatkul: "Hadir",
            dosenMatkul: "Mochammad Yusa S.Kom., M.Kom",
          ),
          CardPresensi(
            namaMatkul: "Data Mining",
            sksMatkul: 3.toString(),
            tglMatkul: "04-08-2020",
            ketMatkul: "Hadir",
            dosenMatkul: "Mochammad Yusa S.Kom., M.Kom",
          ),
          CardPresensi(
            namaMatkul: "Sistem Terdistribusi",
            sksMatkul: 3.toString(),
            tglMatkul: "04-08-2020",
            ketMatkul: "Hadir",
            dosenMatkul: "Mochammad Yusa S.Kom., M.Kom",
          ),
          SizedBox(
            height: 32.0,
          )
        ],
      ),
      // body: Column(
      //   children: [
      //     SizedBox(
      //       height: 16.0,
      //     ),
      //     Center(
      //       child: Container(
      //         width: size.width * 0.9,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(29),
      //           color: kYellowColor,
      //         ),
      //         child: ExpansionCard(
      //           trailing: Icon(
      //             Icons.keyboard_arrow_down,
      //             color: Colors.black,
      //           ),
      //           margin: EdgeInsets.all(10.0),
      //           borderRadius: 10.0,
      //           title: Container(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: <Widget>[
      //                 Text(
      //                   "Sistem Pendukung Keputusan",
      //                   style: TextStyle(
      //                       fontSize: 20.0,
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.w600),
      //                 ),
      //                 SizedBox(
      //                   height: 16.0,
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text(
      //                       "3 Sks",
      //                       style: TextStyle(fontSize: 16, color: Colors.black),
      //                     ),
      //                     Text(
      //                       "04-08-2020",
      //                       style: TextStyle(fontSize: 16, color: Colors.black),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //           children: <Widget>[
      //             Divider(
      //               color: Colors.black,
      //               height: 1.5,
      //             ),
      //             Container(
      //               child: Column(
      //                 children: [
      //                   SizedBox(
      //                     height: 10.0,
      //                   ),
      //                   Text(
      //                     "Keterangan Mahasiswa : Hadir",
      //                     style: TextStyle(fontSize: 16, color: Colors.black),
      //                   ),
      //                   // Text(
      //                   //   "Hadir",
      //                   //   style: TextStyle(fontSize: 16, color: Colors.black),
      //                   // ),
      //                   SizedBox(
      //                     height: 10.0,
      //                   ),
      //                   Text(
      //                     "Dosen Pengampu:",
      //                     style: TextStyle(fontSize: 16, color: Colors.black),
      //                   ),
      //                   Text(
      //                     "Mochammad Yusa S.Kom., M.Kom",
      //                     style: TextStyle(fontSize: 16, color: Colors.black),
      //                   ),
      //                   Padding(
      //                     padding: EdgeInsets.only(bottom: 10.0),
      //                   ),
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
