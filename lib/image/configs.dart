import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:collection/collection.dart';

class configs{
  static bool kiem_tra_hoan_vi(String s1,String s2){
    if (s1.length != s2.length){
      return false;
    }
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
    if (eq(res1,res2))
      return true;
    else
      return false;
  }
}