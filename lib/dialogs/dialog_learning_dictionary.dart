import 'dart:ffi';
import 'package:datk/Screens/delete_word_warning.dart';
import 'package:datk/Screens/dictionary_management.dart';
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

class DialogTraTuDien extends StatefulWidget {
  @override
  DialogTraTuDienState createState() => DialogTraTuDienState();
}

class DialogTraTuDienState extends State<DialogTraTuDien> {
  final myController = TextEditingController();
  var from_qwerty_to_steno;
  var from_steno_to_qwerty;
  String title = "Tra từ Qwerty";
  String qwerty_or_steno = "qwerty";
  void initState() {
    super.initState();
    from_qwerty_to_steno = FirebaseFirestore.instance
        .collection('datk') //from messages
        .doc('dictionary')
        .collection('dictionary')
        .where('value', isEqualTo: myController.text.toString())
        .snapshots();
    from_steno_to_qwerty = FirebaseFirestore.instance
        .collection('datk') //from messages
        .doc('dictionary')
        .collection('dictionary')
        .where('key', isEqualTo: myController.text.toString())
        .snapshots();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:
        FlatButton(
          onPressed: () {
            setState(() {
              qwerty_or_steno = (qwerty_or_steno == "qwerty" ? "steno" : "qwerty");
              qwerty_or_steno == "qwerty"
                  ? title = "Tra từ Qwerty"
                  : title = "Tra từ Steno";
            });
          },
          child:
        Text(
          title,
          style: TextStyle(fontSize: 30),
        ),
                ),

        backgroundColor: qwerty_or_steno == "qwerty" ? Color(0xFF57E6FF) : Color(0xFFE5FF85),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: myController,
            maxLines: null,
            decoration: InputDecoration(labelText: "Nhập từ cần tra..."),
            keyboardType: TextInputType.multiline,
            onChanged: (val) {
              setState(() {
                from_qwerty_to_steno = FirebaseFirestore.instance
                    .collection('datk') //from messages
                    .doc('dictionary')
                    .collection('dictionary')
                    .where(
                      'value',
                      isGreaterThanOrEqualTo: myController.text.toString(),
                      isLessThan: myController.text.toString().substring(
                              0, myController.text.toString().length - 1) +
                          String.fromCharCode(myController.text
                                  .toString()
                                  .codeUnitAt(
                                      myController.text.toString().length - 1) +
                              1),
                    )
                    .limit(10)
                    .snapshots();

                from_steno_to_qwerty = FirebaseFirestore.instance
                    .collection('datk') //from messages
                    .doc('dictionary')
                    .collection('dictionary')
                    .where(
                  'key',
                  isGreaterThanOrEqualTo: myController.text.toString().toUpperCase(),
                  isLessThan: myController.text.toString().toUpperCase().substring(
                      0, myController.text.toString().toUpperCase().length - 1) +
                      String.fromCharCode(myController.text
                          .toString().toUpperCase()
                          .codeUnitAt(
                          myController.text.toString().toUpperCase().length - 1) +
                          1),
                )
                    .limit(10)
                    .snapshots();
              });
            },
          ),
          SizedBox(height: 10),
          qwerty_or_steno == "qwerty"
          ?
          StreamBuilder(
              stream: from_qwerty_to_steno,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  int found = snapshot.data.docs.length;
                  return Column(
                    children: [
                      Text(
                          "Tìm thấy " +
                              found.toString() +
                              " kết quả cho " +
                              myController.text.toString(),
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Table(
                              // defaultColumnWidth: FixedColumnWidth(120.0),
                              border: TableBorder.all(
                                  color: Color(0xFF1B950D),
                                  style: BorderStyle.solid,
                                  width: 1),
                              children: [
                                TableRow(children: [
                                  Column(children: [
                                    Text('Tốc ký',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Color(0xFF0435D2)))
                                  ]),
                                  Column(children: [
                                    Text('Qwerty',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Color(0xFF0435D2)))
                                  ]),
                                ]),
                                for (int i = 0; i < found; i++)
                                  TableRow(children: [
                                    Column(children: [
                                      FlatButton(
                                          onLongPress:(){
                                            showDialog(
                                                context: context, builder: (_) => DeleteWordWarning(steno: snapshot.data.docs[i].id.toString()));
                                          },
                                          onPressed: (){
                                            Navigator.push(
                                              //điều hướng sang màn hình mới (Màn hình HomeScreen)
                                              context, //điều hướng từ
                                              MaterialPageRoute(
                                                //điều hướng sang
                                                builder:
                                                    (context) => //bên dưới cũng có hàm route sang HomeScreen, nhưng route ở đây là route khi kiểm tra ngay từ đầu, nếu đã đăng nhập lần trước rồi thì route ngay
                                                DictionaryManagement(steno: snapshot.data.docs[i].id.toString(),qwerty: snapshot.data.docs[i]
                                                    .data()['value']
                                                    .toString()),
                                              ), //chuyển sang màn hình gồm các người đang online
                                            );
                                          },
                                          child: Text(snapshot.data.docs[i].id.toString(),
                                              style: TextStyle(
                                                  color: Color(0xFFFF1919),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold))

                                      ),
                                    ]),
                                    Column(children: [
                                      FlatButton(
                                          onPressed: (){
                                            Navigator.push(
                                              //điều hướng sang màn hình mới (Màn hình HomeScreen)
                                              context, //điều hướng từ
                                              MaterialPageRoute(
                                                //điều hướng sang
                                                builder:
                                                    (context) => //bên dưới cũng có hàm route sang HomeScreen, nhưng route ở đây là route khi kiểm tra ngay từ đầu, nếu đã đăng nhập lần trước rồi thì route ngay
                                                DictionaryManagement(steno: snapshot.data.docs[i].id.toString(),qwerty: snapshot.data.docs[i]
                                                    .data()['value']
                                                    .toString()),
                                              ), //chuyển sang màn hình gồm các người đang online
                                            );
                                          },
                                          child:
                                      Text(
                                          snapshot.data.docs[i]
                                              .data()['value']
                                              .toString(),
                                          style: TextStyle(
                                              color: Color(0xFFFF1919),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))

                                      ),
                                    ]),
                                  ]),
                              ],
                            ),
                      (found == 0)
                          ?  Padding(
                          padding: const EdgeInsets.all(30),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                //điều hướng sang màn hình mới (Màn hình HomeScreen)
                                context, //điều hướng từ
                                MaterialPageRoute(
                                  //điều hướng sang
                                  builder:
                                      (context) => //bên dưới cũng có hàm route sang HomeScreen, nhưng route ở đây là route khi kiểm tra ngay từ đầu, nếu đã đăng nhập lần trước rồi thì route ngay
                                      DictionaryManagement(steno: myController.text.toString(),qwerty: ''),
                                  ), //chuyển sang màn hình gồm các người đang online
                                );
                            },
                            child: Text(
                              'Thêm vào bộ từ điển',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            color: Color(0xffdd4b39),
                            highlightColor: Color(0xffff7f7f),
                            splashColor: Colors.transparent,
                            textColor: Colors.white,
                            padding:
                            EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                          )
                      )
                       : Container(),
                    ],
                  );
                } else {
                  return Container();
                }
              })
          :
          StreamBuilder(
              stream: from_steno_to_qwerty,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  int found = snapshot.data.docs.length;
                  return Column(
                    children: [
                      Text(
                          "Tìm thấy " +
                              found.toString() +
                              " kết quả cho " +
                              myController.text.toString(),
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Table(
                        // defaultColumnWidth: FixedColumnWidth(120.0),
                        border: TableBorder.all(
                            color: Color(0xFF1B950D),
                            style: BorderStyle.solid,
                            width: 1),
                        children: [
                          TableRow(children: [
                            Column(children: [
                              Text('Tốc ký',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0xFF0435D2)))
                            ]),
                            Column(children: [
                              Text('Qwerty',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0xFF0435D2)))
                            ]),
                          ]),
                          for (int i = 0; i < found; i++)
                            TableRow(children: [
                              Column(children: [
                                FlatButton(
                                    onLongPress:(){
                                      showDialog(
                                          context: context, builder: (_) => DeleteWordWarning(steno: snapshot.data.docs[i].id.toString()));
                                    },
                                    onPressed: (){
                                      Navigator.push(
                                        //điều hướng sang màn hình mới (Màn hình HomeScreen)
                                        context, //điều hướng từ
                                        MaterialPageRoute(
                                          //điều hướng sang
                                          builder:
                                              (context) => //bên dưới cũng có hàm route sang HomeScreen, nhưng route ở đây là route khi kiểm tra ngay từ đầu, nếu đã đăng nhập lần trước rồi thì route ngay
                                          DictionaryManagement(steno: snapshot.data.docs[i].id.toString(),qwerty: snapshot.data.docs[i]
                                              .data()['value']
                                              .toString()),
                                        ), //chuyển sang màn hình gồm các người đang online
                                      );
                                    },
                                    child: Text(snapshot.data.docs[i].id.toString(),
                                        style: TextStyle(
                                            color: Color(0xFFFF1919),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))

                                ),
                              ]),
                              Column(children: [
                                FlatButton(
                                    onPressed: (){
                                      Navigator.push(
                                        //điều hướng sang màn hình mới (Màn hình HomeScreen)
                                        context, //điều hướng từ
                                        MaterialPageRoute(
                                          //điều hướng sang
                                          builder:
                                              (context) => //bên dưới cũng có hàm route sang HomeScreen, nhưng route ở đây là route khi kiểm tra ngay từ đầu, nếu đã đăng nhập lần trước rồi thì route ngay
                                          DictionaryManagement(steno: snapshot.data.docs[i].id.toString(),qwerty: snapshot.data.docs[i]
                                              .data()['value']
                                              .toString()),
                                        ), //chuyển sang màn hình gồm các người đang online
                                      );
                                    },
                                    child:
                                    Text(
                                        snapshot.data.docs[i]
                                            .data()['value']
                                            .toString(),
                                        style: TextStyle(
                                            color: Color(0xFFFF1919),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))

                                ),
                              ]),
                            ]),
                        ],
                      ),
                      (found == 0)
                          ?  Padding(
                          padding: const EdgeInsets.all(30),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                //điều hướng sang màn hình mới (Màn hình HomeScreen)
                                context, //điều hướng từ
                                MaterialPageRoute(
                                  //điều hướng sang
                                  builder:
                                      (context) => //bên dưới cũng có hàm route sang HomeScreen, nhưng route ở đây là route khi kiểm tra ngay từ đầu, nếu đã đăng nhập lần trước rồi thì route ngay
                                  DictionaryManagement(steno: myController.text.toString(),qwerty: ''),
                                ), //chuyển sang màn hình gồm các người đang online
                              );
                            },
                            child: Text(
                              'Thêm vào bộ từ điển',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            color: Color(0xffdd4b39),
                            highlightColor: Color(0xffff7f7f),
                            splashColor: Colors.transparent,
                            textColor: Colors.white,
                            padding:
                            EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                          )
                      )
                          : Container(),
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
