import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:pehape_sikp/components/components.dart';
import 'package:pehape_sikp/constants.dart';
import 'package:pehape_sikp/model/khs_model.dart';
import 'package:http/http.dart' as http;
import 'package:pehape_sikp/model/khs_rumus_model.dart';
import 'package:pehape_sikp/service/services.dart';

class KartuHasilStudi extends StatefulWidget {
  @override
  _KartuHasilStudiState createState() => _KartuHasilStudiState();
}

class _KartuHasilStudiState extends State<KartuHasilStudi> {
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  String _valSemester;
  String npm = Get.arguments;
  List<dynamic> _dataIps = List();
  var loading = false;

  void getIps() async {
    setState(() {
      loading = true;
    });
    final response = await http.get(
        BaseUrl.dataPraKhsURL + npm); //untuk melakukan request ke webservice
    var listData = jsonDecode(response.body); //lalu kita decode hasil datanya
    setState(() {
      _dataIps = listData; // dan kita set kedalam variable _dataIps
    });
    setState(() {
      loading = false;
    });

    print("data : $listData");
  }

  List<KhsModel> khsModel;

  var loadingnull = true;
  var loading2 = false;
  Future<List<KhsModel>> _getKhs() async {
    setState(() {
      loading2 = true;
    });
    final response =
        await http.get(BaseUrl.dataKhsURL + npm + "&krs_semid=" + _valSemester);
    List res = jsonDecode(response.body);
    List<KhsModel> data = [];
    for (var i = 0; i < res.length; i++) {
      var khs = KhsModel.fromJson(res[i]);
      data.add(khs);
    }

    khsModel = data;

    setState(() {
      loading2 = false;
    });
    return khsModel;
  }

  var loading3 = false;
  KhsRumusModel khsRumusModel;
  Future<KhsRumusModel> _getKhsRumus() async {
    setState(() {
      loading3 = true;
    });
    final response = await http
        .get(BaseUrl.dataKhsRumusURL + npm + "&krs_semid=" + _valSemester);
    khsRumusModel = KhsRumusModel.fromJson(jsonDecode(response.body));
    setState(() {
      loading3 = false;
    });
    return khsRumusModel;
  }

  @override
  void initState() {
    getIps();
    super.initState();
  }

