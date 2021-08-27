import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trotter/trotter.dart';
import 'package:VietStenoGame/image/configs.dart';

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

    String tu_nguoi_dung_vua_moi_go = '';
    if (DART.length > 0) { //nếu trong nháp có thông tin thì lưu chúng vào DB chính thức
      for (int i=0;i<DART.length;i++){
        tu_nguoi_dung_vua_moi_go+= DART[i]['content'];
        all_single_letters.add(DART[i]['content'].toString().toUpperCase());
      }
    }
    tu_nguoi_dung_vua_moi_go=tu_nguoi_dung_vua_moi_go.toUpperCase();
    //lấy xong thông tin từ nháp

    //2. Kiểm tra xem từ vừa gõ có đánh vấn được hay không
    //2.1. Lấy tất cả âm đầu, âm chính, âm cuối ra, sau đó điều chỉnh lại cái từ mà người dùng vừa mới gõ
    final QuerySnapshot all_am_dau = await FirebaseFirestore.instance
        .collection('datk')
        .doc('dictionary')
        .collection('am_dau')
        .get();
    final List<DocumentSnapshot> list_all_am_dau = all_am_dau.docs;
    List<String> tat_ca_am_dau = [];
    List<String> tat_ca_nghia_dau = [];
    if (list_all_am_dau.length > 0) {
      for (int i=0;i<list_all_am_dau.length;i++){
        tat_ca_am_dau.add(list_all_am_dau[i]['steno'].toString().toLowerCase());  //chỉ lấy về chữ thường
        tat_ca_nghia_dau.add(list_all_am_dau[i]['qwerty'].toString().toLowerCase());  //chỉ lấy về chữ thường
      }
    }
    final QuerySnapshot all_am_chinh = await FirebaseFirestore.instance
        .collection('datk')
        .doc('dictionary')
        .collection('am_chinh')
        .get();
    final List<DocumentSnapshot> list_all_am_chinh = all_am_chinh.docs;
    List<String> tat_ca_am_chinh = [];
    List<String> tat_ca_nghia_chinh = [];
    if (list_all_am_chinh.length > 0) {
      for (int i=0;i<list_all_am_chinh.length;i++){
        tat_ca_am_chinh.add(list_all_am_chinh[i]['steno'].toString().toLowerCase());  //chỉ lấy về chữ thường
        tat_ca_nghia_chinh.add(list_all_am_chinh[i]['qwerty'].toString().toLowerCase());  //chỉ lấy về chữ thường
      }
    }
    final QuerySnapshot all_am_cuoi = await FirebaseFirestore.instance
        .collection('datk')
        .doc('dictionary')
        .collection('am_cuoi')
        .get();
    final List<DocumentSnapshot> list_all_am_cuoi = all_am_cuoi.docs;
    List<String> tat_ca_am_cuoi = [];
    List<String> tat_ca_nghia_cuoi = [];

    if (list_all_am_cuoi.length > 0) {
      for (int i=0;i<list_all_am_cuoi.length;i++){
        tat_ca_am_cuoi.add(list_all_am_cuoi[i]['steno'].toString().toLowerCase());  //chỉ lấy về chữ thường
        tat_ca_nghia_cuoi.add(list_all_am_cuoi[i]['qwerty'].toString().toLowerCase());  //chỉ lấy về chữ thường
      }
    }

    //điều chỉnh lại hoán vị của từ mà người dùng vừa mới gõ

    //2.2. 3 vòng lặp xác định cấu tạo của từ vừa gõ
    bool danh_van_duoc = false;
    String tu_danh_van = '';
    outerloop:
    for(int i=0;i<tat_ca_am_dau.length;i++){
      for(int j=0;j<tat_ca_am_chinh.length;j++){
        for(int k=0;k<tat_ca_am_cuoi.length;k++){
          if (configs.kiem_tra_hoan_vi(tat_ca_am_dau[i].toString() + tat_ca_am_chinh[j].toString() + tat_ca_am_cuoi[k].toString(),tu_nguoi_dung_vua_moi_go.toLowerCase())){  //ko cần đúng thứ tự
            print("Đầu chính cuối "+tat_ca_am_dau[i].toString() +" "+ tat_ca_am_chinh[j].toString() +" "+ tat_ca_am_cuoi[k].toString()+ " vừa gõ "+tu_nguoi_dung_vua_moi_go);
            tu_nguoi_dung_vua_moi_go = tat_ca_am_dau[i].toString() + tat_ca_am_chinh[j].toString() + tat_ca_am_cuoi[k].toString();
            danh_van_duoc = configs.kiem_tra_xem_danh_van_duoc_hay_ko(tat_ca_nghia_dau[i], tat_ca_nghia_chinh[j], tat_ca_nghia_cuoi[k]);
            if (danh_van_duoc == true){
              tu_danh_van = tat_ca_nghia_dau[i] + tat_ca_nghia_chinh[j] + tat_ca_nghia_cuoi[k];
            }
            break outerloop;
          } else if (configs.kiem_tra_hoan_vi(tat_ca_am_chinh[j].toString() + tat_ca_am_cuoi[k].toString(),tu_nguoi_dung_vua_moi_go.toLowerCase())){
            print("Chính cuối "+tat_ca_am_chinh[j].toString() +" "+ tat_ca_am_cuoi[k].toString()+ " vừa gõ "+tu_nguoi_dung_vua_moi_go);
            tu_nguoi_dung_vua_moi_go = tat_ca_am_chinh[j].toString() + tat_ca_am_cuoi[k].toString();
            danh_van_duoc = configs.kiem_tra_xem_danh_van_duoc_hay_ko('',tat_ca_nghia_chinh[j], tat_ca_nghia_cuoi[k]);
            if (danh_van_duoc == true){
              tu_danh_van =tat_ca_nghia_chinh[j] + tat_ca_nghia_cuoi[k];
            }
            break outerloop;
          } else if (configs.kiem_tra_hoan_vi(tat_ca_am_dau[i].toString() + tat_ca_am_cuoi[k].toString(),tu_nguoi_dung_vua_moi_go.toLowerCase())){
            print("Đầu cuối "+tat_ca_am_dau[i].toString() +" "+ tat_ca_am_cuoi[k].toString()+ " vừa gõ "+tu_nguoi_dung_vua_moi_go);
            tu_nguoi_dung_vua_moi_go = tat_ca_am_dau[i].toString() + tat_ca_am_cuoi[k].toString();
            danh_van_duoc = configs.kiem_tra_xem_danh_van_duoc_hay_ko(tat_ca_nghia_dau[i],'' ,tat_ca_nghia_cuoi[k]);
            if (danh_van_duoc == true){
              tu_danh_van =tat_ca_nghia_dau[i] + tat_ca_nghia_cuoi[k];
            }
            break outerloop;
          } else if (configs.kiem_tra_hoan_vi(tat_ca_am_dau[i].toString() + tat_ca_am_chinh[j].toString(),tu_nguoi_dung_vua_moi_go.toLowerCase())){
            print("Đầu chính "+tat_ca_am_dau[i].toString() +" "+ tat_ca_am_chinh[j].toString() + " vừa gõ "+tu_nguoi_dung_vua_moi_go);
            tu_nguoi_dung_vua_moi_go = tat_ca_am_dau[i].toString() + tat_ca_am_chinh[j].toString();
            danh_van_duoc = configs.kiem_tra_xem_danh_van_duoc_hay_ko(tat_ca_nghia_dau[i], tat_ca_nghia_chinh[j],'');
            if (danh_van_duoc == true){
              tu_danh_van =tat_ca_nghia_dau[i] + tat_ca_nghia_chinh[j];
            }
            break outerloop;
          } else if (configs.kiem_tra_hoan_vi(tat_ca_am_dau[i].toString(),tu_nguoi_dung_vua_moi_go.toLowerCase())){
            print("Đầu "+tat_ca_am_dau[i].toString() +" vừa gõ "+tu_nguoi_dung_vua_moi_go);
            tu_nguoi_dung_vua_moi_go = tat_ca_am_dau[i].toString();
            danh_van_duoc = configs.kiem_tra_xem_danh_van_duoc_hay_ko(tat_ca_nghia_dau[i],'','');
            if (danh_van_duoc == true){
              tu_danh_van =tat_ca_nghia_dau[i];
            }
            break outerloop;
          } else if (configs.kiem_tra_hoan_vi(tat_ca_am_chinh[j].toString(),tu_nguoi_dung_vua_moi_go.toLowerCase())){
            print("Chính "+tat_ca_am_chinh[j].toString() +" vừa gõ "+tu_nguoi_dung_vua_moi_go);

            tu_nguoi_dung_vua_moi_go = tat_ca_am_chinh[j].toString();
            danh_van_duoc = configs.kiem_tra_xem_danh_van_duoc_hay_ko(tat_ca_nghia_chinh[j],'','');
            if (danh_van_duoc == true){
              tu_danh_van =tat_ca_nghia_chinh[j];
            }
            break outerloop;
          } else if (configs.kiem_tra_hoan_vi(tat_ca_am_cuoi[k].toString(),tu_nguoi_dung_vua_moi_go.toLowerCase())){
            print("Cuối "+tat_ca_am_cuoi[k].toString() +" vừa gõ "+tu_nguoi_dung_vua_moi_go);
            tu_nguoi_dung_vua_moi_go = tat_ca_am_cuoi[k].toString();
            danh_van_duoc = configs.kiem_tra_xem_danh_van_duoc_hay_ko(tat_ca_nghia_cuoi[k],'','');
            if (danh_van_duoc == true){
              tu_danh_van =tat_ca_nghia_cuoi[k];
            }
            break outerloop;
          }
        }
      }
    }

    print("VỪa gõ từ "+tu_danh_van.toString());
    //3. kiểm tra xem từ vừa gõ có phải là tốc ký ko
    final QuerySnapshot all_single_steno_letters = await FirebaseFirestore.instance
        .collection('datk')
        .doc('dictionary')
        .collection('dictionary')
        .where('key', isEqualTo: tu_nguoi_dung_vua_moi_go.toUpperCase()) //tìm trong bộ từ điển xem có từ tốc ký đó không
        .get();
    final List<DocumentSnapshot> all_valid_steno = all_single_steno_letters.docs;
    // //kiểm tra xong

    //4. Kiểm tra từ đó đúng hay sai
    final QuerySnapshot get_all_answerkey = await FirebaseFirestore.instance
        .collection('datk') //bảng user
        .doc('typing_dart') //tại id mới
        .collection('answer_key')
        .get();
    final List<DocumentSnapshot> answer_key = get_all_answerkey.docs;
    List<String> all_answer_key = [];
    if (answer_key.length > 0) { //nếu trong nháp có thông tin thì lưu chúng vào DB chính thức
      for (int i=0;i<answer_key.length;i++){
        all_answer_key.add(answer_key[i][i.toString()]);
      }
    }
    //Kiểm tra từ đó đúng hay sai đã xong

    //5. thêm vào DB chính thức
    if (tu_nguoi_dung_vua_moi_go!='') {
      //từ đó đánh vần được thì mới thêm
      //từ đó là tốc ký thì mới thêm
      if(all_valid_steno.length > 0 || tu_danh_van != '') { //hoặc là đánh vần được, hoặc là xuất hiện trong bộ từ điển
        print("Từ đánh vần được là "+tu_danh_van);
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
              'meaning': tu_danh_van.toString(),
              'content': tu_nguoi_dung_vua_moi_go,
              'time': formattedDate.toString(),
              'color': all_answer_key.contains(tu_nguoi_dung_vua_moi_go.toUpperCase()) == true ? 'green' //có trong bộ đáp án thì màu xanh
                  : //ko có trong bộ đáp án thì hoặc màu đỏ, hoặc màu vàng
              (
              //tu_danh_van == '' nếu từ đó hoặc là sai cú pháp, hoặc là không đánh vần được
                  all_valid_steno.length == 0
              ?
              'yellow'//ko có trong bộ đáp án, ko có trong từ điển thì màu vàng
               :
               'red'  //ko có trong bộ đáp án, nhưng có trong từ điển, thì màu đỏ
              )
              ,
            },
          );
        });

        //thêm xong vào DB chính thức

        //di chuyển con trỏ nếu có trong bộ đáp án
        if (all_answer_key.contains(tu_nguoi_dung_vua_moi_go.toUpperCase()) == true){
          final QuerySnapshot current_cursor = await FirebaseFirestore.instance
              .collection('datk') //from messages
              .doc('typing_dart')
              .collection('typing_dart')
              .where('time',isEqualTo: 'not_allowed')
              .get();
          final List<DocumentSnapshot> get_current_cursor = current_cursor.docs;
          int cursor = int.parse(get_current_cursor[0]['typing_index'].toString());
          var moving_cursor = FirebaseFirestore
              .instance //truy vấn 'messages' theo id
              .collection('datk') //from messages
              .doc('typing_dart')
              .collection('typing_dart')
              .doc('typing_index');
          FirebaseFirestore.instance.runTransaction((
              transaction) async { //lưu vào database
            transaction.set(
              moving_cursor,
              {
                'time':'not_allowed',
                'content':'not_allowed',
                'typing_index': cursor+1
              },
            );
          });
          //di chuyển con trỏ xong
        }
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



      //6. Xóa nháp
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