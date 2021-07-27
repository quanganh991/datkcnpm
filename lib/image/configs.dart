import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

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
}