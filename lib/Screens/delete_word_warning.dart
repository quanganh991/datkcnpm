import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeleteWordWarning extends StatefulWidget {
  const DeleteWordWarning({
    Key? key,
    required this.steno,
  }) : super(key:key);

  final String steno;

  @override
  DeleteWordWarningState createState() => new DeleteWordWarningState();
}

class DeleteWordWarningState extends State<DeleteWordWarning> {

  @override
  Widget build(BuildContext context) {
    String steno = widget.steno;
    return AlertDialog(
      title: new Text("Xóa "+steno+" ?"),
      actions: <Widget>[
        FlatButton(
          child: new Text("Có"),
          onPressed: () {
            FirebaseFirestore.instance
                .collection('datk') //bảng user
                .doc('dictionary') //tại id mới
                .collection('dictionary')
                .doc(steno.toUpperCase()).delete();

            Fluttertoast.showToast(msg: "Đã xóa "+steno);
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: new Text("Không"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
