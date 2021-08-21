import 'package:datk/Screens/body_screen.dart';
import 'package:datk/dialogs/dialog_typing_state_information.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datk/Screens/left_screen.dart';
import 'package:datk/Screens/right_screen.dart';
import 'package:datk/dialogs/dialog_KT_Do_Chinh_Xac.dart';
import 'package:datk/dialogs/dialog_KT_Gioi_Han_Thoi_Gian.dart';
import 'package:datk/dialogs/dialog_KT_Toc_Do.dart';
import 'package:datk/dialogs/dialog_KT_Van_Ban_Tu_Nhap.dart';
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

class KTVanBanTuNhapSelection extends StatefulWidget {
  @override
  KTVanBanTuNhapSelectionState createState() => KTVanBanTuNhapSelectionState();
}

class KTVanBanTuNhapSelectionState extends State<KTVanBanTuNhapSelection> {

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // _showDialog(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kiểm tra qua văn bản tự nhập",
          style: TextStyle(fontSize: 30),
        ),
        // backgroundColor: Color(0xFFFFDADA),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


          HeadBarKiemTra(type: 'kiem_tra_van_ban_tu_nhap'),
          BodyScreen()

        ],
      ),
    );
  }
}