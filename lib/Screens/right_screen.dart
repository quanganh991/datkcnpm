import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class RightScreen extends StatefulWidget {
  @override
  RightScreenState createState() => RightScreenState();
}

class RightScreenState extends State<RightScreen> {
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        // minHeight: 15.0,
        maxHeight: MediaQuery.of(context).size.width * 0.75,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                // padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            "Kết quả tốc ký",
                            style: TextStyle(
                                color: Colors.deepOrange, fontSize: 20),
                          ),
                          Text(
                            "Lưu ý: Tắt phần mềm gõ tiếng Việt khi sử dụng gõ tốc ký",
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  StreamBuilder(
                      //realtime
                      stream: FirebaseFirestore.instance
                          .collection('datk') //from messages
                          .doc('user_typed_recently')
                          .collection('hoc')
                          .orderBy('time', descending: true)
                          .limit(10)
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        List<String> s = [];
                        if (snapshot.hasData) {
                          // print(snapshot.data.docs.length);
                          // print('-----djvndia'+snapshot.data.docs[0].data()['content']);
                          for (int i = 0; i < snapshot.data.docs.length; i++) {
                            s.add(snapshot.data.docs[i]
                                    .data()['time']
                                    .toString() +
                                " : " +
                                snapshot.data.docs[i]
                                    .data()['content']
                                    .toString());
                          }
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.9,
                            margin: const EdgeInsets.all(5.0),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  for (int i = 0; i < snapshot.data.docs.length; i++)
                                  Text(
                                    s[i],
                                    style: TextStyle(
                                        color: i % 2 == 0
                                            ? Color(0xFFDE0000)
                                            : Color(0xFF00D202),
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
