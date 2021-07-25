import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class DialogTypingStateInformation extends StatefulWidget {
  @override
  DialogTypingStateInformationState createState() =>
      new DialogTypingStateInformationState();
}

class DialogTypingStateInformationState
    extends State<DialogTypingStateInformation> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:
      Container(
        width: MediaQuery.of(context).size.width * 2,
        child: Column(
          children: [
            Center(
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(1),
                    child: Table(
                      // defaultColumnWidth: FixedColumnWidth(120.0),
                      border: TableBorder.all(
                          color: Color(0xFF000000),
                          style: BorderStyle.solid,
                          width: 1),
                      children: [
                        TableRow(children: [
                          Column(children: [
                            Text('Thông số',
                                style: TextStyle(
                                    fontSize: 17.0, color: Color(0xFF000000)))
                          ]),
                          Column(children: [
                            Text('Kết quả',
                                style: TextStyle(
                                    fontSize: 17.0, color: Color(0xFF000000)))
                          ]),
                          Column(children: [
                            Text('Đơn vị đo',
                                style: TextStyle(
                                    fontSize: 17.0, color: Color(0xFF000000)))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            Text("Tốc độ gõ đúng",
                                style: TextStyle(
                                    color: Color(0xFFFF0000),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text("0",
                                style: TextStyle(
                                    color: Color(0xFF0027EE),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text("từ / phút",
                                style: TextStyle(
                                    color: Color(0xFF169500),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            Text("Tỉ lệ gõ đúng",
                                style: TextStyle(
                                    color: Color(0xFFFF0000),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text("50",
                                style: TextStyle(
                                    color: Color(0xFF0027EE),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text("%",
                                style: TextStyle(
                                    color: Color(0xFF169500),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            Text("> 1/2",
                                style: TextStyle(
                                    color: Color(0xFFFF0000),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text("Bộ phím",
                                style: TextStyle(
                                    color: Color(0xFF0027EE),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text("Bộ phím",
                                style: TextStyle(
                                    color: Color(0xFF169500),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            Text("Số phím đã gõ",
                                style: TextStyle(
                                    color: Color(0xFFFF0000),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text("2",
                                style: TextStyle(
                                    color: Color(0xFF0027EE),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text("phím",
                                style: TextStyle(
                                    color: Color(0xFF169500),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            Text("Thời gian gõ",
                                style: TextStyle(
                                    color: Color(0xFFFF0000),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text("0",
                                style: TextStyle(
                                    color: Color(0xFF0027EE),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text("phút",
                                style: TextStyle(
                                    color: Color(0xFF169500),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            Text("Thời gian",
                                style: TextStyle(
                                    color: Color(0xFFFF0000),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            CountdownTimer(
                              textStyle: TextStyle(
                                  color: Color(0xFF0027EE),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              endTime:
                              DateTime.now().millisecondsSinceEpoch + 1000 * 900,
                              onEnd: () => {},
                            ),
                          ]),
                          Column(children: [
                            Text("hh:mm:ss",
                                style: TextStyle(
                                    color: Color(0xFF169500),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ]),
                      ],
                    ),
                  ),
                ])),
          ],
        ),
      ),
      actions: [
        FlatButton(
          child: new Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
