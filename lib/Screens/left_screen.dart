import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class LeftScreen extends StatefulWidget {
  @override
  LeftScreenState createState() => LeftScreenState();
}

class LeftScreenState extends State<LeftScreen> {
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
                            style: TextStyle(color: Colors.green, fontSize: 20),
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
                    onPressed: () => {},
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
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: Text(
                  'Aloha',
                  style: TextStyle(color: Colors.purple, fontSize: 20),
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
                            style: TextStyle(color: Colors.green, fontSize: 20),
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
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: StreamBuilder(
                    //realtime
                    stream: FirebaseFirestore.instance
                        .collection('datk') //from messages
                        .doc('user_typed_recently')
                        .collection('hoc')
                        .orderBy('time', descending: true)
                        .limit(1)
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                            snapshot.data.docs[0]
                                .data()['content']
                                .toString(),
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                        );
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
