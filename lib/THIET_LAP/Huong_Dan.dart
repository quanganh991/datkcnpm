import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class HuongDan extends StatefulWidget {
  @override
  HuongDanState createState() => HuongDanState();
}

class HuongDanState extends State<HuongDan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Thông tin & hướng dẫn"),
        ),
        body: Column(
          children: <Widget>[

            Card(
                color: Color(0xFF000A6C),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Liên hệ: Bộ môn Công nghệ phần mềm, ĐHBKHN',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
                  ),
                )
            ),
            Text("Thông tin",style: TextStyle(color: Color(0xFFFF0000), fontSize: 20,fontWeight: FontWeight.bold)),
            Card(
                color: Color(0xFFFFA8A8),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container (
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    child: new Column (
                      children: <Widget>[
                        new Text (' > Phần mềm này là kết quả của đề tài "Kiến trúc hướng dịch vụ và ứng d'
                            'ụng trong phần mềm quản lý công việc học gõ tốc k'
                            'ý tiếng Việt", mã đề tài 17BKT-CNTT02.\n', textAlign: TextAlign.left,style: TextStyle(color: Color(
                            0xFF000000), fontSize: 20,fontWeight: FontWeight.bold)),
                        new Text (' > Đề tài đã sử dụng kết quả nghiên cứu của dề tài "Nghiên '
                            'cứu xây dựng hệ thống chuyển đổi tiếng nói tiếng Việt sang v'
                            'ăn bản và công cụ hỗ trợ tốc ký trong xử lý nghiệp vụ chuyên m'
                            'ôn", Mã số: 01C - 07/02-2018-3 do Trung tâm Tin học Công báo T'
                            'hành phố Hà Nội chủ trì, các kết quả sử dụng gồm: bộ quy tắc gõ tốc ký,'
                            'từ điển tốc ký, bộ gõ tốc ký Tiếng Việt.', textAlign: TextAlign.left,style: TextStyle(color: Color(
                            0xFF000000), fontSize: 20,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                )
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Align(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.red)),
                  child: FlatButton(
                    onPressed: () {
                      Fluttertoast.showToast(msg: "Đang điều hướng");

                      _launchURL();
                      //Mở trình duyệt
                    },
                    child: Text(
                      "Hướng dẫn",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ),
                ),
                alignment: Alignment.bottomCenter,
              ),
            ),
          ],
        )
    );
  }


  _launchURL() async {
    const url = 'https://vietsteno.tiepcancntt.com//guide/guide.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}