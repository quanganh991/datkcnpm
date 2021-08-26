import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:datk/image/configs.dart';

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
                            TextStyle(color: Colors.deepOrange, fontSize: 20),
                      ),
                      Text(
                        "Lưu ý: Tắt phần mềm gõ tiếng Việt khi sử dụng gõ tốc ký",
                        style: TextStyle(color: Colors.green, fontSize: 19),
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
                  .limit(10)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                List<String> time = [];
                List<String> steno = [];
                List<Color> color = [];
                if (snapshot.hasData) {
                  for (int i = 0; i < snapshot.data.docs.length; i++) {
                    time.add(snapshot.data.docs[i].data()['time'].toString());
                    steno.add(snapshot.data.docs[i].data()['content'].toString());
                    if (snapshot.data.docs[i].data()['color'].toString() == "green")
                      color.add(Color(0xFF05D205));
                    else if (snapshot.data.docs[i].data()['color'].toString() == "yellow")
                      color.add(Color(0xFFAEB100));
                    else
                      color.add(Color(0xFFFF0000));
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
                                          fontSize: 20.0,
                                          color: Color(0xFF0435D2)))
                                ]),
                                Column(children: [
                                  Text('Từ đã gõ',
                                      style: TextStyle(
                                          fontSize: 20.0,
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
                                          color: color[i],
                                          fontSize: 20),
                                    ),
                                  ]),
                                  Column(children: [
                                    Text(
                                      steno[i],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: color[i],
                                          fontSize: 20),
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
