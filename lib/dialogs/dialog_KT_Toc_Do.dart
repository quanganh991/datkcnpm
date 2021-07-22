import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogKTTocDo extends StatefulWidget {
  @override
  DialogKTTocDoState createState() => new DialogKTTocDoState();
}

class DialogKTTocDoState extends State<DialogKTTocDo> {
  int chosen = -1;
  bool checked = true;
  RangeValues _currentRangeValues = const RangeValues(2, 500);

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text("Tốc độ"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            ListTile(
              title: const Text('Tự động dừng khi đạt tốc độ'),
              leading: Checkbox(
                value: checked,
                onChanged: (var value) {
                  setState(() {
                    checked = value!;
                  });
                },
              ),
            ),
            Row(
              children: [
                Text("Tốc độ: "),
                RangeSlider(
                  values: _currentRangeValues,
                  min: 2,
                  max: 500,
                  divisions: 498,
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
                Text(" Từ/phút"),
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
            chosen == 3 ? DropdownButton<String>(
              items: <String>['Âm đầu', 'Âm chính', 'Âm cuối', 'Âm ngẫu nhiên'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ) : Container(),
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
            chosen == 4 ? DropdownButton<String>(
              items: <String>['Âm chính', 'Âm đầu + Âm chính', 'Âm chính + Âm cuối', 'Âm đầu + Âm chính + Âm cuối', 'Từ ngẫu nhiên'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ) : Container(),
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
