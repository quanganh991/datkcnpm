import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datk/dialogs/dialog_hint_steno_word.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:datk/image/configs.dart';

class LeftScreen extends StatefulWidget {
  @override
  LeftScreenState createState() => LeftScreenState();
}

class LeftScreenState extends State<LeftScreen> {
  // var tu_can_go = configs.random_words();
  var tu_can_go = FirebaseFirestore.instance
      .collection('datk') //from messages
      .doc('typing_dart')
      .collection('question_banking')
      .snapshots();

  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('datk') //bảng user
        .doc('typing_dart') //tại id mới
        .collection('typing_dart')
        .doc('typing_index')
        .set({
      'content': 'not_allowed',
      'time': 'not_allowed',
      'typing_index': 0
    });
  }

  String TuCanGo = '';

  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        // minHeight: 15.0,
        maxHeight: MediaQuery.of(context).size.height * 0.4,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                // padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Nội dung cần gõ",
                            style: TextStyle(
                                color: Color(0xFF005E2D), fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Material(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  margin: EdgeInsets.symmetric(horizontal: 6.0),
                  child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () => {
                      setState(() {
                        // tu_can_go = configs.random_words();
                        tu_can_go = FirebaseFirestore.instance
                            .collection('datk') //from messages
                            .doc('typing_dart')
                            .collection('question_banking')
                            .snapshots(); //lấy ra tất cả các từ cần gõ
                      })
                    },
                    color: Colors.grey,
                  ),
                ),
                color: Color(0xFFFFDADA),
              ),
              Center(
                child: IconButton(
                  icon: Icon(Icons.help_outline),
                  onPressed: () => {
                    showDialog(
                        context: context,
                        builder: (_) =>
                            HintStenoWordDialog(qwerty_word: TuCanGo))
                  },
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width * 0.95,
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF849A00))),
                  child: StreamBuilder(
                      stream: tu_can_go,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          int word_index =
                              Random().nextInt(snapshot.data.docs.length);
                          TuCanGo = snapshot.data.docs[word_index]
                              .data()['sentences']
                              .toString();

                          FirebaseFirestore.instance
                              .collection('datk') //bảng user
                              .doc('typing_dart') //tại id mới
                              .collection('typing_dart')
                              .doc('typing_index')
                              .set({
                            'content': 'not_allowed',
                            'time': 'not_allowed',
                            'typing_index': 0
                          });
                          return Container(
                            child: StreamBuilder(
                                //realtime
                                stream: FirebaseFirestore.instance
                                    .collection('datk') //truy vấn bảng messages
                                    .doc('typing_dart') //where
                                    .collection('typing_dart')
                                    .doc('typing_index')
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot cursor) {
                                  if (cursor.hasData) {
                                    List<String> word_ind = snapshot.data.docs[word_index]
                                        .data()['sentences']
                                        .toString().split(' ');
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      //Center Row contents horizontally,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      //Center Row contents vertically,
                                      children: [
                                        for(int i=0;i<word_ind.length;i++)

                                          Text(
                                          word_ind[i].toString()+' ',
                                          style: TextStyle(
                                              color:
                                              i<=int.parse(cursor.data['typing_index'].toString())
                                              ?
                                              Color(
                                                  0xFF0DA509
                                              )
                                              :
                                                  Color(
                                                    0xFF000000
                                                  )
                                              ,
                                              fontSize: 20),
                                          ),
                                      ],
                                    );
                                  } else {
                                    return Container();
                                  }
                                }),
                          );
                        } else {
                          return Container();
                        }
                      })),
            ],
          ),
          Row(
            children: [
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                // padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Kết quả đã gõ",
                            style: TextStyle(
                                color: Color(0xFF005E2D), fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width * 0.95,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xFF849A00))),
                child: StreamBuilder(
                    //realtime
                    stream: FirebaseFirestore.instance
                        .collection('datk') //from messages
                        .doc('user_typed_recently')
                        .collection('hoc')
                        .orderBy('time', descending: true)
                        .limit(1)
                        .snapshots(), //lấy từ vừa gõ
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        String begin = snapshot.data.docs[0]
                            .data()['content']
                            .toString()
                            .toUpperCase(); //từ vừa gõ
                        print('---------------begin == ' + begin);
                        return StreamBuilder(
                            //realtime
                            stream: FirebaseFirestore.instance
                                .collection('datk') //from messages
                                .doc('dictionary')
                                .collection('dictionary')
                                .doc(begin) //tìm trong bộ từ điển
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot mapping_word) {
                              if (!mapping_word.hasData ||
                                  !mapping_word.data.exists) {
                                return Text(
                                  'Bạn đã gõ sai, xin mời gõ lại',
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 20),
                                );
                              } else {
                                return Text(
                                  mapping_word.data[begin].toString(),
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 20),
                                );
                              }
                            });
                      } else {
                        return Container();
                      }
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
