import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:VietStenoGame/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:VietStenoGame/mapping_steno.dart';

import 'Selection.dart';
class LoadingGame extends StatefulWidget {
  LoadingGame({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  LoadingGameState createState() => LoadingGameState();
}

class LoadingGameState extends State<LoadingGame> {
  bool _loading = false;
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();

    _loading = true;
    _updateProgress();

    // mapping_steno.qwerty_to_steno();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
                color: Color(0xFFBA1313), fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
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
                child: Image.asset('lib/image/covid19_loading.jpg',
                    // width: 300,
                    height: 150,
                    fit: BoxFit.fill),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 120.0),
                Align(
                  child: _loading
                      ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearPercentIndicator(
                        trailing: Icon(Icons.mood),
                        // animation: true,
                        animationDuration: 9000,
                        center:Text('${(_progressValue * 100).round()}%',style: TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF))),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        alignment:  MainAxisAlignment.center,
                        width: 300.0,
                        lineHeight: 24.0,
                        percent: _progressValue,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ) : Center(
                    child:
                    Column(children: [
                      FlatButton(
                        onPressed: (){
                          Navigator.push(
                            //điều hướng sang màn hình mới
                            context, //điều hướng từ
                            MaterialPageRoute(
                              //điều hướng sang
                              builder: (context) => ThiDauSelection(),
                            ),
                          );
                        },
                        child: Text(
                          'Dễ (Chủng Vũ Hán)',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        color: Color(0xfffffb00),
                        highlightColor: Color(0xffff7f7f),
                        splashColor: Colors.transparent,
                        textColor: Color(0xFF000000),
                        padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                      ),
                      SizedBox(height: 15,),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(
                            //điều hướng sang màn hình mới
                            context, //điều hướng từ
                            MaterialPageRoute(
                              //điều hướng sang
                              builder: (context) => ThiDauSelection(),
                            ),
                          );
                        },
                        child: Text(
                          'Trung Bình (Chủng Anh)',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        color: Color(0xFF005CFF),
                        highlightColor: Color(0xffff7f7f),
                        splashColor: Colors.transparent,
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                      ),
                      SizedBox(height: 15,),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(
                            //điều hướng sang màn hình mới
                            context, //điều hướng từ
                            MaterialPageRoute(
                              //điều hướng sang
                              builder: (context) => ThiDauSelection(),
                            ),
                          );
                        },
                        child: Text(
                          'Khó (Chủng Delta - Ấn Độ)',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        color: Color(0xffdd4b39),
                        highlightColor: Color(0xffff7f7f),
                        splashColor: Colors.transparent,
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                      ),
                    ],),
                  ),

                ),
              ],
            ),
          ],
        ));
  }

  void _updateProgress() {
    const oneSec = const Duration(milliseconds: 50);
    new Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.01;
        // we "finish" downloading here
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          return;
        }
      });
    });
  }
}

class Loading extends StatelessWidget {
  const Loading();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xfff5a623)),
        ),
      ),
      color: Colors.white.withOpacity(0.8),
    );
  }
}
