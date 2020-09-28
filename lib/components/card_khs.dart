import 'package:flutter/material.dart';
import 'package:pehape_sikp/components/list_khs.dart';
import 'package:pehape_sikp/constants.dart';
import 'package:expansion_card/expansion_card.dart';

class CardKhs extends StatelessWidget {
  final String namaSemester;
  final String sksSemester;

  const CardKhs({Key key, this.namaSemester, this.sksSemester})
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
              color: kBlueColor,
            ),
            child: ExpansionCard(
              trailing: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
              margin: EdgeInsets.all(size.width * 0.025),
              borderRadius: 10.0,
              title: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      namaSemester,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      sksSemester + " Sks",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        color: Colors.black,
                        height: 1.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.6,
                              child: Text(
                                "Mata Kuliah",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.1,
                              child: Text(
                                "SKS",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.1,
                              child: Text(
                                "Nilai",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 1.5,
                      ),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      ListKhs(
                        namaMatkul:
                            "Pengantar Pemrograman dan Rekayasa Perangkat Lunak",
                        sksMatkul: 4.toString(),
                        nilaiMatkul: "A",
                      ),
                      ListKhs(
                        namaMatkul: "Lingkungan Komputasi",
                        sksMatkul: 3.toString(),
                        nilaiMatkul: "A-",
                      ),
                      ListKhs(
                        namaMatkul: "BAHASA INGGRIS I",
                        sksMatkul: 2.toString(),
                        nilaiMatkul: "B+",
                      ),
                      ListKhs(
                        namaMatkul: "Pancasila",
                        sksMatkul: 2.toString(),
                        nilaiMatkul: "A-",
                      ),
                      ListKhs(
                        namaMatkul: "Dampak Sosial Perkembangan Komputer",
                        sksMatkul: 2.toString(),
                        nilaiMatkul: "A-",
                      ),
                      ListKhs(
                        namaMatkul: "Fisika Dasar I",
                        sksMatkul: 2.toString(),
                        nilaiMatkul: "A",
                      ),
                      ListKhs(
                        namaMatkul: "Lingkungan Komputasi",
                        sksMatkul: 3.toString(),
                        nilaiMatkul: "A-",
                      ),
                      ListKhs(
                        namaMatkul: "Kalkulus I",
                        sksMatkul: 3.toString(),
                        nilaiMatkul: "A",
                      ),
                      ListKhs(
                        namaMatkul: "Praktikum Fisika Dasar I",
                        sksMatkul: 1.toString(),
                        nilaiMatkul: "A",
                      ),
                      Divider(
                        color: Colors.black,
                        height: 1.5,
                      ),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "IP Semester : " + 3.86.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
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
