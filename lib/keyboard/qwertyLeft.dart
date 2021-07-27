import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datk/keyboard/save_keyword_to_firestore.dart';

class QwertyLeft extends StatefulWidget {
  @override
  QwertyLeftKeyboard createState() => QwertyLeftKeyboard();
}

class QwertyLeftKeyboard extends State<QwertyLeft> {
  @override
  // Color c = Color(0xFFFFFFFF);
  Color btnTilde = Color(0xFFFFFFFF);
  Color btn1 = Color(0xFFFFFFFF);
  Color btn2 = Color(0xFFFFFFFF);
  Color btn3 = Color(0xFFFFFFFF);
  Color btn4 = Color(0xFFFFFFFF);
  Color btn5 = Color(0xFFFFFFFF);
  Color btn6 = Color(0xFFFFFFFF);
  Color btn7 = Color(0xFFFFFFFF);
  Color btnTab = Color(0xFFFFFFFF);
  Color btnQ = Color(0xFFFFFFFF);
  Color btnW = Color(0xFFFFFFFF);
  Color btnE = Color(0xFFFFFFFF);
  Color btnR = Color(0xFFFFFFFF);
  Color btnT = Color(0xFFFFFFFF);
  Color btnY = Color(0xFFFFFFFF);
  Color btnCaps = Color(0xFFFFFFFF);
  Color btnA = Color(0xFFFFFFFF);
  Color btnS = Color(0xFFFFFFFF);
  Color btnD = Color(0xFFFFFFFF);
  Color btnF = Color(0xFFFFFFFF);
  Color btnG = Color(0xFFFFFFFF);
  Color btnH = Color(0xFFFFFFFF);
  Color btnShift = Color(0xFFFFFFFF);
  Color btnZ = Color(0xFFFFFFFF);
  Color btnX = Color(0xFFFFFFFF);
  Color btnC = Color(0xFFFFFFFF);
  Color btnV = Color(0xFFFFFFFF);
  Color btnB = Color(0xFFFFFFFF);
  Color btnCtrl = Color(0xFFFFFFFF);
  Color btnWindows = Color(0xFFFFFFFF);
  Color btnSpace = Color(0xFFFFFFFF);
  void add_text_to_cache(String text) {
    save_keyword_to_firestore.save_to_dart(text);

  }

  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 3, left: 3, right: 3, top: 35),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(7.0))),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              FlatButton(
                color: btnTilde,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnTilde = (btnTilde == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnTilde = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        // alignment: Alignment.bottomLeft,
                        child: Text(
                          '~',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                        ),
                      ),
                      Container(
                        child: Text(
                          '`',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btn1,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btn1 = (btn1 == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('1');
                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btn1 = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '!',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '1',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btn2,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btn2 = (btn2 == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('2');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btn2 = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '@',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '2',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btn3,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btn3 = (btn3 == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('3');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btn3 = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '#',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '3',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btn4,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btn4 = (btn4 == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('4');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btn4 = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '\$',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '4',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btn5,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btn5 = (btn5 == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('5');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btn5 = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '%',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '5',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btn6,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btn6 = (btn6 == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('6');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btn6 = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '^',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '6',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btn7,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btn7 = (btn7 == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('7');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btn7 = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '&',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '7',
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              FlatButton(
                color: btnTab,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnTab = (btnTab == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnTab = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Tab',
                        style: TextStyle(color: Colors.purple, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnQ,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnQ = (btnQ == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('s');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnQ = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Q',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'S',
                          style: TextStyle(color: Colors.purple, fontSize: 25),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnW,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnW = (btnW == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('k');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnW = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'W',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'K',
                          style: TextStyle(color: Colors.purple, fontSize: 25),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnE,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnE = (btnE == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('r');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnE = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'E',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'R',
                          style: TextStyle(color: Colors.purple, fontSize: 25),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnR,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnR = (btnR == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('n');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnR = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'R',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'N',
                          style: TextStyle(color: Colors.purple, fontSize: 25),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnT,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnT = (btnT == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('h');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnT = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'T',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'H',
                          style: TextStyle(color: Colors.purple, fontSize: 25),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnY,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnY = (btnY == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnY = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Y',
                      style: TextStyle(color: Colors.purple, fontSize: 25),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
            ],
          ),
          Row(
            children: [
              FlatButton(
                color: btnCaps,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnCaps = (btnCaps == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnCaps = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Caps',
                        style: TextStyle(color: Colors.purple, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnA,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnA = (btnA == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('t');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnA = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'A',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'T',
                          style: TextStyle(color: Colors.purple, fontSize: 25),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnS,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnS = (btnS == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('p');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnS = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'S',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'P',
                          style: TextStyle(color: Colors.purple, fontSize: 25),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnD,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnD = (btnD == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('h');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnD = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'D',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'H',
                          style: TextStyle(color: Colors.purple, fontSize: 25),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnF,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnF = (btnF == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('n');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnF = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'F',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'N',
                          style: TextStyle(color: Colors.purple, fontSize: 25),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnG,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnG = (btnG == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('s');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnG = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'G',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'S',
                          style: TextStyle(color: Colors.purple, fontSize: 25),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnH,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnH = (btnH == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnH = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'H',
                      style: TextStyle(color: Colors.purple, fontSize: 25),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
            ],
          ),
          Row(
            children: [
              FlatButton(
                color: btnShift,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnShift = (btnShift == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnShift = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 110.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Shift',
                        style: TextStyle(color: Colors.purple, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnZ,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnZ = (btnZ == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnZ = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Z',
                      style: TextStyle(color: Colors.purple, fontSize: 25),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnX,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnX = (btnX == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnX = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'X',
                      style: TextStyle(color: Colors.purple, fontSize: 25),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnC,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnC = (btnC == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('u');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnC = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'C',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'U',
                          style: TextStyle(color: Colors.purple, fontSize: 25),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnV,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnV = (btnV == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('o');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnV = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'V',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'O',
                          style: TextStyle(color: Colors.purple, fontSize: 25),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnB,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnB = (btnB == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnB = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'B',
                        style: TextStyle(color: Colors.purple, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
            ],
          ),
          Row(
            children: [
              FlatButton(
                color: btnCtrl,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnCtrl = (btnCtrl == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnCtrl = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Ctrl',
                        style: TextStyle(color: Colors.purple, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnWindows,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnWindows = (btnWindows == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnWindows = Color(0xFFFFFFFF);
                      });
                    });

                  });
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset('lib/image/windows10.png',
                        width: 25, height: 25, fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnSpace,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //adds padding inside the button
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //limits the touch area to the button area
                minWidth: 0,
                //wraps child's width
                height: 0,
                //wraps child's height
                onPressed: () {
                  setState(() {
                    btnSpace = (btnSpace == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btnSpace = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 50.0,
                  width: 230.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Space',
                      style: TextStyle(color: Colors.purple, fontSize: 25),
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
