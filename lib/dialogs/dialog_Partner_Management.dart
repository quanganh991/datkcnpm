import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogPartnerManagement extends StatefulWidget {
  DialogPartnerManagement({Key? key, required this.device_info}) : super(key: key);
  String device_info;

  @override
  DialogPartnerManagementState createState() => new DialogPartnerManagementState();
}

class DialogPartnerManagementState extends State<DialogPartnerManagement>{
  int chosen = -1;
  @override
  Widget build(BuildContext context){
    String device_info = widget.device_info;
    return AlertDialog(
      title: Column(
              children: <Widget>[
                Text(
                  'Đã kết nối với: ',
                  style: TextStyle(
                      color: Colors.blue, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  device_info,
                  style: TextStyle(
                      color: Colors.red, fontSize: 20),
                ),
              ],
            ),
      // Text("New Dialog"),
      // content: Container(),
      actions: [
        FlatButton(
          child: new Text("OK"),
          onPressed: () {

            Navigator.of(context).pop();

          },
        ),
      ],
    );
  }
}