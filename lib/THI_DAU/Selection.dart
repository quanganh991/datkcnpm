import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datk/HOC/Hoc_Go_Am.dart';
import 'package:datk/HOC/Hoc_Go_Tu_Do.dart';
import 'package:datk/THI_DAU/Thi_Dau.dart';
import 'package:datk/dialogs/dialog_Hoc_Go_Am.dart';
import 'package:flutter/material.dart';
import 'package:datk/HOC/Hoc_Go_Phim.dart';

class ThiDauSelection extends StatefulWidget {
  @override
  ThiDauSelectionState createState() => ThiDauSelectionState();
}

class ThiDauSelectionState extends State<ThiDauSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ghép đôi",
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
              child: Image.asset('lib/image/selection_background.JPG',
                  // width: 300,
                  height: 150,
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            children: <Widget>[
              //MediaQuery.of(context).size.width * 0.75
              const SizedBox(height: 320.0),
              // Image.asset("lib/image/steno_keyboard.jpg"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.red)),
                    child: FlatButton(
                      onPressed: () {
                        // Navigator.push( //điều hướng sang màn hình mới
                        //   context,  //điều hướng từ
                        //   MaterialPageRoute(  //điều hướng sang
                        //     builder: (context) => HocGoSoSelection(),
                        //   ),
                        // );
                      },
                      child: StreamBuilder(
                          //realtime
                          stream: FirebaseFirestore.instance
                              .collection('users') //truy vấn bảng messages
                              .doc('DYzVAdb0NCS4KWgXWPicqorhyzL2') //where
                              .snapshots(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: <Widget>[
                                  CachedNetworkImage(
                                    // width: 300,
                                    height: 50,
                                    fit: BoxFit.fill,
                                    imageUrl:
                                        snapshot.data['photoUrl'].toString(),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data['nickname'],
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 20),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.red)),
                    child: FlatButton(
                      onPressed: () {
                      },
                      child: StreamBuilder(
                          //realtime
                          stream: FirebaseFirestore.instance
                              .collection('users') //truy vấn bảng messages
                              .doc('0NhgoLlSWphKQ7a6WQsBcLcOnJl1') //where
                              .snapshots(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: <Widget>[
                                  CachedNetworkImage(
                                    // width: 300,
                                    height: 50,
                                    fit: BoxFit.fill,
                                    imageUrl:
                                    snapshot.data['photoUrl'],
                                  ),
                                  Text(
                                    snapshot.data['nickname'],
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 20),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: Align(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.red)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          //điều hướng sang màn hình mới
                          context, //điều hướng từ
                          MaterialPageRoute(
                            //điều hướng sang
                            builder: (context) => ThiDauRoom(),
                          ),
                        );
                      },
                      child: Text(
                        "Bắt đầu chơi",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}