import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class switch_screen{
  @override
  static void screen_switch(String screen_state){
    if (screen_state == 'left') {
      FirebaseFirestore.instance
          .collection('datk') //bảng user
          .doc('state') //tại id mới
          .collection('screen_state')
          .doc('Redmi 7')
          .set({
        //set các thuộc tính cho người dùng mới
        'screen_state': 'left',
        ////người mà tôi đang chat ban đầu khi mới đăng nhập là null
      });

      FirebaseFirestore.instance
          .collection('datk') //bảng user
          .doc('state') //tại id mới
          .collection('screen_state')
          .doc('SAMSUNG-SM-N920A')
          .set({
        //set các thuộc tính cho người dùng mới
        'screen_state': 'right',
        ////người mà tôi đang chat ban đầu khi mới đăng nhập là null
      });
    }
    else if (screen_state == 'right') {
      FirebaseFirestore.instance
          .collection('datk') //bảng user
          .doc('state') //tại id mới
          .collection('screen_state')
          .doc('Redmi 7')
          .set({
        //set các thuộc tính cho người dùng mới
        'screen_state': 'right',
        ////người mà tôi đang chat ban đầu khi mới đăng nhập là null
      });

      FirebaseFirestore.instance
          .collection('datk') //bảng user
          .doc('state') //tại id mới
          .collection('screen_state')
          .doc('SAMSUNG-SM-N920A')
          .set({
        //set các thuộc tính cho người dùng mới
        'screen_state': 'left',
        ////người mà tôi đang chat ban đầu khi mới đăng nhập là null
      });
    }
  }
}