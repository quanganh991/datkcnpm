import 'package:VietStenoGame/HOC/Hoc_Go_Am.dart';
import 'package:VietStenoGame/HOC/Hoc_Go_Tu_Do.dart';
import 'package:VietStenoGame/dialogs/dialog_Hoc_Go_Am.dart';
import 'package:VietStenoGame/dialogs/dialog_submit_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:VietStenoGame/HOC/Hoc_Go_Phim.dart';

import 'Hoc_Go_Cau.dart';
import 'Hoc_Go_So_Va_Dau_Cau.dart';
import 'Hoc_Go_Tu.dart';

class HocSelection extends StatefulWidget {
  @override
  HocSelectionState createState() => HocSelectionState();
}

class HocSelectionState extends State<HocSelection> {
  void initState() {
    super.initState();

    delete_history();
  }

  Future<void> delete_history() async{
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('datk')
        .doc('user_typed_recently')
        .collection('hoc')
        .where('time', isNotEqualTo: 'not_allowed')
        .get();
    final List<DocumentSnapshot> history_deleted = result.docs;
    for (int i = 0; i < history_deleted.length; i++) {
      FirebaseFirestore.instance //truy vấn 'messages' theo id
          .collection('datk') //from messages
          .doc('user_typed_recently')
          .collection('hoc')
          .doc(history_deleted[i]['time']).delete();
    }


    final QuerySnapshot nhap = await FirebaseFirestore.instance
        .collection('datk')
        .doc('typing_dart')
        .collection('typing_dart')
        .where('time', isNotEqualTo: 'not_allowed')
        .get();
    final List<DocumentSnapshot> nhap_deleted = nhap.docs;
    for (int i = 0; i < nhap_deleted.length; i++) {
      FirebaseFirestore.instance //truy vấn 'messages' theo id
          .collection('datk') //from messages
          .doc('typing_dart')
          .collection('typing_dart')
          .doc(nhap_deleted[i]['time']).delete();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Học",
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
              const SizedBox(height: 320.0),
              // Image.asset("lib/image/steno_keyboard.jpg"),



              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.red)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push( //điều hướng sang màn hình mới
                          context,  //điều hướng từ
                          MaterialPageRoute(  //điều hướng sang
                            builder: (context) => HocGoPhimSelection(),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset('lib/image/hoc_go_phim.png',
                              // width: 300,
                              height: 25,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Học gõ phím",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push( //điều hướng sang màn hình mới
                          context,  //điều hướng từ
                          MaterialPageRoute(  //điều hướng sang
                            builder: (context) => HocGoAmSelection(),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset('lib/image/hoc_go_am.png',
                              // width: 300,
                              height: 25,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Học gõ âm",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push( //điều hướng sang màn hình mới
                          context,  //điều hướng từ
                          MaterialPageRoute(  //điều hướng sang
                            builder: (context) => HocGoTuSelection(),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset('lib/image/hoc_go_tu.png',
                              // width: 300,
                              height: 25,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Học gõ từ",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push( //điều hướng sang màn hình mới
                          context,  //điều hướng từ
                          MaterialPageRoute(  //điều hướng sang
                            builder: (context) => HocGoCauSelection(),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset('lib/image/hoc_go_cau.png',
                              // width: 300,
                              height: 25,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Học gõ câu",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push( //điều hướng sang màn hình mới
                          context,  //điều hướng từ
                          MaterialPageRoute(  //điều hướng sang
                            builder: (context) => HocGoSoSelection(),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset('lib/image/hoc_go_so.jpg',
                              // width: 300,
                              height: 25,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Gõ số",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push( //điều hướng sang màn hình mới
                          context,  //điều hướng từ
                          MaterialPageRoute(  //điều hướng sang
                            builder: (context) => HocGoTuDoSelection(),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset('lib/image/hoc_go_tu_do.jpg',
                              // width: 300,
                              height: 25,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Gõ tự do",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // DialogSubmitType(),
        ],
      ),
    );
  }
}
