import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class switch_keyboard{
  @override
  static void keyboard_switch(String keyboard){
    FirebaseFirestore.instance
        .collection('datk') //bảng user
        .doc('state') //tại id mới
        .collection('keyboard_state')
        .doc('keyboard_state')
        .set({
      //set các thuộc tính cho người dùng mới
      'keyboard_state': keyboard,
      ////người mà tôi đang chat ban đầu khi mới đăng nhập là null
    });
  }
}