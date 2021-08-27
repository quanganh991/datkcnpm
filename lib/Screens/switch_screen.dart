import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:VietStenoGame/keyboard/get_device_info.dart';
import 'package:intl/intl.dart';

class switch_screen{
  @override
  static void screen_switch(String screen_state) async{

    String myphone = await get_device_info.device_info();
    String phone1 = await get_device_info.user_phone_1(); //phone hiện tại
    String phone2 = await get_device_info.user_phone_2(); //phone partner

    if (myphone == phone2){
      String tmp = phone2;
      phone2 = phone1;
      phone1 = tmp;
    }
    if (screen_state == 'left') {
      if (phone1 != null) {
        FirebaseFirestore.instance
            .collection('datk') //bảng user
            .doc('state') //tại id mới
            .collection('screen_state')
            .doc(phone1)
            .set({
          'screen_state': 'left',
        });
      }

      if (phone2 != null) {FirebaseFirestore.instance
          .collection('datk') //bảng user
          .doc('state') //tại id mới
          .collection('screen_state')
          .doc(phone2)
          .set({
        'screen_state': 'right',
      });}
    }
    else if (screen_state == 'right') {
      if (phone1 != null) {FirebaseFirestore.instance
          .collection('datk') //bảng user
          .doc('state') //tại id mới
          .collection('screen_state')
          .doc(phone1)
          .set({
        'screen_state': 'right',
      });}

      if (phone2 != null) {FirebaseFirestore.instance
          .collection('datk') //bảng user
          .doc('state') //tại id mới
          .collection('screen_state')
          .doc(phone2)
          .set({
        'screen_state': 'left',
      });}
    }
  }
}