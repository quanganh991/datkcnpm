import 'dart:ffi';
import 'package:datk/HOC/Head_Bar.dart';
import 'package:datk/Screens/body_screen.dart';
import 'package:datk/dialogs/dialog_learning_dictionary.dart';
import 'package:datk/dialogs/dialog_typing_state_information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datk/Screens/left_screen.dart';
import 'package:datk/Screens/right_screen.dart';
import 'package:datk/dialogs/dialog_Hoc_Go_Am.dart';
import 'package:datk/dialogs/dialog_Hoc_Go_Phim.dart';
import 'package:datk/keyboard/stenoLeft.dart';
import 'package:datk/keyboard/stenoRight.dart';
import 'package:datk/keyboard/qwertyLeft.dart';
import 'package:datk/keyboard/switch_keyboard.dart';
import 'package:datk/keyboard/qwertyRight.dart';
import 'package:datk/keyboard/switch_keyboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:datk/keyboard/switch_keyboard.dart';
import 'package:datk/keyboard/get_device_info.dart';
import 'package:datk/keyboard/switch_keyboard.dart';
import 'package:datk/Screens/switch_screen.dart';

class HocGoPhimSelection extends StatefulWidget {
  @override
  HocGoPhimSelectionState createState() => HocGoPhimSelectionState();
}

class HocGoPhimSelectionState extends State<HocGoPhimSelection> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // _showDialog(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Học gõ phím",
          style: TextStyle(fontSize: 30),
        ),
        // backgroundColor: Color(0xFFFFDADA),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          HeadBarHoc(type: 'hoc_go_phim'),
          BodyScreen(),

        ],
      ),
    );
  }
}
