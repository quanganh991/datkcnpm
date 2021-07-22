import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogHocGoTuDo extends StatefulWidget {
  @override
  DialogHocGoTuDoState createState() => new DialogHocGoTuDoState();
}

class DialogHocGoTuDoState extends State<DialogHocGoTuDo> {
  int chosen = -1;

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text("Học gõ tự do"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[

          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
