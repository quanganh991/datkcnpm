import 'package:VietStenoGame/KIEM_TRA/Head_Bar.dart';
import 'package:VietStenoGame/Screens/body_screen.dart';
import 'package:VietStenoGame/dialogs/dialog_typing_state_information.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:VietStenoGame/Screens/left_screen.dart';
import 'package:VietStenoGame/Screens/right_screen.dart';
import 'package:VietStenoGame/dialogs/dialog_KT_Do_Chinh_Xac.dart';
import 'package:VietStenoGame/dialogs/dialog_KT_Toc_Do.dart';
import 'package:VietStenoGame/keyboard/qwertyLeft.dart';
import 'package:VietStenoGame/keyboard/qwertyRight.dart';
import 'package:VietStenoGame/keyboard/stenoLeft.dart';
import 'package:VietStenoGame/keyboard/stenoRight.dart';
import 'package:flutter/material.dart';
import 'package:VietStenoGame/keyboard/switch_keyboard.dart';
import 'package:VietStenoGame/keyboard/get_device_info.dart';
import 'package:VietStenoGame/Screens/switch_screen.dart';

class KTDoChinhXacSelection extends StatefulWidget {
  @override
  KTDoChinhXacSelectionState createState() => KTDoChinhXacSelectionState();
}

class KTDoChinhXacSelectionState extends State<KTDoChinhXacSelection> {

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // _showDialog(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kiểm tra độ chính xác",
          style: TextStyle(fontSize: 30),
        ),
        // backgroundColor: Color(0xFFFFDADA),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


          HeadBarKiemTra(type: 'kiem_tra_do_chinh_xac'),
          BodyScreen(type: 'random')

        ],
      ),
    );
  }
}