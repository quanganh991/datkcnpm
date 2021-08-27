import 'dart:ffi';
import 'package:VietStenoGame/Screens/body_screen.dart';
import 'package:VietStenoGame/dialogs/dialog_typing_state_information.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:VietStenoGame/Screens/left_screen.dart';
import 'package:VietStenoGame/Screens/right_screen.dart';
import 'package:VietStenoGame/dialogs/dialog_Hoc_Go_Am.dart';
import 'package:VietStenoGame/keyboard/stenoLeft.dart';
import 'package:VietStenoGame/keyboard/stenoRight.dart';
import 'package:VietStenoGame/keyboard/qwertyLeft.dart';
import 'package:VietStenoGame/keyboard/qwertyRight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:VietStenoGame/keyboard/switch_keyboard.dart';
import 'package:VietStenoGame/keyboard/get_device_info.dart';
import 'package:VietStenoGame/keyboard/switch_keyboard.dart';
import 'package:VietStenoGame/Screens/switch_screen.dart';

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
                        child: FutureBuilder(
                          future: get_device_info.device_info(),
                          builder: (BuildContext context,
                              AsyncSnapshot device_info) {
                            if (device_info.hasData) {
                              return StreamBuilder(
                                  //realtime
                                  stream: FirebaseFirestore.instance
                                      .collection(
                                          'datk') //truy vấn bảng messages
                                      .doc('state') //where
                                      .collection('screen_state')
                                      .doc(device_info.data)
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
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
                                  });
                              ;
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),



              BodyScreen(type: 'random'),



            ],
          ),
        ],
      ),
    );
  }
}
