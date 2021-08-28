import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogSubmitType extends StatefulWidget {
  @override
  DialogSubmitTypeState createState() => new DialogSubmitTypeState();
}

class DialogSubmitTypeState extends State<DialogSubmitType> {
  int chosen = -1;
  bool checked = true;
  double _currentRangeValues = 3;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Chọn chế độ submit"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            ListTile(
              title: Column(
                children: [
                  Text('Submit tự động sau: '),
                  //_currentRangeValues
                  Slider(
                    value: _currentRangeValues,
                    min: 3,
                    max: 10,
                    divisions: 8,
                    label: _currentRangeValues.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentRangeValues = value;
                      });
                    },
                  ),
                ],
              ),
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
              title: Text('Submit thủ công'),
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
