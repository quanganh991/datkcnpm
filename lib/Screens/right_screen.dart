import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:VietStenoGame/image/configs.dart';

class RightScreen extends StatefulWidget {
  @override
  RightScreenState createState() => RightScreenState();
}

class RightScreenState extends State<RightScreen> {
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        // minHeight: 15.0,
        maxHeight: MediaQuery.of(context).size.width * 0.75,
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            // margin: const EdgeInsets.symmetric(horizontal: 5.0),
            // padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: FlatButton(
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        "Kết quả tốc ký",
                        style:
                            TextStyle(color: Colors.deepOrange, fontSize: 14),
                      ),
                      Text(
                        "Lưu ý: Tắt phần mềm gõ tiếng Việt khi sử dụng gõ tốc ký",
                        style: TextStyle(color: Colors.green, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          StreamBuilder(
              //realtime
              stream: FirebaseFirestore.instance
                  .collection('datk') //from messages
                  .doc('user_typed_recently')
                  .collection('hoc')
                  .orderBy('time', descending: true)
                  .where('time', isNotEqualTo: 'not_allowed')
                  .limit(10)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                List<String> time = [];
                List<String> steno = [];
                List<String> qwerty = [];
                List<String> am_dau = [];
                List<String> am_chinh = [];
                List<String> am_cuoi = [];
                List<String> nghia_dau = [];
                List<String> nghia_chinh = [];
                List<String> nghia_cuoi = [];
                if (snapshot.hasData) {
                  for (int i = 0; i < snapshot.data.docs.length; i++) {
                    time.add(snapshot.data.docs[i].data()['time'].toString());
                    qwerty.add(
                        snapshot.data.docs[i].data()['meaning'].toString());
                    steno.add(
                        snapshot.data.docs[i].data()['content'].toString());
                    am_dau
                        .add(snapshot.data.docs[i].data()['am_dau'].toString());
                    am_chinh.add(
                        snapshot.data.docs[i].data()['am_chinh'].toString());
                    am_cuoi.add(
                        snapshot.data.docs[i].data()['am_cuoi'].toString());
                    nghia_dau.add(
                        snapshot.data.docs[i].data()['nghia_dau'].toString());
                    nghia_chinh.add(
                        snapshot.data.docs[i].data()['nghia_chinh'].toString());
                    nghia_cuoi.add(
                        snapshot.data.docs[i].data()['nghia_cuoi'].toString());
                  }
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.all(7.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          //bảng
                          Table(
                            // defaultColumnWidth: FixedColumnWidth(120.0),
                            border: TableBorder.all(
                                color: Color(0xFF5C0D95),
                                style: BorderStyle.solid,
                                width: 1),
                            children: [
                              TableRow(children: [
                                Column(children: [
                                  Text('Thời gian',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Color(0xFF0435D2)))
                                ]),
                                Column(children: [
                                  Text('Từ đã gõ',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Color(0xFF0435D2)))
                                ]),
                              ]),
                              for (int i = 0;
                                  i < snapshot.data.docs.length;
                                  i++)
                                TableRow(children: [
                                  Column(children: [
                                    Text(
                                      time[i],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFBA0E0E),
                                          fontSize: 14),
                                    ),
                                  ]),
                                  Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          steno[i].toUpperCase() +
                                              " - " +
                                              am_dau[i].toUpperCase() +
                                              " " +
                                              am_chinh[i].toUpperCase() +
                                              " " +
                                              am_cuoi[i].toUpperCase(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF0E9702),
                                              fontSize: 14),
                                        ),
                                        Text(
                                          qwerty[i],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF510297),
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ]),
                                ]),
                            ],
                          ),
                          //bảng
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
