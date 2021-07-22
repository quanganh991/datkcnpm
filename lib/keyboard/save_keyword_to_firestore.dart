import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class save_keyword_to_firestore{
  @override
  static void save_to_DB(String text){
    //lưu vào database
    int timeInMillis = int.parse(DateTime.now().millisecondsSinceEpoch.toString());
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    var formattedDate = DateFormat('dd-MM-yyyy  hh:mm:ss a').format(date);
    var documentReference = FirebaseFirestore.instance  //truy vấn 'messages' theo id
        .collection('datk') //from messages
        .doc('user_typed_recently')
        .collection('hoc')
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
    //lưu vào database xong
  }
}