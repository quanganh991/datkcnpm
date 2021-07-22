import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogHocGoPhim extends StatefulWidget {
  @override
  DialogHocGoPhimState createState() => new DialogHocGoPhimState();
}

class DialogHocGoPhimState extends State<DialogHocGoPhim>{
  int chosen = -1;
  @override
  Widget build(BuildContext context){
    return new SimpleDialog(
      title: new Text("New Dialog"),
      children: <Widget>[
        ListTile(
          title: const Text('www.javatpoint.com'),
          leading: Radio(
            value: 1,
            groupValue: chosen,
            onChanged: (var value) {
              setState(() {
                chosen = int.parse(value.toString());
              });
              print(chosen - int.parse(value.toString()));
            },
          ),
        ),
        ListTile(
          title: const Text('www.w3school.com'),
          leading: Radio(
            value: 2,
            groupValue: chosen,
            onChanged: (var value) {
              setState(() {
                chosen = int.parse(value.toString());
              });
              print(chosen - int.parse(value.toString()));
            },
          ),
        ),
        ListTile(
          title: const Text('www.w3school.com'),
          leading: Radio(
            value: 3,
            groupValue: chosen,
            onChanged: (var value) {
              setState(() {
                chosen = int.parse(value.toString());
                print(chosen - int.parse(value.toString()));
              });
            },
          ),
        ),
      ],
    );
  }
}