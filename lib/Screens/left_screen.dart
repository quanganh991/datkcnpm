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
      constraints: new BoxConstraints(
        // minHeight: 15.0,
        maxHeight: MediaQuery.of(context).size.width * 0.75,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    // padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: FlatButton(
                      onPressed: () {
                        print("Tốc độ gõ đúng");
                      },
                      child: Row(
                        children: <Widget>[
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Tốc độ gõ đúng",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.all(5.0),
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
                                "0 từ / phút",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
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
                    // margin: const EdgeInsets.all(5.0),
                    // padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: FlatButton(
                      onPressed: () {
                        print("Tỉ lệ độ gõ đúng");
                      },
                      child: Row(
                        children: <Widget>[
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Tỉ lệ gõ đúng",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.all(5.0),
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
                                "50 %",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
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
                    // margin: const EdgeInsets.all(5.0),
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
                                "> 1/2",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.all(5.0),
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
                                "Bộ phím",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
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
                                "Số phím đã gõ",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.all(5.0),
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
                                "2 phím",
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontSize: 20),
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
                    // margin: const EdgeInsets.all(5.0),
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
                                "Thời gian gõ",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.all(5.0),
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
                                "0 phút",
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontSize: 20),
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
                    // margin: const EdgeInsets.all(5.0),
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
                                "Thời gian",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.all(5.0),
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
                              CountdownTimer(
                                textStyle: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontSize: 20),
                                endTime: DateTime.now()
                                    .millisecondsSinceEpoch +
                                    1000 * 900,
                                onEnd: () => {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Qwerty(),
            ],
          ),
          Column(
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
                                    color: Colors.green, fontSize: 20),
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
                    width: 500.0,
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red)),
                    child: Text(
                      'Aloha',
                      style:
                      TextStyle(color: Colors.purple, fontSize: 20),
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
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
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
                    width: 500.0,
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red)),
                    child: Text(
                      'Alohi',
                      style:
                      TextStyle(color: Colors.purple, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}