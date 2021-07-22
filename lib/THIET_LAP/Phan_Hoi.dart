import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PhanHoi extends StatefulWidget {
  @override
  PhanHoiState createState() => PhanHoiState();
}

class PhanHoiState extends State<PhanHoi> {
  @override
  Widget build(BuildContext context) {
    String stars = '';
    return Scaffold(
        appBar: AppBar(
          title: Text("Phản hồi"),
        ),
        body: Column(
          children: <Widget>[
            Card(
                color: Color(0xFFDCDCDC),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 15,
                    decoration: InputDecoration.collapsed(hintText: "Nhập phản hồi ..."),
                  ),
                )
            ),
            SizedBox(height: 20,),

            Center(
              child: Text('Bạn đánh giá ứng dụng mấy sao? '+stars,style: TextStyle(color: Color(
                  0xFF154405), fontSize: 20,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20,),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Expanded(
              child: Align(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.red)),
                  child: FlatButton(
                    onPressed: () {
                      Fluttertoast.showToast(msg: "Cảm ơn bạn đã đánh giá");

                      Navigator.pop(
                          context,
                      );
                    },
                    child: Text(
                      "Gửi đánh giá",
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
}