import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pehape_sikp/components/components.dart';
import 'package:pehape_sikp/components/khs_grafik.dart';
import 'package:pehape_sikp/constants.dart';
import 'package:pehape_sikp/model/khs_model.dart';
import 'package:http/http.dart' as http;
import 'package:pehape_sikp/model/pra_khs_model.dart';
import 'package:pehape_sikp/service/services.dart';

class KartuHasilStudi extends StatefulWidget {
  @override
  _KartuHasilStudiState createState() => _KartuHasilStudiState();
}

class _KartuHasilStudiState extends State<KartuHasilStudi> {
  String _valSemester;
  List<dynamic> _dataIps = List();
  void getIps() async {
    setState(() {
      loading = true;
    });
    final respose = await http.get(BaseUrl.dataPraKhsURL +
        Get.arguments); //untuk melakukan request ke webservice
    var listData = jsonDecode(respose.body); //lalu kita decode hasil datanya
    setState(() {
      _dataIps = listData; // dan kita set kedalam variable _dataIps
    });
    setState(() {
      loading = false;
    });
    print("data : $listData");
  }
  // List<PraKhsModel> praKhsModel;

  // var loading = false;
  // Future<List<PraKhsModel>> _getPraKhs() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   final response = await http.get(BaseUrl.dataPraKhsURL + Get.arguments);
  //   List res = jsonDecode(response.body);
  //   List<PraKhsModel> data = [];
  //   for (var i = 0; i < res.length; i++) {
  //     var praKhs = PraKhsModel.fromJson(res[i]);
  //     data.add(praKhs);
  //   }

  //   praKhsModel = data;

  //   setState(() {
  //     loading = false;
  //   });
  //   return praKhsModel;
  // }

  List<KhsModel> khsModel;
  var semid;

  var loading = false;
  Future<List<KhsModel>> _getKhs() async {
    setState(() {
      loading = true;
    });
    final response = await http
        .get(BaseUrl.dataKhsURL + Get.arguments + "&krs_semid=" + semid);
    List res = jsonDecode(response.body);
    List<KhsModel> data = [];
    for (var i = 0; i < res.length; i++) {
      var khs = KhsModel.fromJson(res[i]);
      data.add(khs);
    }

    khsModel = data;

    setState(() {
      loading = false;
    });
    return khsModel;
  }

  @override
  void initState() {
    //_getPraKhs();
    // _getKhs();
    getIps();
    super.initState();
  }

  final covid19 = [12.17, 11.15, 10.02, 11.21, 13.83, 14.16, 14.30];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar("Kartu Hasil Studi", kYellowColor, Colors.white),
        body: loading
            ? LoadingCrab()
            : Column(
                children: [
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 20.0),
                    sliver: SliverToBoxAdapter(
                      //child: KhsGrafik(covidCases: covid19),
                      child: Container(
                        height: 350.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Daily New Cases',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 16.0,
                                  barTouchData: BarTouchData(
                                    enabled: false,
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    bottomTitles: SideTitles(
                                      margin: 10.0,
                                      showTitles: true,
                                      //textStyle: Styles.chartLabelsTextStyle,
                                      rotateAngle: 35.0,
                                      getTitles: (double value) {
                                        switch (value.toInt()) {
                                          case 0:
                                            return 'May 24';
                                          case 1:
                                            return 'May 25';
                                          case 2:
                                            return 'May 26';
                                          case 3:
                                            return 'May 27';
                                          case 4:
                                            return 'May 28';
                                          case 5:
                                            return 'May 29';
                                          case 6:
                                            return 'May 30';
                                          default:
                                            return '';
                                        }
                                      },
                                    ),
                                    leftTitles: SideTitles(
                                      margin: 10.0,
                                      showTitles: true,
                                      // textStyle: Styles.chartLabelsTextStyle,
                                      getTitles: (value) {
                                        if (value == 0) {
                                          return '0';
                                        } else if (value % 3 == 0) {
                                          return '${value ~/ 3 * 5}K';
                                        }
                                        return '';
                                      },
                                    ),
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    checkToShowHorizontalLine: (value) =>
                                        value % 3 == 0,
                                    getDrawingHorizontalLine: (value) => FlLine(
                                      color: Colors.black12,
                                      strokeWidth: 1.0,
                                      dashArray: [5],
                                    ),
                                  ),
                                  borderData: FlBorderData(show: false),
                                  barGroups: covid19
                                      .asMap()
                                      .map(
                                        (key, value) => MapEntry(
                                          key,
                                          BarChartGroupData(
                                            x: key,
                                            barRods: [
                                              BarChartRodData(
                                                y: value,
                                                colors: [Colors.red],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .values
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  DropdownButton(
                    hint: Text("Pilih Semester"),
                    value: _valSemester,
                    items: _dataIps.map((item) {
                      return DropdownMenuItem(
                        child: Text(item['krs_semid'].toString()),
                        value: item['krs_semid'].toString(),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _valSemester = value;
                      });
                    },
                  ),
                  Text(
                    "Kamu memilih semester $_valSemester",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
        //   ListView(
        // children: [
        //   CardKhs(
        //     namaSemester: "Ganjil 2017/2018",
        //     sksSemester: 19.toString(),
        //   ),
        //   CardKhs(
        //     namaSemester: "Genap 2017/2018",
        //     sksSemester: 20.toString(),
        //   ),
        //   CardKhs(
        //     namaSemester: "Ganjil 2018/2019",
        //     sksSemester: 24.toString(),
        //   ),
        //   CardKhs(
        //     namaSemester: "Genap 2018/2019",
        //     sksSemester: 24.toString(),
        //   ),
        //   CardKhs(
        //     namaSemester: "Ganjil 2019/2020",
        //     sksSemester: 22.toString(),
        //   ),
        //   CardKhs(
        //     namaSemester: "Genap 2019/2020",
        //     sksSemester: 20.toString(),
        //   ),
        //   SizedBox(
        //     height: 32.0,
        //   )
        // ],
        //),
        );
  }
}
