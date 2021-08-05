import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:datk/image/configs.dart';

class LeftScreen extends StatefulWidget {
  @override
  LeftScreenState createState() => LeftScreenState();
}

class LeftScreenState extends State<LeftScreen> {
  String tu_can_go = configs.random_words();

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
                            style: TextStyle(color: Color(0xFF005E2D), fontSize: 20),
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
                        tu_can_go = configs.random_words();
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
                height: 100.0,
                width: MediaQuery.of(context).size.width * 0.95,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xFF849A00))),
                child: Text(
                  tu_can_go,
                  style: TextStyle(color: Color(0xFF000000), fontSize: 20),
                ),
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
                            "Kết quả đã gõ",
                            style: TextStyle(color: Color(0xFF005E2D), fontSize: 20),
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
                                  //trả về từ tiếng việt của từ gõ tốc ký tương ứng
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 20),
                                );
                                ;
                              } else {
                                return Text(
                                  mapping_word.data[begin].toString(),
                                  //trả về từ tiếng việt của từ gõ tốc ký tương ứng
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
