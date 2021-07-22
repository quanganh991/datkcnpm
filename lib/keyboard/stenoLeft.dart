import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datk/keyboard/save_keyword_to_firestore.dart';

class StenoLeft extends StatefulWidget {
  @override
  StenoLeftKeyboard createState() => StenoLeftKeyboard();
}

class StenoLeftKeyboard extends State<StenoLeft> {
  @override
  Color btnS1 = Color(0xFFFFFFFF);
  Color btnK = Color(0xFFFFFFFF);
  Color btnR = Color(0xFFFFFFFF);
  Color btnN1 = Color(0xFFFFFFFF);
  Color btnH1 = Color(0xFFFFFFFF);
  Color btnT = Color(0xFFFFFFFF);
  Color btnP = Color(0xFFFFFFFF);
  Color btnH2 = Color(0xFFFFFFFF);
  Color btnN2 = Color(0xFFFFFFFF);
  Color btnS2 = Color(0xFFFFFFFF);
  Color btnU = Color(0xFFFFFFFF);
  Color btnO = Color(0xFFFFFFFF);

  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(bottom: 3, left: 3, right: 3, top: 35),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(7.0))),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlatButton(
                color: btnS1,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    btnS1 = (btnS1 == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                  });
                  save_keyword_to_firestore.save_to_DB('s');
                  Timer(Duration(milliseconds: 500), () {
                    setState(() {
                      btnS1 = Color(0xFFFFFFFF);
                    });
                  });
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'S',
                      style: TextStyle(color: Colors.purple, fontSize: 50),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnK,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    btnK = (btnK == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    save_keyword_to_firestore.save_to_DB('k');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnK = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'K',
                      style: TextStyle(color: Colors.purple, fontSize: 50),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnR,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    btnR = (btnR == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    save_keyword_to_firestore.save_to_DB('r');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnR = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'R',
                      style: TextStyle(color: Colors.purple, fontSize: 50),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnN1,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    btnN1 = (btnN1 == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    save_keyword_to_firestore.save_to_DB('n');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnN1 = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'N',
                      style: TextStyle(color: Colors.purple, fontSize: 50),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnH1,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    btnH1 = (btnH1 == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    save_keyword_to_firestore.save_to_DB('h');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnH1 = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'H',
                      style: TextStyle(color: Colors.purple, fontSize: 50),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlatButton(
                color: btnT,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    btnT = (btnT == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    save_keyword_to_firestore.save_to_DB('t');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnT = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'T',
                      style: TextStyle(color: Colors.purple, fontSize: 50),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnP,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    btnP = (btnP == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    save_keyword_to_firestore.save_to_DB('p');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnP = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'P',
                      style: TextStyle(color: Colors.purple, fontSize: 50),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnH2,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    btnH2 = (btnH2 == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    save_keyword_to_firestore.save_to_DB('h');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnH2 = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'H',
                      style: TextStyle(color: Colors.purple, fontSize: 50),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnN2,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    btnN2 = (btnN2 == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    save_keyword_to_firestore.save_to_DB('n');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnN2 = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'N',
                      style: TextStyle(color: Colors.purple, fontSize: 50),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnS2,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    btnS2 = (btnS2 == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    save_keyword_to_firestore.save_to_DB('s');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnS2 = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'S',
                      style: TextStyle(color: Colors.purple, fontSize: 50),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlatButton(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {},
                child: Container(
                  height: 80.0,
                  width: 240.0,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '',
                      style: TextStyle(color: Colors.purple, fontSize: 50),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnU,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    btnU = (btnU == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    save_keyword_to_firestore.save_to_DB('u');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnU = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'U',
                      style: TextStyle(color: Colors.purple, fontSize: 50),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnO,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                onPressed: () {
                  setState(() {
                    btnO = (btnO == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    save_keyword_to_firestore.save_to_DB('o');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnO = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'O',
                      style: TextStyle(color: Colors.purple, fontSize: 50),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
            ],
          ),
        ],
      ),
    );
  }
}
