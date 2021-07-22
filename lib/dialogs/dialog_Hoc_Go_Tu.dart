import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogHocGoTu extends StatefulWidget {
  @override
  DialogHocGoTuState createState() => new DialogHocGoTuState();
}

class DialogHocGoTuState extends State<DialogHocGoTu> {
  int chosen = -1;

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text("Chọn cách học từ"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            ListTile(
              title: const Text('Từ ngẫu nhiên'),
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
              title: const Text('Âm đầu + Âm chính'),
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
              title: const Text('Âm chính + Âm cuối'),
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
            ListTile(
              title: const Text('Âm đầu + Âm chính + Âm cuối'),
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
