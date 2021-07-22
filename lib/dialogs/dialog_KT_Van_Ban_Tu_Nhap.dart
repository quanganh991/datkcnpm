import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogKTVanBanTuNhap extends StatefulWidget {
  @override
  DialogKTVanBanTuNhapState createState() =>
      new DialogKTVanBanTuNhapState();
}

class DialogKTVanBanTuNhapState extends State<DialogKTVanBanTuNhap> {
  int chosen = -1;
  bool checked = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Văn bản tự nhập"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Expanded(
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(labelText: "Văn bản tự nhập"),
                keyboardType: TextInputType.multiline,
              ),
            ),
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
