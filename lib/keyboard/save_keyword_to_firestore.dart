import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trotter/trotter.dart';

class save_keyword_to_firestore{
  @override
  static Future<void> save_to_DB() async {
    //1. lấy thông tin từ nháp
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('datk')
        .doc('typing_dart')
        .collection('typing_dart')
        .orderBy('time', descending: false)
        .where('time', isNotEqualTo: 'not_allowed')
        .limit(9)
        .get();
    final List<DocumentSnapshot> DART = result.docs;
    final List<String> all_single_letters = [];  //lấy tất cả hoán vị của từ vừa gõ

    String s = '';
    if (DART.length > 0) { //nếu trong nháp có thông tin thì lưu chúng vào DB chính thức
      for (int i=0;i<DART.length;i++){
        s+= DART[i]['content'];
        all_single_letters.add(DART[i]['content'].toString().toUpperCase());
      }
    }
    s=s.toUpperCase();
    print("-------------trong nháp có s = "+s);
    //lấy xong thông tin từ nháp

    //2. kiểm tra xem nên lưu từ đó theo thứ tự như nào vào DB
    final QuerySnapshot all_single_steno_letters = await FirebaseFirestore.instance //tìm trong bộ từ điển các từ mà có steno là hoán vị của s
        .collection('datk')
        .doc('dictionary')
        .collection('dictionary')
        .where('key', isEqualTo: s)
        .get();
    final List<DocumentSnapshot> all_valid_steno = all_single_steno_letters.docs;
    print("Tìm đc "+all_valid_steno.length.toString()+" nhé");
    if (all_valid_steno.length > 0) { //nếu trong nháp có thông tin thì lưu chúng vào DB chính thức
      for (int i=0;i<all_valid_steno.length;i++){
        print(all_valid_steno[i]['begin']+" "+all_valid_steno[i]['end']+" "+all_valid_steno[i]['value']);
      }
    }
    //kiểm tra xong

    //3. thêm vào DB chính thức
    if (s!='') {
      //từ đó là tốc ký thì mới thêm
      if(all_valid_steno.length > 0) {
        int timeInMillis = int.parse(DateTime
            .now()
            .millisecondsSinceEpoch
            .toString());
        var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
        var formattedDate = DateFormat('dd-MM-yyyy  H:mm:ss.SSS').format(date);
        var documentReference = FirebaseFirestore
            .instance //truy vấn 'messages' theo id
            .collection('datk') //from messages
            .doc('user_typed_recently')
            .collection('hoc')
            .doc(formattedDate.toString());
        FirebaseFirestore.instance.runTransaction((
            transaction) async { //lưu vào database
          transaction.set(
            documentReference,
            {
              'content': s,
              'time': formattedDate.toString()
            },
          );
        });
        //thêm xong vào DB chính thức
      }
      else {
        Fluttertoast.showToast(
            msg: "Từ vừa gõ không phải từ tốc ký, vui lòng kiểm gõ lại",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }



      //4. Xóa nháp
      for (int i = 0; i < DART.length; i++) {
        FirebaseFirestore.instance //truy vấn 'messages' theo id
            .collection('datk') //from messages
            .doc('typing_dart')
            .collection('typing_dart')
            .doc(DART[i]['time']).delete();
      }
      //Xóa nháp xong
    }
  }

  static void save_to_dart(String text){
    //lưu vào nháp
    int timeInMillis = int.parse(DateTime.now().millisecondsSinceEpoch.toString());
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    var formattedDate = DateFormat('dd-MM-yyyy  H:mm:ss.SSS').format(date);
    var documentReference = FirebaseFirestore.instance  //truy vấn 'messages' theo id
        .collection('datk') //from messages
        .doc('typing_dart')
        .collection('typing_dart')
        .doc(formattedDate.toString());
    FirebaseFirestore.instance.runTransaction((transaction) async { //lưu vào database
      transaction.set(
        documentReference,
        {
          'content': text.toString(),
          'time': formattedDate.toString()
        },
      );
    });
    //lưu vào nháp xong
  }
}