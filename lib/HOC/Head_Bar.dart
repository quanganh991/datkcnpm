import 'dart:ffi';
import 'package:VietStenoGame/dialogs/dialog_Hoc_Go_Cau.dart';
import 'package:VietStenoGame/dialogs/dialog_Hoc_Go_Phim.dart';
import 'package:VietStenoGame/dialogs/dialog_Hoc_Go_So_Va_Dau_Cau.dart';
import 'package:VietStenoGame/dialogs/dialog_Hoc_Go_Tu.dart';
import 'package:VietStenoGame/dialogs/dialog_Hoc_Go_Tu_Do.dart';
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

class HeadBarHoc extends StatefulWidget {
  final String type;

  @override
  HeadBarHoc({Key? key, required this.type}) : super(key: key);

  HeadBarHocState createState() => HeadBarHocState();
}

class HeadBarHocState extends State<HeadBarHoc> {
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
                icon: Icon(Icons.book_outlined),
                onPressed: () => {
                  // showDialog(
                  //     context: context, builder: (_) => DialogTraTuDien())
                  Navigator.push(
                    //điều hướng sang màn hình mới
                    context, //điều hướng từ
                    MaterialPageRoute(
                      //điều hướng sang
                      builder: (context) => DialogTraTuDien(),
                    ),
                  )
                },
                color: Colors.grey,
              ),
            ),
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
                  if (type == 'hoc_go_am'){
                    showDialog(
                        context: context, builder: (_) =>
                        DialogHocGoAm()
                    )
                  } else if (type == 'hoc_go_cau'){
                    showDialog(
                        context: context, builder: (_) =>
                        DialogHocGoCau()
                    )
                  } else if (type == 'hoc_go_phim'){
                    showDialog(
                        context: context, builder: (_) =>
                        DialogHocGoPhim()
                    )
                  } else if (type == 'hoc_go_so'){
                    showDialog(
                        context: context, builder: (_) =>
                        DialogHocGoSo()
                    )
                  } else if (type == 'hoc_go_tu'){
                    showDialog(
                        context: context, builder: (_) =>
                        DialogHocGoTu()
                    )
                  } else if (type == 'hoc_go_tu_do'){
                    showDialog(
                        context: context, builder: (_) =>
                        DialogHocGoTuDo()
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
              child:
              FutureBuilder(
              future: get_device_info.device_info(),
              builder: (BuildContext context, AsyncSnapshot device_info) {
                if (device_info.hasData){
                  return StreamBuilder(
                //realtime
                  stream: FirebaseFirestore.instance
                      .collection('datk') //truy vấn bảng messages
                      .doc('state') //where
                      .collection('screen_state')
                      .doc(device_info.data)
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
                  });
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
