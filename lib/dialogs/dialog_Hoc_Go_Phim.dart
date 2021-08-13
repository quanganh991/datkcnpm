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
      title: new Text("Học gõ phím"),
      children: <Widget>[
      ],
    );
  }
}