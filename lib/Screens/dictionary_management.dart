import 'dart:ffi';
import 'package:datk/dialogs/dialog_learning_dictionary.dart';
import 'package:datk/dialogs/dialog_typing_state_information.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datk/Screens/left_screen.dart';
import 'package:datk/Screens/right_screen.dart';
import 'package:datk/dialogs/dialog_Hoc_Go_Am.dart';
import 'package:datk/keyboard/stenoLeft.dart';
import 'package:datk/keyboard/stenoRight.dart';
import 'package:datk/keyboard/qwertyLeft.dart';
import 'package:datk/keyboard/qwertyRight.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:datk/keyboard/switch_keyboard.dart';
import 'package:datk/keyboard/get_device_info.dart';
import 'package:datk/Screens/switch_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'delete_word_warning.dart';

class DictionaryManagement extends StatefulWidget {
  const DictionaryManagement({
    Key? key,
    required this.qwerty,
    required this.steno,
  }) : super(key: key);

  final String qwerty;
  final String steno;

  @override
  DictionaryManagementState createState() => DictionaryManagementState();
}

class DictionaryManagementState extends State<DictionaryManagement> {
  var end_affected_steno_words;
  var one_affected_steno_words;
  var begin_affected_steno_words;
  final QwertyController = TextEditingController();
  final StenoController = TextEditingController();

  String begin_or_end = "end";
  String title = "Cập nhật âm cuối";

