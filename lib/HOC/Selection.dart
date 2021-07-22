import 'package:datk/HOC/Hoc_Go_Am.dart';
import 'package:datk/HOC/Hoc_Go_Tu_Do.dart';
import 'package:datk/dialogs/dialog_Hoc_Go_Am.dart';
import 'package:flutter/material.dart';
import 'package:datk/HOC/Hoc_Go_Phim.dart';

import 'Hoc_Go_Cau.dart';
import 'Hoc_Go_So_Va_Dau_Cau.dart';
import 'Hoc_Go_Tu.dart';

class HocSelection extends StatefulWidget {
  @override
  HocSelectionState createState() => HocSelectionState();
}

class HocSelectionState extends State<HocSelection> {
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
                    margin: const EdgeInsets.all(15.0),
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
                              height: 50,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Học gõ phím",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
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
                              height: 50,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Học gõ âm",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 20),
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
                    margin: const EdgeInsets.all(15.0),
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
                              height: 50,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Học gõ từ",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
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
                              height: 50,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Học gõ câu",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 20),
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
                    margin: const EdgeInsets.all(15.0),
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
                              height: 50,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Gõ số",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
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
                              height: 50,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Gõ tự do",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 20),
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
        ],
      ),
    );
  }
}
