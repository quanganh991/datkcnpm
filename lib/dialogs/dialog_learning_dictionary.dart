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

class DialogTraTuDien extends StatefulWidget {
  @override
  DialogTraTuDienState createState() => DialogTraTuDienState();
}

class DialogTraTuDienState extends State<DialogTraTuDien> {
  final myController = TextEditingController();
  var from_qwerty_to_steno;

  void initState() {
    super.initState();
    from_qwerty_to_steno = FirebaseFirestore.instance
        .collection('datk') //from messages
        .doc('dictionary')
        .collection('dictionary')
        .where('value', isEqualTo: myController.text.toString())
        .snapshots();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tra từ điển",
          style: TextStyle(fontSize: 30),
        ),
        // backgroundColor: Color(0xFFFFDADA),
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
              });
            },
          ),
          SizedBox(height: 10),
          StreamBuilder(
              //realtime
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
                                      fontSize: 20.0, color: Color(0xFF0435D2)))
                            ]),
                            Column(children: [
                              Text('Qwerty',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Color(0xFF0435D2)))
                            ]),
                          ]),
                          for (int i = 0; i < found; i++)
                            TableRow(children: [
                              Column(children: [
                                Text(
                                    snapshot.data.docs[i].id.toString(),
                                    style: TextStyle(
                                        color: Color(0xFFFF1919),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ]),
                              Column(children: [
                                Text(snapshot.data.docs[i]
                                            .data()['value']
                                            .toString(),
                                    style: TextStyle(
                                        color: Color(0xFFFF1919),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ]),
                        ],
                      ),

                    ],
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