  void initState() {
    super.initState();
    print("widget.steno.toString() = " + widget.steno.toString());
    end_affected_steno_words = FirebaseFirestore.instance
        .collection('datk') //from messages
        .doc('dictionary')
        .collection('dictionary')
        .where('key', isEqualTo: widget.steno.toString())
        .snapshots();
    one_affected_steno_words = FirebaseFirestore.instance
        .collection('datk') //from messages
        .doc('dictionary')
        .collection('dictionary')
        .where('key', isEqualTo: widget.steno.toString())
        .snapshots();
    begin_affected_steno_words = FirebaseFirestore.instance
        .collection('datk') //from messages
        .doc('dictionary')
        .collection('dictionary')
        .where('key', isEqualTo: widget.steno.toString())
        .snapshots();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: FlatButton(
          onPressed: () {
            setState(() {
              begin_or_end = (begin_or_end == "begin" ? "end" : "begin");
              begin_or_end == "begin"
                  ? title = "Cập nhật âm đầu"
                  : title = "Cập nhật âm cuối";
            });
          },
          child: Text(
            title,
            style: TextStyle(fontSize: 30),
          ),
        ),
        backgroundColor:
            begin_or_end == "begin" ? Color(0xFF57E6FF) : Color(0xFFE5FF85),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: StenoController,
            maxLines: null,
            decoration: InputDecoration(labelText: "Sửa Steno..."),
            keyboardType: TextInputType.multiline,
            onChanged: (val) {
              setState(() {
                begin_affected_steno_words = FirebaseFirestore.instance
                    .collection('datk') //from messages
                    .doc('dictionary')
                    .collection('dictionary')
                    .where('begin',
                        isEqualTo: StenoController.text.toUpperCase())
                    .limit(20)
                    .snapshots();
                end_affected_steno_words = FirebaseFirestore.instance
                    .collection('datk') //from messages
                    .doc('dictionary')
                    .collection('dictionary')
                    .where('end', isEqualTo: StenoController.text.toUpperCase())
                    .limit(20)
                    .snapshots();
                one_affected_steno_words = FirebaseFirestore.instance
                    .collection('datk') //from messages
                    .doc('dictionary')
                    .collection('dictionary')
                    .where('key', isEqualTo: StenoController.text.toUpperCase())
                    .limit(1)
                    .snapshots();
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: QwertyController,
            maxLines: null,
            decoration: InputDecoration(labelText: "Sửa Qwerty..."),
            keyboardType: TextInputType.multiline,
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: FlatButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('datk') //bảng user
                    .doc('dictionary') //tại id mới
                    .collection('dictionary')
                    .doc(StenoController.text.toUpperCase())
                    .set({
                  StenoController.text.toUpperCase():
                      QwertyController.text.toLowerCase(),
                  'value': QwertyController.text.toLowerCase()
                });

                Fluttertoast.showToast(
                    msg: "Đã cập nhật thành công " +
                        StenoController.text.toUpperCase() +
                        " -> " +
                        QwertyController.text.toLowerCase());
              },
              child: Text(
                'Cập nhật từ điển',
                style: TextStyle(fontSize: 16.0),
              ),
              color: Color(0xFF4A12E0),
              highlightColor: Color(0xFF18E54D),
              splashColor: Colors.transparent,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            "Cảnh báo: Các từ sau có thể bị ảnh hưởng nếu cập nhật lại",
            style: TextStyle(color: Color(0xFFFF0000), fontSize: 20),
          ),
          Text(
            "Không khuyến khích người dùng chỉnh sửa từ điển nếu không gõ thành thạo",
            style: TextStyle(color: Color(0xFFC46700), fontSize: 20),
          ),
          begin_or_end == "end"
          ?
          StreamBuilder(
              //realtime
              stream: end_affected_steno_words,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  int found = snapshot.data.docs.length;
                  return Column(
                    children: [
                      Table(
                        // defaultColumnWidth: FixedColumnWidth(120.0),
                        border: TableBorder.all(
                            color: Color(0xFF1B950D),
                            style: BorderStyle.solid,
                            width: 1),
                        children: [
                          TableRow(children: [
                            Column(children: [
                              Text('Từ bị ảnh hưởng',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Color(0xFF0435D2)))
                            ]),
                            Column(children: [
                              Text('Sẽ bị sửa thành',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Color(0xFF0435D2)))
                            ]),
                          ]),
                          for (int i = 0; i < found; i++)
                            TableRow(children: [
                              Column(children: [
                                Text(snapshot.data.docs[i].id.toString(),
                                    style: TextStyle(
                                        color: Color(0xFFFF1919),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              Column(children: [
                                StreamBuilder(
                                    //realtime
                                    stream: one_affected_steno_words,
                                    builder: (BuildContext context,
                                        AsyncSnapshot
                                            snapshot_one_affected_steno_words) {
                                      if (snapshot_one_affected_steno_words
                                              .hasData &&
                                          QwertyController.text
                                                  .toLowerCase()
                                                  .length >
                                              0
                                          && snapshot_one_affected_steno_words.data.docs.length > 0
                                      ) {
                                        //lấy ra độ dài của từ qwerty của từ ở trong text field
                                        int leng =
                                            snapshot_one_affected_steno_words
                                                .data.docs[0]
                                                .data()['value']
                                                .toString()
                                                .length;
                                        return Text(
                                            snapshot.data.docs[i]
                                                    .data()['value']
                                                    .toString()
                                                    .substring(
                                                        0,
                                                        snapshot.data.docs[i]
                                                                .data()['value']
                                                                .toString()
                                                                .length -
                                                            leng) +
                                                QwertyController.text
                                                    .toLowerCase(),
                                            style: TextStyle(
                                                color: Color(0xFFFF1919),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold));
                                      } else {
                                        return Text(
                                            snapshot.data.docs[i]
                                                .data()['value']
                                                .toString(),
                                            style: TextStyle(
                                                color: Color(0xFFFF1919),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold));
                                      }
                                    }),
                              ]),
                            ]),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              })
          :
          StreamBuilder(
            //realtime
              stream: begin_affected_steno_words,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  int found = snapshot.data.docs.length;
                  return Column(
                    children: [
                      Table(
                        // defaultColumnWidth: FixedColumnWidth(120.0),
                        border: TableBorder.all(
                            color: Color(0xFF1B950D),
                            style: BorderStyle.solid,
                            width: 1),
                        children: [
                          TableRow(children: [
                            Column(children: [
                              Text('Từ bị ảnh hưởng',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Color(0xFF0435D2)))
                            ]),
                            Column(children: [
                              Text('Sẽ bị sửa thành',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Color(0xFF0435D2)))
                            ]),
                          ]),
                          for (int i = 0; i < found; i++)
                            TableRow(children: [
                              Column(children: [
                                Text(snapshot.data.docs[i].id.toString(),
                                    style: TextStyle(
                                        color: Color(0xFFFF1919),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              Column(children: [
                                StreamBuilder(
                                  //realtime
                                    stream: one_affected_steno_words,
                                    builder: (BuildContext context,
                                        AsyncSnapshot
                                        snapshot_one_affected_steno_words) {
                                      if (snapshot_one_affected_steno_words
                                          .hasData &&
                                          QwertyController.text
                                              .toLowerCase()
                                              .length >
                                              0
                                      ) {
                                        //lấy ra độ dài của từ qwerty của từ ở trong text field
                                        int leng =
                                            StenoController.text
                                                .toLowerCase()
                                                .length;
                                        return Text(
                                            QwertyController.text.toLowerCase()
                                            +
                                            snapshot.data.docs[i]
                                                .data()['value']
                                                .toString()
                                                .substring(
                                                leng,
                                                snapshot.data.docs[i]
                                                    .data()['value']
                                                    .toString()
                                                    .length
                                            )
                                            ,
                                            style: TextStyle(
                                                color: Color(0xFFFF1919),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold));
                                      } else {
                                        // print("-------dl = "+snapshot_one_affected_steno_words.data.docs.length.toString());
                                        // print("-------dlbool = "+snapshot_one_affected_steno_words.hasData.toString());
                                        return Text(
                                            snapshot.data.docs[i]
                                                .data()['value']
                                                .toString(),
                                            style: TextStyle(
                                                color: Color(0xFFFF1919),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold));
                                      }
                                    }),
                              ]),
                            ]),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              })
          ,
        ],
      ),
    );
  }
}
