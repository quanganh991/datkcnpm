import 'dart:ffi';
import 'package:datk/HOC/Head_Bar.dart';
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

class BodyScreen extends StatefulWidget {
  @override
  BodyScreenState createState() => BodyScreenState();
}

class BodyScreenState extends State<BodyScreen> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // _showDialog(context);
    return FutureBuilder(
        future: get_device_info.device_info(),
        builder: (BuildContext context, AsyncSnapshot smartphone) {
          if (smartphone.hasData) {
            String model = smartphone.data;
            return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('datk') //truy vấn bảng messages
                    .doc('state') //where
                    .collection('screen_state')
                    .doc(model)
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot smartphone_firestore) {
                  if (smartphone_firestore.hasData) {
                    String screen = smartphone_firestore.data['screen_state'].toString();
                    return screen == 'left' ?
                    Column(
                      children: [
                        LeftScreen(),
                        StreamBuilder(
                          //realtime
                            stream: FirebaseFirestore.instance
                                .collection(
                                'datk') //truy vấn bảng messages
                                .doc('state') //where
                                .collection('keyboard_state')
                                .doc('keyboard_state')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return (snapshot.data['keyboard_state'] ==
                                    'qwerty')
                                    ? QwertyLeft()
                                    : StenoLeft();
                              } else {
                                return Container();
                              }
                            }),
                      ],
                    )
                        :
                    Column(
                      children: [
                        RightScreen(),
                        StreamBuilder(
                          //realtime
                            stream: FirebaseFirestore.instance
                                .collection(
                                'datk') //truy vấn bảng messages
                                .doc('state') //where
                                .collection('keyboard_state')
                                .doc('keyboard_state')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return (snapshot.data['keyboard_state'] ==
                                    'qwerty')
                                    ? QwertyRight()
                                    : StenoRight();
                              } else {
                                return Container();
                              }
                            }),
                      ],
                    );
                  } else {
                    FirebaseFirestore.instance
                        .collection('datk') //bảng user
                        .doc('state') //tại id mới
                        .collection('screen_state')
                        .doc(model)
                        .set({
                      'screen_state': 'left',
                    });
                    return Container();
                  }
                });
          } else {
            return Container();
          }
        });
  }
}
