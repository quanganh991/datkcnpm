import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogKTDoChinhXac extends StatefulWidget {
  @override
  DialogKTDoChinhXacState createState() => new DialogKTDoChinhXacState();
}

class DialogKTDoChinhXacState extends State<DialogKTDoChinhXac> {
  int chosen = -1;
  bool checked = true;
  RangeValues _currentRangeValues = const RangeValues(1, 100);

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text("Độ chính xác"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Row(
              children: [
                Text("Độ chính xác: "),
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
                Text(" %"),
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
