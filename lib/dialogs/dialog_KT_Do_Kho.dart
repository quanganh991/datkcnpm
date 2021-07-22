import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogKTDoKho extends StatefulWidget {
  @override
  DialogKTDoKhoState createState() =>
      new DialogKTDoKhoState();
}

class DialogKTDoKhoState extends State<DialogKTDoKho> {
  int chosen = -1;
  bool checked = true;
  RangeValues _currentRangeValues = const RangeValues(1, 100);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Độ khó"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Row(
              children: [
                Text("Độ khó: (D) "),
                RangeSlider(
                  values: _currentRangeValues,
                  min: 1,
                  max: 100,
                  divisions: 99,
                  labels: RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ),
                Text(" (K) %"),
              ],
            ),
            ListTile(
              title: const Text('Gõ âm'),
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
            chosen == 3
                ? DropdownButton<String>(
              items: <String>[
                'Âm đầu',
                'Âm chính',
                'Âm cuối',
                'Âm ngẫu nhiên'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            )
                : Container(),
            ListTile(
              title: const Text('Gõ từ'),
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
            chosen == 4
                ? DropdownButton<String>(
              items: <String>[
                'Âm chính',
                'Âm đầu + Âm chính',
                'Âm chính + Âm cuối',
                'Âm đầu + Âm chính + Âm cuối',
                'Từ ngẫu nhiên'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            )
                : Container(),
            ListTile(
              title: const Text('Gõ câu'),
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
