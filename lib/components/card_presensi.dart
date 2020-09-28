import 'package:flutter/material.dart';
import 'package:pehape_sikp/constants.dart';
import 'package:expansion_card/expansion_card.dart';

class CardPresensi extends StatelessWidget {
  final String namaMatkul;
  final String sksMatkul;
  final String tglMatkul;
  final String ketMatkul;
  final String dosenMatkul;

  const CardPresensi(
      {Key key,
      this.namaMatkul,
      this.sksMatkul,
      this.tglMatkul,
      this.ketMatkul,
      this.dosenMatkul})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 16.0,
        ),
        Center(
          child: Container(
            width: size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(29),
              color: kYellowColor,
            ),
            child: ExpansionCard(
              trailing: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
              margin: EdgeInsets.all(10.0),
              borderRadius: 10.0,
              title: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      namaMatkul,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sksMatkul + " Sks",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          tglMatkul,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              children: <Widget>[
                Divider(
                  color: Colors.black,
                  height: 1.5,
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Keterangan Mahasiswa : ",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            ketMatkul,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Dosen Pengampu:",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        dosenMatkul,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
