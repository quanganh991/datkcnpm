import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datk/Screens/left_screen.dart';
import 'package:datk/Screens/right_screen.dart';
import 'package:datk/dialogs/dialog_Hoc_Go_Am.dart';
import 'package:datk/keyboard/stenoLeft.dart';
import 'package:datk/keyboard/stenoRight.dart';
import 'package:datk/keyboard/qwertyLeft.dart';
import 'package:datk/keyboard/qwertyRight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:datk/keyboard/switch_keyboard.dart';

class HocGoAmSelection extends StatefulWidget {
  @override
  HocGoAmSelectionState createState() => HocGoAmSelectionState();
}

class HocGoAmSelectionState extends State<HocGoAmSelection> {

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // _showDialog(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Học gõ âm",
          style: TextStyle(fontSize: 30),
        ),
        // backgroundColor: Color(0xFFFFDADA),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LeftScreen(),
          // RightScreen(),

          Material(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () => {
                        showDialog(
                            context: context, builder: (_) => DialogHocGoAm())
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
                            .snapshots(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return IconButton(
                              icon: Icon(Icons.keyboard),
                              onPressed: () => {
                                switch_keyboard.keyboard_switch((snapshot.data['state'] == 'qwerty') ? 'steno' : 'qwerty'),
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

          StreamBuilder(
            //realtime
              stream: FirebaseFirestore.instance
                  .collection('datk') //truy vấn bảng messages
                  .doc('state') //where
                  .snapshots(),
              builder:
                  (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return (snapshot.data['state'] == 'qwerty') ? QwertyLeft() : StenoLeft();
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