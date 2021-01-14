import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pehape_sikp/components/components.dart';
import 'package:pehape_sikp/constants.dart';
import 'package:pehape_sikp/model/transkrip_model.dart';
import 'package:pehape_sikp/model/transkriprumus_model.dart';
import 'package:pehape_sikp/service/services.dart';
import '../components/components.dart';
import '../constants.dart';

class TranskripNilai extends StatefulWidget {
  @override
  _TranskripNilaiState createState() => _TranskripNilaiState();
}

class _TranskripNilaiState extends State<TranskripNilai> {
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  List<TranskripModel> transkripModel;

  var loading = false;
  Future<List<TranskripModel>> _getTranskrip() async {
    setState(() {
      loading = true;
    });
    final response = await http.get(BaseUrl.dataTranskripURL + Get.arguments);
    List res = jsonDecode(response.body);
    List<TranskripModel> data = [];
    for (var i = 0; i < res.length; i++) {
      var transkrip = TranskripModel.fromJson(res[i]);
      data.add(transkrip);
    }
    // var jumlah = transkripModel.map<int>((m) => int.parse(m["matkul_sks"])).reduce((a, b) => a + b);

    transkripModel = data;

    setState(() {
      loading = false;
    });
    return transkripModel;
  }

  var loading2 = false;
  TranskripRumusModel transkripRumusModel;
  Future<TranskripRumusModel> _getTranskripRumus() async {
    setState(() {
      loading2 = true;
    });
    final response =
        await http.get(BaseUrl.dataTranskripRumusURL + Get.arguments);
    transkripRumusModel =
        TranskripRumusModel.fromJson(jsonDecode(response.body));
    setState(() {
      loading2 = false;
    });
    return transkripRumusModel;
  }

