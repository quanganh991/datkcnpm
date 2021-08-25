import 'package:datk/Screens/body_screen.dart';
import 'package:datk/dialogs/dialog_typing_state_information.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datk/Screens/left_screen.dart';
import 'package:datk/Screens/right_screen.dart';
import 'package:datk/dialogs/dialog_KT_Toc_Do.dart';
import 'package:datk/keyboard/qwertyLeft.dart';
import 'package:datk/keyboard/qwertyRight.dart';
import 'package:datk/keyboard/stenoLeft.dart';
import 'package:datk/keyboard/stenoRight.dart';
import 'package:flutter/material.dart';
import 'package:datk/keyboard/switch_keyboard.dart';
import 'package:datk/keyboard/get_device_info.dart';
import 'package:datk/keyboard/switch_keyboard.dart';
import 'package:datk/Screens/switch_screen.dart';

import 'Head_Bar.dart';

class KTTocDoSelection extends StatefulWidget {
  @override
  KTTocDoSelectionState createState() => KTTocDoSelectionState();
}

class KTTocDoSelectionState extends State<KTTocDoSelection> {

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // _showDialog(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kiểm tra theo tốc độ",
          style: TextStyle(fontSize: 30),
        ),
        // backgroundColor: Color(0xFFFFDADA),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


          HeadBarKiemTra(type: 'kiem_tra_toc_do'),

          BodyScreen(type: 'random')

        ],
      ),
    );
  }
}