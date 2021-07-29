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

class DictionaryManagement extends StatefulWidget {
  const DictionaryManagement({
    Key? key,
    required this.qwerty,
    required this.steno,
  }) : super(key:key);

  final String qwerty;
  final String steno;

  @override
  DictionaryManagementState createState() => DictionaryManagementState();
}

class DictionaryManagementState extends State<DictionaryManagement> {

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var QwertyController = TextEditingController(text: widget.qwerty);
    var StenoController = TextEditingController(text: widget.steno);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quản lý bộ từ vựng",
          style: TextStyle(fontSize: 30),
        ),
        // backgroundColor: Color(0xFFFFDADA),
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: StenoController,
            maxLines: null,
            decoration: InputDecoration(labelText: "Sửa Steno..."),
            keyboardType: TextInputType.multiline,
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
                    StenoController.text.toUpperCase(): QwertyController.text.toLowerCase(),
                    'value': QwertyController.text.toLowerCase()
                  });

                  Fluttertoast.showToast(msg: "Đã cập nhật thành công "+StenoController.text.toUpperCase()+" -> "+QwertyController.text.toLowerCase());

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


        ],
      ),
    );
  }
}
