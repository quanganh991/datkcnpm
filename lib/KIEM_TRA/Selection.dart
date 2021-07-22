import 'package:datk/KIEM_TRA/Do_Chinh_Xac.dart';
import 'package:datk/KIEM_TRA/Toc_Do.dart';
import 'package:datk/KIEM_TRA/Van_Ban_Tu_Nhap.dart';
import 'package:flutter/material.dart';

import 'Do_Kho.dart';
import 'Gioi_Han_Thoi_Gian.dart';

class KiemtraSelection extends StatefulWidget {
  @override
  KiemtraSelectionState createState() => KiemtraSelectionState();
}

class KiemtraSelectionState extends State<KiemtraSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kiểm Tra",
          style: TextStyle(fontSize: 30),
        ),
        // backgroundColor: Color(0xFFFFDADA),
      ),
      body: Stack(
        children: <Widget>[
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
              child: Image.asset('lib/image/selection_background.JPG',
                  // width: 300,
                  height: 150,
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            children: <Widget>[
              const SizedBox(height: 320.0),
              // Image.asset("lib/image/steno_keyboard.jpg"),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push( //điều hướng sang màn hình mới
                          context,  //điều hướng từ
                          MaterialPageRoute(  //điều hướng sang
                            builder: (context) => KTDoChinhXacSelection(),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset('lib/image/kiem_tra_do_chinh_xac.png',
                              // width: 300,
                              height: 50,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Độ chính xác",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push( //điều hướng sang màn hình mới
                          context,  //điều hướng từ
                          MaterialPageRoute(  //điều hướng sang
                            builder: (context) => KTDoKhoSelection(),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset('lib/image/kiem_tra_do_kho.png',
                              // width: 300,
                              height: 50,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Độ khó",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,


                children: [
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push( //điều hướng sang màn hình mới
                          context,  //điều hướng từ
                          MaterialPageRoute(  //điều hướng sang
                            builder: (context) => KTGioiHanThoiGianSelection(),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset('lib/image/kiem_tra_gioi_han_thoi_gian.png',
                              // width: 300,
                              height: 50,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Giới hạn thời gian",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push( //điều hướng sang màn hình mới
                          context,  //điều hướng từ
                          MaterialPageRoute(  //điều hướng sang
                            builder: (context) => KTTocDoSelection(),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset('lib/image/kiem_tra_toc_do.png',
                              // width: 300,
                              height: 50,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Tốc độ",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push( //điều hướng sang màn hình mới
                          context,  //điều hướng từ
                          MaterialPageRoute(  //điều hướng sang
                            builder: (context) => KTVanBanTuNhapSelection(),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset('lib/image/hoc_go_cau.png',
                              // width: 300,
                              height: 50,
                              fit: BoxFit.fill),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Văn bản tự nhập",
                                style:
                                TextStyle(color: Colors.blue, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
