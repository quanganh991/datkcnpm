import 'package:VietStenoGame/Screens/body_screen.dart';
import 'package:VietStenoGame/dialogs/dialog_typing_state_information.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:VietStenoGame/Screens/left_screen.dart';
import 'package:VietStenoGame/Screens/right_screen.dart';
import 'package:VietStenoGame/dialogs/dialog_KT_Do_Chinh_Xac.dart';
import 'package:VietStenoGame/dialogs/dialog_KT_Gioi_Han_Thoi_Gian.dart';
import 'package:VietStenoGame/dialogs/dialog_KT_Toc_Do.dart';
import 'package:VietStenoGame/keyboard/qwertyLeft.dart';
import 'package:VietStenoGame/keyboard/qwertyRight.dart';
import 'package:VietStenoGame/keyboard/stenoLeft.dart';
import 'package:VietStenoGame/keyboard/stenoRight.dart';
import 'package:flutter/material.dart';
import 'package:VietStenoGame/keyboard/switch_keyboard.dart';
import 'package:VietStenoGame/keyboard/get_device_info.dart';
import 'package:VietStenoGame/keyboard/switch_keyboard.dart';
import 'package:VietStenoGame/Screens/switch_screen.dart';

import 'Head_Bar.dart';

class KTGioiHanThoiGianSelection extends StatefulWidget {
  @override
  KTGioiHanThoiGianSelectionState createState() => KTGioiHanThoiGianSelectionState();
}

class KTGioiHanThoiGianSelectionState extends State<KTGioiHanThoiGianSelection> {

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // _showDialog(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kiểm tra giới hạn thời gian",
          style: TextStyle(fontSize: 30),
        ),
        // backgroundColor: Color(0xFFFFDADA),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


          HeadBarKiemTra(type: 'kiem_tra_gioi_han_thoi_gian'),

          BodyScreen(type: 'random')

        ],
      ),
    );
  }
}