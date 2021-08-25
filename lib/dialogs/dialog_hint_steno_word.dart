import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HintStenoWordDialog extends StatefulWidget {
  const HintStenoWordDialog({
    Key? key,
    required this.qwerty_word,
  }) : super(key:key);

  final String qwerty_word;

  @override
  HintStenoWordDialogState createState() => new HintStenoWordDialogState();
}

class HintStenoWordDialogState extends State<HintStenoWordDialog> {

  @override
  Widget build(BuildContext context) {
    String qwerty = widget.qwerty_word;
    print("truyền sang gợi ý = "+qwerty);
    //tách câu thành các từ đơn lẻ
    List<String> split_qwerty = qwerty.split(" ");

    for(int i=0;i<split_qwerty.length;i++){
      print(split_qwerty[i]);
    }

    return AlertDialog(
      title: Text("Gợi ý"),
      content:
      StreamBuilder(
        //realtime
          stream: FirebaseFirestore.instance
              .collection('datk') //from messages
              .doc('dictionary')
              .collection('dictionary')
              .where('value', whereIn: split_qwerty)
              .snapshots(), //lấy từ vừa gõ
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData || snapshot.hasError || snapshot.data.docs.length < 1) {
              return Container();
            }
            else {
              String hint = "";
              for (int i = 0;i<snapshot.data.docs.length;i++){

                FirebaseFirestore.instance
                    .collection('datk') //bảng user
                    .doc('typing_dart') //tại id mới
                    .collection('answer_key')
                    .doc(i.toString())
                    .set({
                  i.toString():snapshot.data.docs[i]
                      .data()['key']
                      .toString()
                });

                hint+=snapshot.data.docs[i]
                    .data()['key']
                    .toString()
                    +
                    " -> "
                    +
                    snapshot.data.docs[i]
                        .data()['value']
                        .toString()
                    +
                    "\n";
              }
              return Text(hint,style: TextStyle(
                  color: Color(0xFFFF1919),
                  fontSize: 20,
                  fontWeight: FontWeight.bold));
            }
          }),
      actions: <Widget>[
        FlatButton(
          child: new Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
