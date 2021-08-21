import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datk/keyboard/get_device_info.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
            decoration: BoxDecoration(
              //màu nền của ứng dụng
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF02023B),
                  Color(0xFF1A1AB1),
                  Color(0xFF6A6AE5),
                  Color(0xFFA3A3FF),
                  Color(0xFFD2D2FC),
                ],
                stops: [0.3, 0.5, 0.6, 0.725, 1],
              ),
            ),
          ),

          FutureBuilder(
              future: get_device_info.user_info(),
              builder: (BuildContext context, AsyncSnapshot my_info) {
                if (my_info.hasData){
                  return StreamBuilder(
                    //realtime
                      stream: FirebaseFirestore.instance
                          .collection('datk') //truy vấn bảng messages
                          .doc('ranking_table') //where
                          .collection('history')
                          .doc(my_info.data.toString())
                          .collection(my_info.data.toString())
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          int len = snapshot.data.docs.length;
                          List<double> true_rate= [];
                          List<double> typing_speed= [];
                          List<double> typing_time= [];
                          for(int i = 0;i<len;i++){
                            true_rate.add(double.parse(snapshot.data.docs[i].data()['true_rate'].toString()) / 100);
                            typing_speed.add(double.parse(snapshot.data.docs[i].data()['typing_speed'].toString()) / 100);
                            // typing_time.add(DateTime.parse(snapshot.data.docs[i].data()['typing_time']));
                            DateTime dt = DateTime.parse('1970-01-01 '+snapshot.data.docs[i].data()['typing_time'].toString());
                            typing_time.add((dt.microsecondsSinceEpoch/1000000 + 28800));
                          }
                          double sum = typing_time.fold(0, (p, c) => p + c);
                          for(int i = 0;i<len;i++){
                            typing_time[i]/=sum;
                          }

                          List<Feature> feature = [
                            Feature(
                              title: "Tỉ lệ đúng",
                              color: Color(0xFFFF0000),
                              data: true_rate,
                            ),
                            Feature(
                              title: "Tốc độ gõ",
                              color: Color(0xFFF1D706),
                              data: typing_speed,
                            ),
                            Feature(
                              title: "Thời gian",
                              color: Color(0xFF48EF0E),
                              data: typing_time,
                            ),
                          ];
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
                                                Text(snapshot.data.docs[i].data()['category'].toString(),
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
                                  ])),
                              SizedBox(height: MediaQuery. of(context). size. height * 0.05),
                              LineGraph(
                                features: feature,
                                size: Size(
                                    MediaQuery. of(context). size. width * 0.97,
                                    MediaQuery. of(context). size. height * 0.55),
                                labelX: ['Gõ âm', 'Gõ phím', 'Gõ từ', 'Gõ câu', 'Gõ số', 'Gõ tự do'],
                                labelY: ['20%', '40%', '60%', '80%', '100%'],
                                showDescription: true,
                                graphColor: Color(0xFFFFFFFF),
                                graphOpacity: 0.2,
                                verticalFeatureDirection: true,
                                descriptionHeight: 130,

                              ),
                            ],);
                        } else {
                          return Container();
                        }
                      }
                  );
                }else {
                  return Container();
                }
              },
          ),
        ]),
      );
  }
}
