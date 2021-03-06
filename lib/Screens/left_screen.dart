import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:VietStenoGame/dialogs/dialog_hint_steno_word.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:VietStenoGame/image/configs.dart';

class LeftScreen extends StatefulWidget {
  final String type;
  LeftScreen({Key? key, required this.type}) : super(key: key);
  @override
  LeftScreenState createState() => LeftScreenState();
}

class LeftScreenState extends State<LeftScreen> {
  Stream<QuerySnapshot<Map<String, dynamic>>> query_question_banking(String type){
    return
      type == 'random'
      ?
      FirebaseFirestore.instance
      .collection('datk') //from messages
      .doc('typing_dart')
      .collection('question_banking')
      .snapshots()
      :
      FirebaseFirestore.instance
          .collection('datk') //from messages
          .doc('typing_dart')
          .collection('question_banking')
          .where('type', isEqualTo: type)
          .snapshots()
      ;
  }
  late Stream<QuerySnapshot<Map<String, dynamic>>> tu_can_go;

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

    tu_can_go = query_question_banking(widget.type);
  }

  String TuCanGo = '';

  Widget build(BuildContext context) {
    String type = widget.type;
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
                        tu_can_go = query_question_banking(type);
                      })
                    },
                    color: Colors.grey,
                  ),
                ),
                color: Color(0xFFFFDADA),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  height: 40.0,
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
                                              i<int.parse(cursor.data['typing_index'].toString())
                                              ?
                                              Color(
                                                  0xFF0DA509
                                              )
                                              :
                                              (
                                                  i == int.parse(cursor.data['typing_index'].toString())
                                                  ?
                                                  Color(
                                                      0xFFC97101
                                                  )
                                                  :
                                                  Color(
                                                      0xFF000000
                                                  )
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
                height: 40.0,
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
                                .where('time', isNotEqualTo: "not_allowed")
                                .limit(1)
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot mapping_word) {
                              if (mapping_word.hasData && mapping_word.data.docs.length > 0) {
                                return Text(
                                  mapping_word.data.docs[0].data()['meaning'].toString(),
                                  style: TextStyle(fontSize: 20),
                                );
                              } else {
                                return Container();
                              }
                            }),
              ),
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
                            "Gợi ý",
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
                height: 40.0,
                width: MediaQuery.of(context).size.width * 0.95,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                decoration:
                BoxDecoration(border: Border.all(color: Color(0xFF849A00))),
                child: StreamBuilder(
                  //realtime
                    stream: FirebaseFirestore.instance
                        .collection('datk') //from messages
                        .doc('typing_dart')
                        .collection('typing_dart')
                        .where('time', isEqualTo: "not_allowed")
                        .limit(1)
                        .snapshots(), //lấy ra con trỏ vị trí của từ đang gõ
                    builder: (BuildContext context,
                        AsyncSnapshot mapping_word) {
                      if (mapping_word.hasData && mapping_word.data.docs.length > 0) {
                        if (TuCanGo.toString() == 'null')
                          return Container();
                        else {
                          int cursor = int.parse(mapping_word.data.docs[0]
                              .data()['typing_index']
                              .toString()); //lấy vị trí con trỏ
                          String qwerty = TuCanGo;
                          List<String> split_qwerty = qwerty.split(" ");

                          for(int i=0;i<split_qwerty.length;i++){
                            print(split_qwerty[i]);
                          }
                          //lấy đáp án của tất cả các câu hỏi
                          return StreamBuilder(
                            //realtime
                              stream: FirebaseFirestore.instance
                                  .collection('datk') //from messages
                                  .doc('dictionary')
                                  .collection('dictionary')
                                  .where('value', isEqualTo: split_qwerty[cursor%split_qwerty.length])  //isEqualto mùa, xuân, hoa, nở
                                  .limit(1)
                                  .snapshots(), //lấy từ vừa gõ
                              builder: (BuildContext context, AsyncSnapshot snapshot) {
                                if (!snapshot.hasData || snapshot.hasError || snapshot.data.docs.length < 1) {
                                  return Container();
                                }
                                else {

                                    FirebaseFirestore.instance
                                        .collection('datk') //bảng user
                                        .doc('typing_dart') //tại id mới
                                        .collection('answer_key')
                                        .doc('0')
                                        .set({
                                      '0':snapshot.data.docs[0]
                                          .data()['key']
                                          .toString()
                                    });

                                     String hint = snapshot.data.docs[0]
                                          .data()['key']
                                          .toString()
                                          +
                                          " -> "
                                          +
                                          snapshot.data.docs[0]
                                              .data()['value']
                                              .toString()
                                          +
                                          "\n";
                                  return Text(
                                      hint,
                                      style: TextStyle(
                                      color: Color(0xFFFF1919),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold));
                                }
                              });
                        }
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
