import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

class configs{
  static final List<String> s = [
    'Đừng thấy hoa nở mà ngỡ xuân về nha quý dzị',
    'Cô giáo dạy vật lý',
    'Ơ mây dinh gút chóp em',
    'sân chơi của tôi luật của tôi',
    'tham lam',
    'còn cái nịt',
    'chị ong nâu nấu nầu nâu',
  ];
  static String random_words(){
    final _random = new Random();
    return s[_random.nextInt(s.length)];
  }
}