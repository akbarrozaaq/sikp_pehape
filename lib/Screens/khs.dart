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
      backgroundColor: kYellowLightColor,
      appBar: CustomAppBar("Kartu Hasil Studi", kYellowColor, Colors.black),
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
        ],
      ),
    );
  }
}
