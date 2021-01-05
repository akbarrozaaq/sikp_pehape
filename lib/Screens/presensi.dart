import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:pehape_sikp/components/components.dart';
import 'package:pehape_sikp/model/presensi_model.dart';
import 'package:pehape_sikp/service/services.dart';
import '../constants.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Presensi extends StatefulWidget {
  @override
  _PresensiState createState() => _PresensiState();
}

class _PresensiState extends State<Presensi> {
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  List<PresensiModel> presensiModel;

  var loading = false;
  Future<List<PresensiModel>> _getPresensi() async {
    setState(() {
      loading = true;
    });
    final response = await http.get(BaseUrl.dataPresensiURL + Get.arguments);
    List res = jsonDecode(response.body);
    List<PresensiModel> data = [];
    for (var i = 0; i < res.length; i++) {
      var presensi = PresensiModel.fromJson(res[i]);
      data.add(presensi);
    }

    presensiModel = data;

    setState(() {
      loading = false;
    });
    return presensiModel;
  }

  @override
  void initState() {
    _getPresensi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar("Presensi", kPrimaryColor, Colors.white),
        body: loading ? LoadingCrab() : _getBodyWidget());
  }

  Widget _getBodyWidget() {
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 600,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: presensiModel.length,
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
      // FlatButton(
      //   padding: EdgeInsets.all(0),
      //   child: _getTitleItemWidget(
      //       'Name' + (sortType == sortName ? (isAscending ? '↓' : '↑') : ''),
      //       100),
      //   onPressed: () {
      //     sortType = sortName;
      //     isAscending = !isAscending;
      //     user.sortName(isAscending);
      //     setState(() {});
      //   },
      // ),
      // FlatButton(
      //   padding: EdgeInsets.all(0),
      //   child: _getTitleItemWidget(
      //       'Status' +
      //           (sortType == sortStatus ? (isAscending ? '↓' : '↑') : ''),
      //       100),
      //   onPressed: () {
      //     sortType = sortStatus;
      //     isAscending = !isAscending;
      //     user.sortStatus(isAscending);
      //     setState(() {});
      //   },
      // ),
      _getTitleItemWidget('Tanggal', 200),
      _getTitleItemWidget('Mata Kuliah', 200),
      _getTitleItemWidget('Dosen Pengampu', 200),
      _getTitleItemWidget('Sks', 50),
      _getTitleItemWidget('Keterangan', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate =
        outputFormat.format(DateTime.parse(presensiModel[index].presensiTgl));
    return Container(
      child: Text(outputDate),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        // Container(
        //   child: Row(
        //     children: <Widget>[
        //       Icon(
        //           user.userInfo[index].status
        //               ? Icons.notifications_off
        //               : Icons.notifications_active,
        //           color:
        //               user.userInfo[index].status ? Colors.red : Colors.green),
        //       Text(user.userInfo[index].status ? 'Disabled' : 'Active')
        //     ],
        //   ),
        //   width: 100,
        //   height: 52,
        //   padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        //   alignment: Alignment.centerLeft,
        // ),
        Container(
          child: Text(presensiModel[index].matkulNama),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(presensiModel[index].matkulNamaDosen +
              (presensiModel[index].matkulNamaDosen2 != null
                  ? '\n' + presensiModel[index].matkulNamaDosen2
                  : '')),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(presensiModel[index].matkulSks),
          width: 50,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(presensiModel[index].presensiKet == 'H'
              ? "Hadir"
              : (presensiModel[index].presensiKet == 'A' ? 'Alpa' : 'Izin')),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}
