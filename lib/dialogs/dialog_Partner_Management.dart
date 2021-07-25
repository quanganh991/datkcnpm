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
      title:


      StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('datk') //truy vấn bảng messages
            .doc('partner') //where
            .collection('partner')
            .doc(device_info)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot smartphone) {
          if (smartphone.hasData){
            return Column(
              children: <Widget>[
                Text(
                  'Đã kết nối với: ',
                  style: TextStyle(
                      color: Colors.blue, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Image.asset(
                  "lib/image/"+smartphone.data['image'].toString(),
                  // width: 300,
                  height: 50,
                  fit: BoxFit.fill,

                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  smartphone.data['partner'],
                  style: TextStyle(
                      color: Colors.red, fontSize: 20),
                ),
              ],
            );
          }
          else return Container();
        },
      ),
      // Text("New Dialog"),
      // content: Container(),
      actions: [
        FlatButton(
          child: new Text("Ngắt kết nối"),
          onPressed: () {

            Navigator.of(context).pop();
          },
        ),
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