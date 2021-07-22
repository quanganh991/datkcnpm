import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogHocGoCau extends StatefulWidget {
  @override
  DialogHocGoCauState createState() => new DialogHocGoCauState();
}

class DialogHocGoCauState extends State<DialogHocGoCau> {
  int chosen = -1;
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text("Chọn cách học câu"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            ListTile(
              title: const Text('Số từ không giới hạn'),
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
              title: const Text('Số từ giới hạn'),
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
            chosen == 2 ? RangeSlider(
              values: _currentRangeValues,
              min: 5,
              max: 100,
              divisions: 95,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ) : Container(),
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
              title: const Text('Câu ngẫu nhiên'),
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
              title: const Text('Các câu về cuộc sống'),
              leading: Radio(
                value: 5,
                groupValue: chosen,
                onChanged: (var value) {
                  setState(() {
                    chosen = int.parse(value.toString());
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Các câu nói hay'),
              leading: Radio(
                value: 6,
                groupValue: chosen,
                onChanged: (var value) {
                  setState(() {
                    chosen = int.parse(value.toString());
                  });
                },
              ),
            ),ListTile(
              title: const Text('Các câu ca dao'),
              leading: Radio(
                value: 7,
                groupValue: chosen,
                onChanged: (var value) {
                  setState(() {
                    chosen = int.parse(value.toString());
                  });
                },
              ),
            ),ListTile(
              title: const Text('Các câu châm ngôn'),
              leading: Radio(
                value: 8,
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
