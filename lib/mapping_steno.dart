import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

class mapping_steno{
  @override
  static Future<void> qwerty_to_steno() async {
    var file = "lib/image/dictionary.xlsx";
    ByteData data = await rootBundle.load(file);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      print(table); //sheet Name = Sheet0
      print(excel.tables[table]!.maxCols);  //2
      print(excel.tables[table]!.maxRows);  //6900
      for (var row in excel.tables[table]!.rows) {
        String begin = row[0].replaceAll('-','');
        String end = row[1];
        print("$row" +" "+ begin+" "+end);
        //Ghi ra DB
        FirebaseFirestore.instance
            .collection('datk') //bảng user
            .doc('dictionary') //tại id mới
            .collection('dictionary')
            .doc(begin)
            .set({
          begin: end,
          'value': end
        });
      }
    }


  }
}