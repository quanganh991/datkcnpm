import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LichSu extends StatefulWidget {
  @override
  LichSuState createState() => LichSuState();
}

class LichSuState extends State<LichSu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lịch sử gõ tốc ký'),
        ),
        body: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              child: Image.asset('lib/image/xep_hang_background.JPG',
                  // width: 300,
                  height: 150,
                  fit: BoxFit.fill),
            ),
          ),
          StreamBuilder(
            //realtime
              stream: FirebaseFirestore.instance
                  .collection('datk') //truy vấn bảng messages
                  .doc('ranking_table') //where
                  .collection('ranking_table')
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  int len = snapshot.data.docs.length;
                  return

                    Column(children: [
                      CachedNetworkImage(
                        // width: 300,
                        height: 30,
                        fit: BoxFit.fill,
                        imageUrl: snapshot.data.docs[0].data()['avatar'].toString(),
                      ),
                      Text(
                        snapshot.data.docs[0].data()['name'].toString(),
                        style: TextStyle(
                            color: Colors.blue, fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      Center(
                          child: Column(children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(1),
                              child: Table(
                                // defaultColumnWidth: FixedColumnWidth(120.0),
                                border: TableBorder.all(
                                    color: Color(0xFFFFFFFF),
                                    style: BorderStyle.solid,
                                    width: 1),
                                children: [
                                  TableRow(children: [
                                    Column(children: [
                                      Text('Thể loại',
                                          style: TextStyle(
                                              fontSize: 20.0, color: Color(0xFFFFFFFF)))
                                    ]),
                                    Column(children: [
                                      Text('Tỉ lệ đúng',
                                          style: TextStyle(
                                              fontSize: 20.0, color: Color(0xFFFFFFFF)))
                                    ]),
                                    Column(children: [
                                      Text('Tốc độ gõ',
                                          style: TextStyle(
                                              fontSize: 20.0, color: Color(0xFFFFFFFF)))
                                    ]),
                                    Column(children: [
                                      Text('Thời gian',
                                          style: TextStyle(
                                              fontSize: 20.0, color: Color(0xFFFFFFFF)))
                                    ]),
                                  ]),
                                  for (int i=0;i<len;i++)
                                    TableRow(children: [
                                      Column(children: [
                                        Text(snapshot.data.docs[i].data()['true_rate'].toString() + ' %',
                                            style: TextStyle(color: Color(0xFFFF0000), fontSize: 20,fontWeight: FontWeight.bold))
                                      ]),
                                      Column(children: [
                                        Text(snapshot.data.docs[i].data()['true_rate'].toString() + ' %',
                                            style: TextStyle(color: Color(0xFFFF0000), fontSize: 20,fontWeight: FontWeight.bold))
                                      ]),
                                      Column(children: [
                                        Text(snapshot.data.docs[i].data()['typing_speed'].toString() + ' từ / phút',
                                            style: TextStyle(color: Color(0xFFF1D706), fontSize: 20,fontWeight: FontWeight.bold))
                                      ]),
                                      Column(children: [
                                        Text(snapshot.data.docs[i].data()['typing_time'].toString(),
                                            style: TextStyle(color: Color(0xFF48EF0E), fontSize: 20,fontWeight: FontWeight.bold))
                                      ]),
                                    ]),
                                ],
                              ),
                            ),
                          ]))
                    ],);
                } else {
                  return Container();
                }
              }),
        ]),
      );
  }
}