  @override
  void initState() {
    _getTranskrip();
    _getTranskripRumus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar("Transkrip Nilai", kBlueColor, Colors.white),
      body: loading2
          ? LoadingCrab()
          : loading
              ? LoadingCrab()
              : Column(
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
                            height: size.height * 0.25,
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border:
                                    Border.all(color: kBlueColor, width: 2.0)),
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Row(
                                  children: [
                                    AutoSizeText(
                                      "Jumlah SKS diambil : ",
                                      style: TextStyle(fontSize: 14),
                                      minFontSize: 10,
                                      maxLines: 1,
                                    ),
                                    AutoSizeText(
                                      transkripRumusModel.jmlhSks ?? "",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      minFontSize: 10,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    AutoSizeText(
                                      "Jumlah mata kuliah diambil : ",
                                      style: TextStyle(fontSize: 14),
                                      minFontSize: 10,
                                      maxLines: 1,
                                    ),
                                    AutoSizeText(
                                      transkripRumusModel.jmlhMatkul ?? "",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      minFontSize: 10,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    AutoSizeText(
                                      "IP Kumulatif : ",
                                      style: TextStyle(fontSize: 14),
                                      minFontSize: 10,
                                      maxLines: 1,
                                    ),
                                    AutoSizeText(
                                      transkripRumusModel.ipk ?? "",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      minFontSize: 10,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                                CustomDivider(
                                  text: "Keterangan Nilai",
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizeText(
                                      nilaihuruf: 'A',
                                      nilaiangka: '4.00',
                                    ),
                                    SizeText(
                                      nilaihuruf: 'B+',
                                      nilaiangka: '3.50',
                                    ),
                                    SizeText(
                                      nilaihuruf: 'B-',
                                      nilaiangka: '2.75',
                                    ),
                                    SizeText(
                                      nilaihuruf: 'C',
                                      nilaiangka: '2.00',
                                    ),
                                    SizeText(
                                      nilaihuruf: 'E',
                                      nilaiangka: '0.00',
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizeText(
                                      nilaihuruf: 'A-',
                                      nilaiangka: '3.75',
                                    ),
                                    SizeText(
                                      nilaihuruf: 'B',
                                      nilaiangka: '3.00',
                                    ),
                                    SizeText(
                                      nilaihuruf: 'C+',
                                      nilaiangka: '2.50',
                                    ),
                                    SizeText(
                                      nilaihuruf: 'D',
                                      nilaiangka: '1.00',
                                    ),
                                    SizeText(
                                      nilaihuruf: 'BL',
                                      nilaiangka: '0.00',
                                    ),
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
                                  color: kBlueColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "Prestasi Akademik",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    // Material(
                    //   elevation: 2,
                    //   child: Container(
                    //     color: kBlueLightColor,
                    //     child: SizedBox(
                    //       height: size.height * 0.05,
                    //       child: Center(
                    //         child: CustomDivider(
                    //           text: 'Mata Kuliah',
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Expanded(
                    //   child: ListView.builder(
                    //     itemCount: transkripModel.length,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       int i = 1;
                    //       i = i + index;
                    //       return Card(
                    //         color: kBlueColor,
                    //         elevation: 1,
                    //         margin: EdgeInsets.only(
                    //           left: size.width * 0.05,
                    //           right: size.width * 0.05,
                    //           top: size.width * 0.025,
                    //         ),
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(29)),
                    //         child: Container(
                    //           padding: EdgeInsets.all(size.width * 0.05),
                    //           width: size.width * 0.9,
                    //           height: size.height * 0.20,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(29),
                    //             color: kBlueColor,
                    //           ),
                    //           child: Column(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceAround,
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Row(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                   SizedBox(
                    //                     width: size.width * 0.7,
                    //                     child: AutoSizeText(
                    //                       transkripModel[index].matkulNama,
                    //                       style: TextStyle(
                    //                           fontSize: 18.0,
                    //                           color: Colors.black,
                    //                           fontWeight: FontWeight.w600),
                    //                       minFontSize: 14,
                    //                     ),
                    //                   ),
                    //                   AutoSizeText(
                    //                     i.toString(),
                    //                     style: TextStyle(
                    //                         fontSize: 30.0,
                    //                         color: Colors.black,
                    //                         fontWeight: FontWeight.w600),
                    //                     minFontSize: 20,
                    //                   ),
                    //                 ],
                    //               ),
                    //               Divider(
                    //                 color: Colors.black,
                    //                 height: 1.5,
                    //               ),
                    //               AutoSizeText(
                    //                 "Semester : " +
                    //                     transkripModel[index].semester,
                    //                 minFontSize: 10,
                    //               ),
                    //               Row(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                   AutoSizeText(
                    //                     "Jumlah SKS : " +
                    //                         transkripModel[index].matkulSks,
                    //                     minFontSize: 10,
                    //                   ),
                    //                   Padding(
                    //                     padding: EdgeInsets.only(
                    //                         right: size.width * 0.01),
                    //                     child: AutoSizeText(
                    //                       "Nilai : " +
                    //                           transkripModel[index].nilaiHuruf,
                    //                       minFontSize: 10,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: _getBodyWidget(),
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
        itemCount: transkripModel.length,
        rowSeparatorWidget: const Divider(
          color: kBlueColor,
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
      _getTitleItemWidget('Mata Kuliah', 200, Alignment.centerLeft),
      _getTitleItemWidget('Semester', 70, Alignment.center),
      _getTitleItemWidget('SKS', 70, Alignment.center),
      _getTitleItemWidget('Nilai', 70, Alignment.center),
    ];
  }

  Widget _getTitleItemWidget(String label, double width, AlignmentGeometry align) {
    return Container(
      color: kBlueLightColor,
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: align,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      color: kBlueLightColor,
      child: Text(transkripModel[index].matkulNama),
      width: 250,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          color: kBlueLightColor,
          child: Text(transkripModel[index].semester),
          width: 70,
          height: 52,
          padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          color: kBlueLightColor,
          child: Text(transkripModel[index].matkulSks),
          width: 70,
          height: 52,
          padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          color: kBlueLightColor,
          child: Text(transkripModel[index].nilaiHuruf),
          width: 70,
          height: 52,
          padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}
