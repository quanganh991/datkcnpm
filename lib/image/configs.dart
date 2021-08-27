import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:collection/collection.dart';

class configs{
  static final List<String> s = [
    'Nghe vô lý nhưng lại rất thuyết phục',
    'tôi năm nay hơn bảy mươi tuổi',
    'nhà tôi ba đời trị sỏi thận',
    'bánh mì không phải là một loại thực phẩm thiết yếu',
    'Đừng thấy hoa nở mà ngỡ xuân về nha quý dị',
    'Cô giáo dạy vật lý',
    'chị ong nâu nấu nầu nâu',
  ];
  static final List<String> steno = [
    'KRE','SPROW','SRSI','TKUWG','SRNAJ','RS*WNT','THSEYNT','PHNIUNK',
    'TOWJ','PR*AT','PRAJN','HWN','PHSAJN','RHEWJ','THSUOJ',
    'TKHA','TOWJ','PA','TPHWJ','TRN*I','SHSOJ','THN*WN',
    'PSAK','RHH*I','KHOWG','PHHSAJ','SRHA','RHNOWNT','SRNUJ','THNUWNK','PHHS*WT','THSIENT','SIEJG',
    'TPHUWG','THS*WJN','HU','PRHSW','RHHA','KRNSW','ST*YN','SPRHOE','TKA','STKSUY','SPN*I',
    'K-OW','SHSAJK','SPNAJN','SPRN*WNT','SRSI',
    'SKN*I','OG','PR*WJG','PRS*WJG','PR*WJG','PR*WJG'
  ];
  static String random_words(){
    final _random = new Random();
    return s[_random.nextInt(s.length)];
  }

  static bool kiem_tra_xem_danh_van_duoc_hay_ko(String am_dau, String am_chinh, String am_cuoi) {
    if(am_dau == "ngh"){
      if (
      ["i","e","ê","ì","è","ề","í","é","ế","ỉ","ẻ","ể","ĩ","ẽ","ễ","ị","ẹ","ệ"]
          .contains(am_chinh.length > 0 ? am_chinh[0] : am_chinh) == false){
        return false;
      }
    }
    if(am_dau == "ng"){
      if (["i","e","ê","ì","è","ề","í","é","ế","ỉ","ẻ","ể","ĩ","ẽ","ễ","ị","ẹ","ệ"].contains(am_chinh.length > 0 ? am_chinh[0] : am_chinh) == true){
        return false;
      }
    }
    if(am_dau == "c"){
      if (
      ['a','o','ô','ơ','u','ư',
        'á','ó','ố','ớ','ú','ứ',
        'à','ò','ồ','ờ','ù','ừ',
        'ả','ỏ','ổ','ở','ủ','ử',
        'ạ','ọ','ộ','ợ','ụ','ự',
        'ã','õ','ỗ','ỡ','ũ','ữ',]
          .contains(am_chinh.length > 0 ? am_chinh[0] : am_chinh) == false){
        return false;
      }
    }
    if(am_dau == "k"){
      if (['e','ê','y','i','è','ề','ỳ','ì','é','ế','ý','í','ẻ','ể','ý','ỉ','ẽ','ễ','ỹ','ĩ','ẹ','ệ','ỵ','ị'].contains(am_chinh.length > 0 ? am_chinh[0] : am_chinh) == false){
        return false;
      }
    }
    return true;
  }

  static bool kiem_tra_hoan_vi(String s1,String s2){
    if (s1.length != s2.length){
      return false;
    }
    // print("S1 = "+s1+" S2 = "+s2);
    Function eq = const ListEquality().equals;
    List<int> res1 = [];
    List<int> res2 = [];
    for(int i=0;i<s1.length;i++){
      res1.add(s1.codeUnitAt(i));
    }
    for(int i=0;i<s2.length;i++){
      res2.add(s2.codeUnitAt(i));
    }

    res1.sort();
    res2.sort();
    // for(int i=0;i<s1.length;i++){
    //   print(res1[i]);
    // }
    // print("");
    // for(int i=0;i<s2.length;i++){
    //   print(res2[i]);
    // }
    if (eq(res1,res2))
      return true;
    else
      return false;
  }
}