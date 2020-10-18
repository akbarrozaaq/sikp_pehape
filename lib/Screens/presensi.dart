import 'dart:convert';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pehape_sikp/components/components.dart';
import 'package:pehape_sikp/model/presensi_model.dart';
import 'package:pehape_sikp/service/services.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class Presensi extends StatefulWidget {
  @override
  _PresensiState createState() => _PresensiState();
}

// List namaMatkul = ["SPK", "Data Mining", "Sister"];
// List sksMatkul = ["3", "3", "3"];
// List namaDosen = ["Yusa", "Ruvita", "Arie"];
// List tglMatkul = ["02-09-2020", "09-09-2020", "16-09-2020"];
// List ketMatkul = ["Hadir", "Hadir", "Hadir"];

class _PresensiState extends State<Presensi> {
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: CustomAppBar("Presensi", kPrimaryColor, Colors.black87),
      // body: loading
      //     ? LoadingCrab()
      //     : ListView.builder(
      //         itemCount: presensiModel.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return Column(
      //             children: [
      //               SizedBox(
      //                 height: 16.0,
      //               ),
      //               Center(
      //                 child: Container(
      //                   width: size.width * 0.9,
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(29),
      //                     color: kPrimaryColor,
      //                   ),
      //                   child: ExpansionCard(
      //                     trailing: Icon(
      //                       Icons.keyboard_arrow_down,
      //                       color: Colors.black87,
      //                     ),
      //                     margin: EdgeInsets.all(10.0),
      //                     borderRadius: 10.0,
      //                     title: Container(
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: <Widget>[
      //                           Text(
      //                             presensiModel[index].matkulNama,
      //                             style: TextStyle(
      //                                 fontSize: 20.0,
      //                                 color: Colors.black87,
      //                                 fontWeight: FontWeight.w600),
      //                           ),
      //                           SizedBox(
      //                             height: 16.0,
      //                           ),
      //                           Row(
      //                             mainAxisAlignment:
      //                                 MainAxisAlignment.spaceBetween,
      //                             children: [
      //                               Text(
      //                                 presensiModel[index].matkulSks + " Sks",
      //                                 style: TextStyle(
      //                                     fontSize: 16, color: Colors.black87),
      //                               ),
      //                             ],
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     children: <Widget>[
      //                       Divider(
      //                         color: Colors.black87,
      //                         height: 1.5,
      //                       ),
      //                       Container(
      //                         child: Column(
      //                           children: [
      //                             SizedBox(
      //                               height: 10.0,
      //                             ),
      //                             Row(
      //                               mainAxisAlignment:
      //                                   MainAxisAlignment.spaceEvenly,
      //                               children: [
      //                                 SizedBox(
      //                                   width: size.width * 0.35,
      //                                   child: Text(
      //                                     "Tanggal",
      //                                     style: TextStyle(
      //                                         fontSize: 16,
      //                                         color: Colors.black87),
      //                                   ),
      //                                 ),
      //                                 SizedBox(
      //                                   width: size.width * 0.35,
      //                                   child: Text(
      //                                     "Keterangan",
      //                                     style: TextStyle(
      //                                         fontSize: 16,
      //                                         color: Colors.black87),
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                             SizedBox(
      //                               height: 10.0,
      //                             ),
      //                             Divider(
      //                               color: Colors.black87,
      //                               height: 1.5,
      //                             ),
      //                             Padding(
      //                               padding: const EdgeInsets.only(top: 5),
      //                               child: Row(
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.spaceEvenly,
      //                                 children: [
      //                                   SizedBox(
      //                                     width: size.width * 0.35,
      //                                     child: Text(
      //                                       presensiModel[index].presensiTgl,
      //                                       style: TextStyle(
      //                                           fontSize: 16,
      //                                           color: Colors.black87),
      //                                     ),
      //                                   ),
      //                                   SizedBox(
      //                                     width: size.width * 0.35,
      //                                     child: Text(
      //                                       presensiModel[index].presensiKet,
      //                                       style: TextStyle(
      //                                           fontSize: 16,
      //                                           color: Colors.black87),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                             SizedBox(
      //                               child: Divider(
      //                                 height: 1.5,
      //                                 color: Colors.black87,
      //                               ),
      //                               height: 16,
      //                             ),
      //                             Text(
      //                               "Dosen Pengampu:",
      //                               style: TextStyle(
      //                                   fontSize: 16, color: Colors.black87),
      //                             ),
      //                             Text(
      //                               presensiModel[index].matkulNamaDosen,
      //                               style: TextStyle(
      //                                   fontSize: 16, color: Colors.black87),
      //                             ),
      //                             SizedBox(
      //                               height: 16,
      //                             )
      //                           ],
      //                         ),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           );
      //         },
      //       ),
      body: loading
          ? LoadingCrab()
          : ListView.builder(
              itemCount: presensiModel.length,
              itemBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Card(
                        color: kPrimaryColor,
                        elevation: 1,
                        margin: EdgeInsets.all(size.width * 0.025),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29)),
                        child: Container(
                          padding: EdgeInsets.all(size.width * 0.05),
                          width: size.width * 0.9,
                          height: size.height * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29),
                            color: kPrimaryColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.6,
                                    child: Text(
                                      presensiModel[index].matkulNama,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Text(
                                    presensiModel[index].matkulSks + " Sks",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                                child: Divider(
                                  color: Colors.black87,
                                  height: 1.5,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tanggal : " +
                                        presensiModel[index].presensiTgl,
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  Text(
                                    "Keterangan : " +
                                        presensiModel[index].presensiKet,
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Center(
                                child: Text(
                                  "Dosen Pengampu : \n" +
                                      presensiModel[index].matkulNamaDosen,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
