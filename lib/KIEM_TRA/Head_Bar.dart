import 'dart:ffi';
import 'package:VietStenoGame/dialogs/dialog_Hoc_Go_Cau.dart';
import 'package:VietStenoGame/dialogs/dialog_Hoc_Go_Phim.dart';
import 'package:VietStenoGame/dialogs/dialog_Hoc_Go_So_Va_Dau_Cau.dart';
import 'package:VietStenoGame/dialogs/dialog_Hoc_Go_Tu.dart';
import 'package:VietStenoGame/dialogs/dialog_Hoc_Go_Tu_Do.dart';
import 'package:VietStenoGame/dialogs/dialog_KT_Do_Chinh_Xac.dart';
import 'package:VietStenoGame/dialogs/dialog_KT_Do_Kho.dart';
import 'package:VietStenoGame/dialogs/dialog_KT_Gioi_Han_Thoi_Gian.dart';
import 'package:VietStenoGame/dialogs/dialog_KT_Toc_Do.dart';
import 'package:VietStenoGame/dialogs/dialog_KT_Van_Ban_Tu_Nhap.dart';
import 'package:VietStenoGame/dialogs/dialog_hint_steno_word.dart';
import 'package:VietStenoGame/dialogs/dialog_learning_dictionary.dart';
import 'package:VietStenoGame/dialogs/dialog_typing_state_information.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:VietStenoGame/Screens/left_screen.dart';
import 'package:VietStenoGame/Screens/right_screen.dart';
import 'package:VietStenoGame/dialogs/dialog_Hoc_Go_Am.dart';
import 'package:VietStenoGame/keyboard/stenoLeft.dart';
import 'package:VietStenoGame/keyboard/stenoRight.dart';
import 'package:VietStenoGame/keyboard/qwertyLeft.dart';
import 'package:VietStenoGame/keyboard/qwertyRight.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:VietStenoGame/keyboard/switch_keyboard.dart';
import 'package:VietStenoGame/keyboard/get_device_info.dart';
import 'package:VietStenoGame/Screens/switch_screen.dart';

class HeadBarKiemTra extends StatefulWidget {
  final String type;

  @override
  HeadBarKiemTra({Key? key, required this.type}) : super(key: key);

  HeadBarKiemTraState createState() => HeadBarKiemTraState();
}

class HeadBarKiemTraState extends State<HeadBarKiemTra> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    String type = widget.type;
    return Material(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: IconButton(
                icon: Icon(Icons.details),
                onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (_) => DialogTypingStateInformation())
                },
                color: Colors.grey,
              ),
            ),
            Center(
              child: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => {
                  if (type == 'kiem_tra_do_chinh_xac'){
                    showDialog(
                        context: context, builder: (_) =>
                        DialogKTDoChinhXac()
                    )
                  } else if (type == 'kiem_tra_do_kho'){
                    showDialog(
                        context: context, builder: (_) =>
                        DialogKTDoKho()
                    )
                  } else if (type == 'kiem_tra_gioi_han_thoi_gian'){
                    showDialog(
                        context: context, builder: (_) =>
                        DialogKTGioiHanThoiGian()
                    )
                  } else if (type == 'kiem_tra_toc_do'){
                    showDialog(
                        context: context, builder: (_) =>
                        DialogKTTocDo()
                    )
                  } else if (type == 'kiem_tra_van_ban_tu_nhap'){
                    showDialog(
                        context: context, builder: (_) =>
                        DialogKTVanBanTuNhap()
                    )
                  }

                },
                color: Colors.grey,
              ),
            ),
            Center(
              child: StreamBuilder(
                //realtime
                  stream: FirebaseFirestore.instance
                      .collection('datk') //truy vấn bảng messages
                      .doc('state') //where
                      .collection('keyboard_state')
                      .doc('keyboard_state')
                      .snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return IconButton(
                        icon: Icon(Icons.keyboard),
                        onPressed: () => {
                          switch_keyboard.keyboard_switch(
                              (snapshot.data['keyboard_state'] ==
                                  'qwerty')
                                  ? 'steno'
                                  : 'qwerty'),
                        },
                        color: Colors.grey,
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
            Center(
              child: FutureBuilder(
              future: get_device_info.device_info(),
              builder: (BuildContext context, AsyncSnapshot evice_info) {
                if (evice_info.hasData){
                  return StreamBuilder(
                //realtime
                  stream: FirebaseFirestore.instance
                      .collection('datk') //truy vấn bảng messages
                      .doc('state') //where
                      .collection('screen_state')
                      .doc(evice_info.data)
                      .snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return IconButton(
                        icon: Icon(Icons.screen_share_outlined),
                        onPressed: () => {
                          switch_screen.screen_switch(
                              (snapshot.data['screen_state'] == 'right')
                                  ? 'left'
                                  : 'right'),
                        },
                        color: Colors.grey,
                      );
                    } else {
                      return Container();
                    }
                  });;
                }else {
                  return Container();
                }
              },
          ),
            ),
          ],
        ),
      ),
    );
  }
}
