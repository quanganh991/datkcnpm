import 'package:VietStenoGame/THIET_LAP/Huong_Dan.dart';
import 'package:VietStenoGame/THIET_LAP/Lich_Su.dart';
import 'package:VietStenoGame/THIET_LAP/Phan_Hoi.dart';
import 'package:VietStenoGame/THIET_LAP/Xep_Hang.dart';
import 'package:VietStenoGame/THI_DAU/loading_game_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:VietStenoGame/KIEM_TRA/Selection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HOC/Selection.dart';
import 'THI_DAU/Selection.dart';
import 'package:device_info/device_info.dart';
import 'package:VietStenoGame/keyboard/get_device_info.dart';

import 'dialogs/dialog_Partner_Management.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              //màu nền của ứng dụng
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF00001E),
                  Color(0xFF0F0F6C),
                  Color(0xFF5F5FE8),
                  Color(0xFFBDBDFF),
                ],
                stops: [0.35, 0.55, 0.75, 1],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0.9),
                      margin: EdgeInsets.symmetric(horizontal: 0.9),
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.connect_without_contact),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => FutureBuilder(
                                    future: get_device_info.user_partner_phone(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot smartphone) {
                                      if (smartphone.hasData) {
                                        return DialogPartnerManagement(
                                            device_info: smartphone.data);
                                      } else
                                        return Container();
                                    }),
                              );
                            },
                            color: Color(0xFFFFFFFF),
                          ),
                          Container(
                            color: Color(0xFF00001E),
                            padding: EdgeInsets.symmetric(horizontal: 0.9),
                            margin: EdgeInsets.symmetric(horizontal: 0.9),
                            child: Text("Đối tác",
                                style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xFF00001E),
                  ),
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0.9),
                      margin: EdgeInsets.symmetric(horizontal: 0.9),
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.bar_chart_outlined),
                            // onPressed: getSticker,
                            color: Color(0xFFFFFFFF),
                            onPressed: () {
                              Navigator.push(
                                //điều hướng sang màn hình mới
                                context, //điều hướng từ
                                MaterialPageRoute(
                                  //điều hướng sang
                                  builder: (context) => XepHang(),
                                ),
                              );
                            },
                          ),
                          Container(
                            color: Color(0xFF00001E),
                            padding: EdgeInsets.symmetric(horizontal: 0.9),
                            margin: EdgeInsets.symmetric(horizontal: 0.9),
                            child: Text("Xếp hạng",
                                style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xFF00001E),
                  ),
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0.9),
                      margin: EdgeInsets.symmetric(horizontal: 0.9),
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.event_note_rounded),
                            // onPressed: getSticker,
                            color: Color(0xFFFFFFFF),
                            onPressed: () {
                              Navigator.push(
                                //điều hướng sang màn hình mới
                                context, //điều hướng từ
                                MaterialPageRoute(
                                  //điều hướng sang
                                  builder: (context) => LichSu(),
                                ),
                              );
                            },
                          ),
                          Container(
                            color: Color(0xFF00001E),
                            padding: EdgeInsets.symmetric(horizontal: 0.9),
                            margin: EdgeInsets.symmetric(horizontal: 0.9),
                            child: Text("Lịch sử",
                                style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xFF00001E),
                  ),
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0.9),
                      margin: EdgeInsets.symmetric(horizontal: 0.9),
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.comment_rounded),
                            onPressed: () => {
                              Navigator.push(
                                //điều hướng sang màn hình mới
                                context, //điều hướng từ
                                MaterialPageRoute(
                                  //điều hướng sang
                                  builder: (context) => PhanHoi(),
                                ),
                              )
                            },
                            color: Color(0xFFFFFFFF),
                          ),
                          Container(
                            color: Color(0xFF00001E),
                            padding: EdgeInsets.symmetric(horizontal: 0.9),
                            margin: EdgeInsets.symmetric(horizontal: 0.9),
                            child: Text("Phản hồi",
                                style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xFF00001E),
                  ),
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0.9),
                      margin: EdgeInsets.symmetric(horizontal: 0.9),
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.wb_incandescent_rounded),
                            onPressed: () => {
                              Navigator.push(
                                //điều hướng sang màn hình mới
                                context, //điều hướng từ
                                MaterialPageRoute(
                                  //điều hướng sang
                                  builder: (context) => HuongDan(),
                                ),
                              )
                            },
                            color: Color(0xFFFFFFFF),
                          ),
                          Container(
                            color: Color(0xFF00001E),
                            padding: EdgeInsets.symmetric(horizontal: 0.9),
                            margin: EdgeInsets.symmetric(horizontal: 0.9),
                            child: Text("Hướng dẫn",
                                style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xFF00001E),
                  ),
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0.9),
                      margin: EdgeInsets.symmetric(horizontal: 0.9),
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.exit_to_app),
                            onPressed: () => {
                              GoogleSignIn().signOut(),
                              Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(
                                      Navigator.defaultRouteName))
                            },
                            color: Color(0xFFFFFFFF),
                          ),
                          Container(
                            color: Color(0xFF00001E),
                            padding: EdgeInsets.symmetric(horizontal: 0.9),
                            margin: EdgeInsets.symmetric(horizontal: 0.9),
                            child: Text("Đăng xuất",
                                style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                    color: Color(0xFF00001E),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              // Image.asset("lib/image/steno_keyboard.jpg"),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Image.asset('lib/image/steno_keyboard.jpg',
                    // width: 300,
                    height: 150,
                    fit: BoxFit.fill),
              ),

              const SizedBox(height: 80.0),

              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 92.0),
                  child: FlatButton(
                    color: Colors.orangeAccent,
                    onPressed: () {
                      Navigator.push(
                        //điều hướng sang màn hình mới
                        context, //điều hướng từ
                        MaterialPageRoute(
                          //điều hướng sang
                          builder: (context) => HocSelection(),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Image.asset('lib/image/HOC.png',
                            // width: 300,
                            height: 50,
                            fit: BoxFit.fill),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Học",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40.0),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 92.0),
                  child: FlatButton(
                    color: Colors.yellowAccent,
                    onPressed: () {
                      Navigator.push(
                        //điều hướng sang màn hình mới
                        context, //điều hướng từ
                        MaterialPageRoute(
                          //điều hướng sang
                          builder: (context) => KiemtraSelection(),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Image.asset('lib/image/KIEM_TRA.jpg',
                            // width: 100,
                            height: 40,
                            fit: BoxFit.fill),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Kiểm Tra",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 92.0),
                  child: FlatButton(
                    color: Colors.greenAccent,
                    onPressed: () {
                      Navigator.push(
                        //điều hướng sang màn hình mới
                        context, //điều hướng từ
                        MaterialPageRoute(
                          //điều hướng sang
                          builder: (context) => LoadingGame(title: "Chiến thắng đại dịch Covid-19"),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Image.asset('lib/image/THI_DAU.png',
                            // width: 300,
                            height: 50,
                            fit: BoxFit.fill),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Thi Đấu",
                              style: TextStyle(
                                  color: Colors.deepOrangeAccent, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
