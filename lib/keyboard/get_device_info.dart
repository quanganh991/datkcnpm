import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
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
}