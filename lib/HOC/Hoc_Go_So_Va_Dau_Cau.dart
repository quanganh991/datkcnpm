import 'package:datk/dialogs/dialog_learning_dictionary.dart';
import 'package:datk/dialogs/dialog_typing_state_information.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datk/Screens/left_screen.dart';
import 'package:datk/Screens/right_screen.dart';
import 'package:datk/dialogs/dialog_Hoc_Go_So_Va_Dau_Cau.dart';
import 'package:datk/keyboard/qwertyLeft.dart';
import 'package:datk/keyboard/qwertyRight.dart';
import 'package:datk/keyboard/stenoLeft.dart';
import 'package:datk/keyboard/stenoRight.dart';
import 'package:flutter/material.dart';
import 'package:datk/keyboard/switch_keyboard.dart';
import 'package:datk/keyboard/get_device_info.dart';
import 'package:datk/keyboard/switch_keyboard.dart';
import 'package:datk/Screens/switch_screen.dart';

class HocGoSoSelection extends StatefulWidget {
  @override
  HocGoSoSelectionState createState() => HocGoSoSelectionState();
}

class HocGoSoSelectionState extends State<HocGoSoSelection> {

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // _showDialog(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Học gõ số",
          style: TextStyle(fontSize: 30),
        ),
        // backgroundColor: Color(0xFFFFDADA),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


          Material(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: IconButton(
                      icon: Icon(Icons.book_outlined),
                      onPressed: () => {
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
                  ),Center(
                    child: IconButton(
                      icon: Icon(Icons.details),
                      onPressed: () => {
                        showDialog(
                            context: context, builder: (_) => DialogTypingStateInformation())
                      },
                      color: Colors.grey,
                    ),
                  ),Center(
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () => {
                        showDialog(
                            context: context, builder: (_) => DialogHocGoSo())
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
                            .doc('keyboard_state').snapshots(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return IconButton(
                              icon: Icon(Icons.keyboard),
                              onPressed: () => {
                                switch_keyboard.keyboard_switch((snapshot.data['keyboard_state'] == 'qwerty') ? 'steno' : 'qwerty'),
                              },
                              color: Colors.grey,
                            );
                          } else {
                            return Container();
                          }
                        }),
                  ),
                  Center(
                    child: StreamBuilder(
                      //realtime
                        stream: FirebaseFirestore.instance
                            .collection('datk') //truy vấn bảng messages
                            .doc('state') //where
                            .collection('screen_state')
                            .doc('Redmi 7')
                            .snapshots(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return IconButton(
                              icon: Icon(Icons.screen_share_outlined),
                              onPressed: () => {
                                switch_screen.screen_switch(
                                    (snapshot.data['screen_state'] ==
                                        'right')
                                        ? 'left'
                                        : 'right'),
                              },
                              color: Colors.grey,
                            );
                          } else {
                            return Container();
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
          FutureBuilder(
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
                          return Container();
                        }
                      });
                } else {
                  return Container();
                }
              }),
          // QwertyLeft(),
          // QwertyRight(),
          // StenoLeft(),
          // StenoRight(),
        ],
      ),
    );
  }
}