  final List<Color> gradientColors = [
    kBlueColor,
    kGreenColor,
  ];

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar("Kartu Hasil Studi", kYellowColor, Colors.white),
      body: loading
          ? LoadingCrab()
          : Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    color: kYellowLightColor,
                    width: double.infinity,
                    child: Card(
                      elevation: 4,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(32),
                      // ),
                      color: kYellowLightColor,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 32, right: 16),
                        child: LineChart(
                          LineChartData(
                            minX: 0,
                            maxX: 8,
                            minY: 0,
                            maxY: 4,
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 35,
                                getTextStyles: (value) => const TextStyle(
                                  color: kGreenColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                getTitles: (value) {
                                  switch (value.toInt()) {
                                    case 1:
                                      return 'I';
                                    case 2:
                                      return 'II';
                                    case 3:
                                      return 'III';
                                    case 4:
                                      return 'IV';
                                    case 5:
                                      return 'V';
                                    case 6:
                                      return 'VI';
                                    case 7:
                                      return 'VII';
                                    case 8:
                                      return 'VIII';
                                    case 9:
                                      return 'IX';
                                    case 10:
                                      return 'X';
                                    case 11:
                                      return 'XI';
                                    case 12:
                                      return 'XII';
                                    case 13:
                                      return 'XIII';
                                    case 14:
                                      return 'XIV';
                                  }
                                  return '';
                                },
                                margin: 8,
                              ),
                              leftTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (value) => const TextStyle(
                                  color: kBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                getTitles: (value) {
                                  switch (value.toInt()) {
                                    case 1:
                                      return '1.00';
                                    case 2:
                                      return '2.00';
                                    case 3:
                                      return '3.00';
                                    case 4:
                                      return '4.00';
                                  }
                                  return '';
                                },
                                reservedSize: 35,
                                margin: 12,
                              ),
                            ),
                            gridData: FlGridData(
                              show: true,
                              getDrawingHorizontalLine: (value) {
                                return FlLine(
                                  color: const Color(0xff37434d),
                                  strokeWidth: 1,
                                );
                              },
                              drawVerticalLine: true,
                              getDrawingVerticalLine: (value) {
                                return FlLine(
                                  color: const Color(0xff37434d),
                                  strokeWidth: 1,
                                );
                              },
                            ),
                            borderData: FlBorderData(
                              show: true,
                              border: Border.all(
                                  color: const Color(0xff37434d), width: 1),
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                spots: _dataIps == null
                                    ? FlSpot(0, 0)
                                    : _dataIps.map((item) {
                                        return FlSpot(
                                            double.parse(item['krs_semid']),
                                            double.parse(item['ips']));
                                      }).toList(),

                                // spots: [
                                //   FlSpot(0, 0),
                                //   FlSpot(1, 2),
                                //   FlSpot(2.6, 2),
                                //   FlSpot(4.9, 4),
                                //   FlSpot(6.8, 2.5),
                                //   FlSpot(8, 4),
                                // ],
                                isCurved: true,
                                colors: gradientColors,
                                barWidth: 5,
                                // dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                  colors: gradientColors
                                      .map((color) => color.withOpacity(0.3))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    //color: kBlueLightColor,
                    //borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                          print(value);
                        },
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      RaisedButton(
                        color: kBlueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          //side: BorderSide(color: Colors.blue),
                        ),
                        child: Text('Pilih', style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          _getKhs();
                          _getKhsRumus();
                          setState(() {
                            loadingnull = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: loadingnull
                      ? Container()
                      : loading2
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : _getBodyWidget(),
                ),
                Expanded(
                  flex: 1,
                  child: Material(
                    elevation: 4,
                    child: Container(
                      color: kYellowColor,
                      child: loadingnull
                          ? Container()
                          : Container(padding: EdgeInsets.all(4),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Jumlah SKS diambil : ' +
                                          (loading3
                                              ? ""
                                              : khsRumusModel.jumlahSks ?? "")),
                                      Text('Jumlah mata kuliah diambil : ' +
                                          (loading3
                                              ? ""
                                              : khsRumusModel.jumlahMatkul ??
                                                  "")),
                                    ],
                                  ),
                                  Text('IP Semester : ' +
                                      (loading3
                                          ? ""
                                          : khsRumusModel.rataNilai ?? "")),
                                ],
                              ),
                          ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _getBodyWidget() {
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 200,
        rightHandSideColumnWidth: 210,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: khsModel.length,
        rowSeparatorWidget: const Divider(
          color: kPrimaryColor,
          height: 1.0,
          thickness: 0.5,
        ),
        leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
        enablePullToRefresh: true,
        refreshIndicator: const WaterDropHeader(),
        refreshIndicatorHeight: 60,
        onRefresh: () async {
          //Do sth
          await Future.delayed(const Duration(milliseconds: 500));
          _hdtRefreshController.refreshCompleted();
        },
        htdRefreshController: _hdtRefreshController,
      ),
      height: MediaQuery.of(context).size.height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Nama Mata Kuliah', 200, Alignment.centerLeft),
      _getTitleItemWidget('Semester', 70, Alignment.center),
      _getTitleItemWidget('Sks', 70, Alignment.center),
      _getTitleItemWidget('Nilai', 70, Alignment.center),
    ];
  }

  Widget _getTitleItemWidget(String label, double width, AlignmentGeometry align) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: align,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(khsModel[index].matkulNama),
      width: 200,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(khsModel[index].semester),
          width: 70,
          height: 52,
          padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(khsModel[index].matkulSks),
          width: 70,
          height: 52,
          padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(khsModel[index].nilaiHuruf ?? ""),
          width: 70,
          height: 52,
          padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}
