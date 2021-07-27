import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    String s = '';
    if (DART.length > 0) { //nếu trong nháp có thông tin thì lưu chúng vào DB chính thức
      for (int i=0;i<DART.length;i++){
        s+= DART[i]['content'];
      }
    }
    print("-------------trong nháp có s = "+s);
    //lấy xong thông tin từ nháp

    //2. thêm vào DB chính thức
    if (s!='') {
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

      //3. Xóa nháp
      for (int i = 0; i < DART.length; i++) {
        FirebaseFirestore.instance //truy vấn 'messages' theo id
            .collection('datk') //from messages
            .doc('typing_dart')
            .collection('typing_dart')
            .doc(DART[i]['time']).delete();
      }
    }
    //Xóa nháp xong
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