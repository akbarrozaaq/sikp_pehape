import 'package:flutter/material.dart';
import 'package:pehape_sikp/components/components.dart';
import 'package:pehape_sikp/constants.dart';

class TranskripNilai extends StatefulWidget {
  @override
  _TranskripNilaiState createState() => _TranskripNilaiState();
}

class _TranskripNilaiState extends State<TranskripNilai> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kRedLightColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.03,
            ),
            Center(
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: size.height * 0.35,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: kRedColor, width: 2.0)),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Jumlah SKS diambil : " + "126"),
                        Text("Jumlah mata kuliah diambil : " + "45"),
                        Text("IP Kumulatif : " + "3.59"),
                        CustomDivider(
                          text: "Keterangan Nilai",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('A    : 4.00'),
                            Text('B   : 3.00'),
                            Text('C  : 2.00'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('A-   : 3.75'),
                            Text('B-  : 2.75'),
                            Text('D  : 1.00'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('B+  : 3.50'),
                            Text('C+ : 2.50'),
                            Text('E  : 0.00'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: size.height * -0.015,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: kRedColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "Prestasi Akademik",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Card(
              color: kRedColor,
              elevation: 1,
              margin: EdgeInsets.all(size.width * 0.025),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29)),
              child: Container(
                padding: EdgeInsets.all(size.width * 0.05),
                width: size.width * 0.9,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                  color: kRedColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.6,
                          child: Text(
                            "Sistem Pendukung Keputusan",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          "1",
                          style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 1.5,
                    ),
                    Text("Semester : " + "Ganjil 2017/2018"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Jumlah SKS : " + "3 SKS"),
                        Padding(
                            padding: EdgeInsets.only(right: size.width * 0.01),
                            child: Text("Nilai : " + "A")),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32.0,
            )
          ],
        ),
      ),
    );
  }
}
