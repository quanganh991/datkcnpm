import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogHocGoSo extends StatefulWidget {
  @override
  DialogHocGoSoState createState() => new DialogHocGoSoState();
}

class DialogHocGoSoState extends State<DialogHocGoSo> {
  int chosen = -1;

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text("Chọn kiểu gõ"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            ListTile(
              title: const Text('Gõ số'),
              leading: Radio(
                value: 1,
                groupValue: chosen,
                onChanged: (var value) {
                  setState(() {
                    chosen = int.parse(value.toString());
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Gõ dấu'),
              leading: Radio(
                value: 2,
                groupValue: chosen,
                onChanged: (var value) {
                  setState(() {
                    chosen = int.parse(value.toString());
                  });
                },
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
