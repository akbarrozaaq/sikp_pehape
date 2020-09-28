import 'package:flutter/material.dart';
import 'package:pehape_sikp/components/components.dart';
import 'package:pehape_sikp/constants.dart';
import 'package:expansion_card/expansion_card.dart';

class KartuHasilStudi extends StatefulWidget {
  @override
  _KartuHasilStudiState createState() => _KartuHasilStudiState();
}

class _KartuHasilStudiState extends State<KartuHasilStudi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueLightColor,
      body: ListView(
        children: [
          CardKhs(
            namaSemester: "Ganjil 2017/2018",
            sksSemester: 19.toString(),
          ),
          CardKhs(
            namaSemester: "Genap 2017/2018",
            sksSemester: 20.toString(),
          ),
          CardKhs(
            namaSemester: "Ganjil 2018/2019",
            sksSemester: 24.toString(),
          ),
          CardKhs(
            namaSemester: "Genap 2018/2019",
            sksSemester: 24.toString(),
          ),
          CardKhs(
            namaSemester: "Ganjil 2019/2020",
            sksSemester: 22.toString(),
          ),
          CardKhs(
            namaSemester: "Genap 2019/2020",
            sksSemester: 20.toString(),
          ),
          SizedBox(
            height: 32.0,
          )
          // SizedBox(
          //   height: 16.0,
          // ),
          // Center(
          //   child: Container(
          //     width: size.width * 0.9,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(29),
          //       color: kBlueColor,
          //     ),
          //     child: ExpansionCard(
          //       trailing: Icon(
          //         Icons.keyboard_arrow_down,
          //         color: Colors.black,
          //       ),
          //       margin: EdgeInsets.all(size.width * 0.025),
          //       borderRadius: 10.0,
          //       title: Container(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: <Widget>[
          //             Text(
          //               "Ganjil 2017/2018",
          //               style: TextStyle(
          //                   fontSize: 20.0,
          //                   color: Colors.black,
          //                   fontWeight: FontWeight.w600),
          //             ),
          //             SizedBox(
          //               height: 16.0,
          //             ),
          //             Text(
          //               "19 Sks",
          //               style: TextStyle(fontSize: 16, color: Colors.black),
          //             ),
          //           ],
          //         ),
          //       ),
          //       children: <Widget>[
          //         Container(
          //           margin: EdgeInsets.all(10),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Divider(
          //                 color: Colors.black,
          //                 height: 1.5,
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Row(
          //                   children: [
          //                     SizedBox(
          //                       width: size.width * 0.6,
          //                       child: Text(
          //                         "Mata Kuliah",
          //                         style: TextStyle(
          //                             fontSize: 16, color: Colors.black),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       width: size.width * 0.1,
          //                       child: Text(
          //                         "SKS",
          //                         style: TextStyle(
          //                             fontSize: 16, color: Colors.black),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       width: size.width * 0.1,
          //                       child: Text(
          //                         "Nilai",
          //                         style: TextStyle(
          //                             fontSize: 16, color: Colors.black),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Divider(
          //                 color: Colors.black,
          //                 height: 1.5,
          //               ),
          //               Padding(padding: EdgeInsets.only(top: 8.0)),
          //               Padding(
          //                 padding:
          //                     const EdgeInsets.only(left: 8.0, bottom: 4.0),
          //                 child: Row(
          //                   children: [
          //                     SizedBox(
          //                       width: size.width * 0.6,
          //                       child: Text(
          //                         "Pengantar Pemrograman dan Rekayasa Perangkat Lunak",
          //                         style: TextStyle(
          //                             fontSize: 16, color: Colors.black),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       width: size.width * 0.025,
          //                     ),
          //                     SizedBox(
          //                       width: size.width * 0.075,
          //                       child: Text(
          //                         "4",
          //                         style: TextStyle(
          //                             fontSize: 16, color: Colors.black),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       width: size.width * 0.025,
          //                     ),
          //                     SizedBox(
          //                       width: size.width * 0.075,
          //                       child: Text(
          //                         "A",
          //                         style: TextStyle(
          //                             fontSize: 16, color: Colors.black),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Padding(
          //                 padding:
          //                     const EdgeInsets.only(left: 8.0, bottom: 4.0),
          //                 child: Row(
          //                   children: [
          //                     SizedBox(
          //                       width: size.width * 0.6,
          //                       child: Text(
          //                         "Lingkungan Komputasi",
          //                         style: TextStyle(
          //                             fontSize: 16, color: Colors.black),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       width: size.width * 0.025,
          //                     ),
          //                     SizedBox(
          //                       width: size.width * 0.075,
          //                       child: Text(
          //                         "3",
          //                         style: TextStyle(
          //                             fontSize: 16, color: Colors.black),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       width: size.width * 0.025,
          //                     ),
          //                     SizedBox(
          //                       width: size.width * 0.075,
          //                       child: Text(
          //                         "A-",
          //                         style: TextStyle(
          //                             fontSize: 16, color: Colors.black),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
