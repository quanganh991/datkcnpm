import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:VietStenoGame/keyboard/save_keyword_to_firestore.dart';

class QwertyRight extends StatefulWidget {
  @override
  QwertyRightKeyboard createState() => QwertyRightKeyboard();
}

class QwertyRightKeyboard extends State<QwertyRight> {
  @override
  // Color c = Color(0xFFFFFFFF);
    Color btn7 = Color(0xFFFFFFFF);
    Color btn8 = Color(0xFFFFFFFF);
    Color btn9 = Color(0xFFFFFFFF);
    Color btn0 = Color(0xFFFFFFFF);
    Color btnUnderscore  = Color(0xFFFFFFFF);
    Color btnEqual = Color(0xFFFFFFFF);
    Color btnBackSpace = Color(0xFFFFFFFF);
    Color btnU = Color(0xFFFFFFFF);
    Color btnI = Color(0xFFFFFFFF);
    Color btnO = Color(0xFFFFFFFF);
    Color btnP = Color(0xFFFFFFFF);
    Color btnOpenSquareBrackets= Color(0xFFFFFFFF);
    Color btnCloseSquareBrackets = Color(0xFFFFFFFF);
    Color btnLeftSlash = Color(0xFFFFFFFF);
    Color btnJ = Color(0xFFFFFFFF);
    Color btnK = Color(0xFFFFFFFF);
    Color btnL = Color(0xFFFFFFFF);
    Color btnSemicolon = Color(0xFFFFFFFF);
    Color btnQuote = Color(0xFFFFFFFF);
    Color btnEnter = Color(0xFFFFFFFF);
    Color btnN = Color(0xFFFFFFFF);
    Color btnM = Color(0xFFFFFFFF);
    Color btnComma = Color(0xFFFFFFFF);
    Color btnDots = Color(0xFFFFFFFF);
    Color btnRightSlash = Color(0xFFFFFFFF);
    Color btnShift = Color(0xFFFFFFFF);
    Color btnSpace = Color(0xFFFFFFFF);
    Color btnAlt = Color(0xFFFFFFFF);
    Color btnWindows = Color(0xFFFFFFFF);
    Color btnDuplicate = Color(0xFFFFFFFF);
    Color btnCtrl = Color(0xFFFFFFFF);
  void add_text_to_cache(String text) {
    save_keyword_to_firestore.save_to_dart(text);

  }

  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
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
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(

                    children: <Widget>[
                      Container(
                        // alignment: Alignment.bottomLeft,
                        child: Text(
                          '&',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                        ),
                      ),
                      Container(
                        child: Text(
                          '7',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btn8,
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
                    btn8 = (btn8 == Color(0xFF81FFBA))
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    add_text_to_cache('8');

                    Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        btn8 = Color(0xFFFFFFFF);
                      });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(

                    children: <Widget>[
                      Container(
                        // alignment: Alignment.bottomLeft,
                        child: Text(
                          '*',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                        ),
                      ),
                      Container(
                        child: Text(
                          '8',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btn9,
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
                   btn9 = (btn9 == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                   add_text_to_cache('9');

                   Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btn9 = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(

                    children: <Widget>[
                      Container(
                        child: Text(
                          '(',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '9',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btn0,
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
                   btn0 = (btn0 == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                   add_text_to_cache('0');

                   Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btn0 = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(

                    children: <Widget>[
                      Container(
                        child: Text(
                          ')',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '0',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnUnderscore,
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
                   btnUnderscore = (btnUnderscore == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnUnderscore = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(

                    children: <Widget>[
                      Container(
                        child: Text(
                          '_',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '-',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnEqual,
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
                   btnEqual = (btnEqual == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnEqual = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(

                    children: <Widget>[
                      Container(
                        child: Text(
                          '+',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '=',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnBackSpace,
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
                   btnBackSpace = (btnBackSpace == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnBackSpace = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(

                    children: <Widget>[
                      Container(
                        child: Text(
                          'Back',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          'space',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
                color: btnU,
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
                   btnU = (btnU == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                   add_text_to_cache('*');

                   Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnU = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'U',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          '*',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnI,
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
                   btnI = (btnI == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                   add_text_to_cache('w');

                   Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnI = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'I',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'W',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnO,
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
                   btnO = (btnO == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                   add_text_to_cache('j');

                   Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnO = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'O',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'J',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnP,
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
                   btnP = (btnP == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                   add_text_to_cache('n');

                   Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnP = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'P',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'N',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnOpenSquareBrackets,
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
                   btnOpenSquareBrackets = (btnOpenSquareBrackets == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                   add_text_to_cache('t');

                   Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnOpenSquareBrackets = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '[',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'T',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnCloseSquareBrackets,
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
                   btnCloseSquareBrackets = (btnCloseSquareBrackets == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnCloseSquareBrackets = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(

                    children: <Widget>[
                      Container(
                        child: Text(
                          '}',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          ']',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnLeftSlash,
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
                   btnLeftSlash = (btnLeftSlash == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnLeftSlash = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(

                    children: <Widget>[
                      Container(
                        child: Text(
                          '|',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '\\',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
                color: btnJ,
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
                   btnJ = (btnJ == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                   add_text_to_cache('i');

                   Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnJ = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'J',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'I',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnK,
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
                   btnK = (btnK == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                   add_text_to_cache('y');

                   Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnK = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'K',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Y',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnL,
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
                   btnL = (btnL == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                   add_text_to_cache('j');

                   Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnL = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'L',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'J',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnSemicolon,
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
                   btnSemicolon = (btnSemicolon == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                   add_text_to_cache('g');

                   Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnSemicolon = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          ';',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'G',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnQuote,
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
                   btnQuote = (btnQuote == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                   add_text_to_cache('k');

                   Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnQuote = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '\'',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'K',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnEnter,
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
                   btnEnter = (btnEnter == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnEnter = Color(0xFFFFFFFF);
                    });
                    });
                   save_keyword_to_firestore.save_to_DB();

                  });
                },
                child: Container(
                  height: 45.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Enter',
                      style: TextStyle(color: Colors.purple, fontSize: 15),
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
                color: btnN,
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
                   btnN = (btnN == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                   add_text_to_cache('e');

                   Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnN = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'N',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'E',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnM,
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
                   btnM = (btnM == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                   add_text_to_cache('a');

                   Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnM = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'M',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'A',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnComma,
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
                   btnComma = (btnComma == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnComma = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(

                    children: <Widget>[
                      Container(
                        child: Text(
                          '<',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          ',',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnDots,
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
                   btnDots = (btnDots == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnDots = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(

                    children: <Widget>[
                      Container(
                        child: Text(
                          '>',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '.',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnRightSlash,
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
                   btnRightSlash = (btnRightSlash == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    Timer(Duration(milliseconds: 500), () {
                    setState(() {
                   btnRightSlash = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(

                    children: <Widget>[
                      Container(
                        child: Text(
                          '?',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '/',
                          style: TextStyle(color: Colors.purple, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 1),
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
                  height: 45.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Shift',
                        style: TextStyle(color: Colors.purple, fontSize: 15),
                      ),
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
                  height: 45.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Space',
                        style: TextStyle(color: Colors.purple, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              FlatButton(
                color: btnAlt,
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
                   btnAlt = (btnAlt == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    Timer(Duration(milliseconds: 500), () {
                    setState(() {
                  btnAlt  = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Alt',
                      style: TextStyle(color: Colors.purple, fontSize: 15),
                      // textAlign: TextAlign.start,
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
                  height: 45.0,
                  width: 45,
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
                color: btnDuplicate,
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
                   btnDuplicate = (btnDuplicate == Color(0xFF81FFBA))
                    ? Color(0xFFFFFFFF)
                        : Color(0xFF81FFBA);
                    Timer(Duration(milliseconds: 500), () {
                    setState(() {
                  btnDuplicate  = Color(0xFFFFFFFF);
                    });
                    });
                  });
                },
                child: Container(
                  height: 45.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '≡',
                      style: TextStyle(color: Colors.purple, fontSize: 15),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
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
                  height: 45.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Ctrl',
                      style: TextStyle(color: Colors.purple, fontSize: 15),
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
