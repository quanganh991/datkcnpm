import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogHocGoAm extends StatefulWidget {
  @override
  DialogHocGoAmState createState() => new DialogHocGoAmState();
}

class DialogHocGoAmState extends State<DialogHocGoAm> {
  int chosen = -1;

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text("Chọn cách học âm"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            ListTile(
              title: const Text('Âm đầu'),
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
              title: const Text('Âm chính'),
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
            ListTile(
              title: const Text('Âm cuối'),
              leading: Radio(
                value: 3,
                groupValue: chosen,
                onChanged: (var value) {
                  setState(() {
                    chosen = int.parse(value.toString());
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Âm ngẫu nhiên'),
              leading: Radio(
                value: 4,
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
