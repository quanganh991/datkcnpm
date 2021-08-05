import 'dart:ffi';
import 'package:datk/dialogs/dialog_typing_state_information.dart';

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
import 'package:datk/keyboard/get_device_info.dart';
import 'package:datk/keyboard/switch_keyboard.dart';
import 'package:datk/Screens/switch_screen.dart';

class ThiDauRoom extends StatefulWidget {
  @override
  ThiDauRoomState createState() => ThiDauRoomState();
}

class ThiDauRoomState extends State<ThiDauRoom> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // _showDialog(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thi đấu gõ tốc ký",
          style: TextStyle(fontSize: 30),
        ),
        // backgroundColor: Color(0xFFFFDADA),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              child: FutureBuilder(
                  future: get_device_info.device_info(),
                  builder: (BuildContext context, AsyncSnapshot smartphone) {
                    if (smartphone.hasData) {
                      String model = smartphone.data;
                      return StreamBuilder(
                          //realtime
                          stream: FirebaseFirestore.instance
                              .collection('datk') //truy vấn bảng messages
                              .doc('state') //where
                              .collection('screen_state')
                              .doc(model)
                              .snapshots(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              String state =
                                  snapshot.data['screen_state'] == 'left'
                                      ? 'left'
                                      : 'right';
                              return Image.asset(
                                  'lib/image/game_background_' + state + '.jpg',
                                  // width: 300,
                                  height: 150,
                                  fit: BoxFit.fill);
                            } else {
                              return Container();
                            }
                          });
                    } else {
                      return Container();
                    }
                  }),
            ),
          ),
          Column(
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
                          builder: (BuildContext context,
                              AsyncSnapshot smartphone_firestore) {
                            if (smartphone_firestore.hasData) {
                              String screen = smartphone_firestore
                                  .data['screen_state']
                                  .toString();
                              return screen == 'left'
                                  ? Column(
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
                                                return (snapshot.data[
                                                            'keyboard_state'] ==
                                                        'qwerty')
                                                    ? QwertyLeft()
                                                    : StenoLeft();
                                              } else {
                                                return Container();
                                              }
                                            }),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        // RightScreen(),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.75),
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
                                                return (snapshot.data[
                                                            'keyboard_state'] ==
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
            ],
          ),
        ],
      ),
    );
  }
}
