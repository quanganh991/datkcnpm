import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

class get_device_info{
  @override
  static Future<String> device_info() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('---------------------------Android Running on ${androidInfo
        .model}'); // e.g. "Moto G (4)"

    // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    // print('---------------------------Running on ${iosInfo.utsname
    //     .machine}'); // e.g. "iPod7,1"
    return androidInfo.model;
  }


  static Future<String> user_info() async {
    final String id_user = await FirebaseAuth.instance.currentUser!.uid;;


    final QuerySnapshot result = await FirebaseFirestore
        .instance //QuerySnapshot dùng để chứa kết quả lấy được từ server
        .collection('users')
        .where('id', isEqualTo: id_user)
        .limit(1)
        .get();
    final List<DocumentSnapshot> user_info = result.docs;
    return user_info[0]['nickname'];
  }

  static Future<String> user_id() async {
    final String id_user = await FirebaseAuth.instance.currentUser!.uid;;


    final QuerySnapshot result = await FirebaseFirestore
        .instance //QuerySnapshot dùng để chứa kết quả lấy được từ server
        .collection('users')
        .where('id', isEqualTo: id_user)
        .limit(1)
        .get();
    final List<DocumentSnapshot> user_info = result.docs;
    return user_info[0]['id'];
  }

  static Future<String> user_phone_1() async {
    final String id_user = await FirebaseAuth.instance.currentUser!.uid;;


    final QuerySnapshot result = await FirebaseFirestore
        .instance //QuerySnapshot dùng để chứa kết quả lấy được từ server
        .collection('users')
        .where('id', isEqualTo: id_user)
        .limit(1)
        .get();
    final List<DocumentSnapshot> user_info = result.docs;
    return user_info[0]['id_device1'];
  }

  static Future<String> user_phone_2() async {
    final String id_user = await FirebaseAuth.instance.currentUser!.uid;;


    final QuerySnapshot result = await FirebaseFirestore
        .instance //QuerySnapshot dùng để chứa kết quả lấy được từ server
        .collection('users')
        .where('id', isEqualTo: id_user)
        .limit(1)
        .get();
    final List<DocumentSnapshot> user_info = result.docs;
    return user_info[0]['id_device2'];
  }

  static Future<String> user_partner_phone() async {
    final String id_user = await FirebaseAuth.instance.currentUser!.uid;;


    final QuerySnapshot result = await FirebaseFirestore
        .instance //QuerySnapshot dùng để chứa kết quả lấy được từ server
        .collection('users')
        .where('id', isEqualTo: id_user)
        .limit(1)
        .get();
    final List<DocumentSnapshot> user_info = result.docs;
    if (user_info[0]['id_device1'].toString() == "null" || user_info[0]['id_device2'].toString() == "null")
      return "Chưa kết nối";
    else{
      String my_phone = await device_info();
      String phone1 = await user_phone_1();
      String phone2 = await user_phone_2();
      if (my_phone == phone1)
        return phone2;
      else if (my_phone == phone2)
        return phone1;
      else return "Chưa kết nối";
    }
  }
}