import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:VietStenoGame/welcome.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:VietStenoGame/keyboard/get_device_info.dart';
import 'package:VietStenoGame/mapping_steno.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _loading = false;
  double _progressValue = 0.0;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences prefs;
  String device_user = '';
  bool isLoading = false;
  bool isLoggedIn = false;
  late User currentUser;

  @override
  void initState() {
    super.initState();
    isSignedIn(); //hàm kiểm tra xem có đăng nhập hay ko

    _loading = true;
    _updateProgress();

    // mapping_steno.qwerty_to_steno();
    // mapping_steno.add_am_dau();
    // mapping_steno.add_am_chinh();
    // mapping_steno.add_am_cuoi();
  }

  void isSignedIn() async {
    //hàm kiểm tra xem có đăng nhập hay ko, đc gọi khi đăng xuất và khi mở lại ứng dụng
    this.setState(() {
      isLoading = true; //xoay vòng
    });

    // final tu_dien = await FirebaseFirestore.instance
    //     .collection('datk') //bảng user
    //     .doc('dictionary')
    //     .collection('dictionary')
    //     .get(); //tại id mới
    // final List<DocumentSnapshot> bo_tu_dien = tu_dien.docs;
    // print("Độ dài của bộ từ điển là "+bo_tu_dien.length.toString());

    device_user = await get_device_info.device_info();

    prefs =
        await SharedPreferences.getInstance(); //moi các trường trong firebase
    print("prefs đăng xuất = " + prefs.toString());

    // await googleSignIn.signOut();
    isLoggedIn = await googleSignIn.isSignedIn();
    print("isLoggedIn = " + isLoggedIn.toString());
    if (isLoggedIn) {
      //đảm bảo rằng 1 khi isLoggedIn = true thì luôn chuyển hướng sang màn hình đăng nhập
      print("prefs đăng nhập 1 = " +
          prefs.toString()); //khi mở lại ứng dụng trong trạng thái đã đăng nhập
      Navigator.push(
        //điều hướng sang màn hình mới (Màn hình HomeScreen)
        context, //điều hướng từ
        MaterialPageRoute(
          //điều hướng sang
          builder:
              (context) => //bên dưới cũng có hàm route sang HomeScreen, nhưng route ở đây là route khi kiểm tra ngay từ đầu, nếu đã đăng nhập lần trước rồi thì route ngay
                  MyHomePage(
            title: 'VietStenoGame',
          ), //chuyển sang màn hình gồm các người đang online
        ),
      );
    }

    this.setState(() {
      isLoading = false; //không xoay nữa
    });
  }

  Future<Null> handleSignIn() async {
    prefs = await SharedPreferences.getInstance(); //Instance of 'SharedPreferences', xuất hiện khi người dùng ấn nút đăng nhập

    this.setState(() {
      isLoading = true;
    });
    print("prefs đăng nhập 2 = " + prefs.toString());

    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    User? firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user; //lấy thông tin của người đăng nhập

    print("kiểm tra firebaseUser có null ko, firebaseUser = " + firebaseUser.toString());
    if (firebaseUser != null) {
      //nếu tìm thấy tài khoản google của người này trong firebase
      // Check is already sign up
      print("-------------------------------firebaseUser Khác null, = " +
          firebaseUser.toString());
      final QuerySnapshot result = await FirebaseFirestore
          .instance //QuerySnapshot dùng để chứa kết quả lấy được từ server
          .collection('users')
          .where('id', isEqualTo: firebaseUser.uid)
          .get(); //tìm kiếm id của người này dựa trên id trong tài khoản google đã đăng nhập

      print("Giá trị của QuerySnapshot result là " +
          result.toString()); //[Instance of 'QueryDocumentSnapshot']

      final List<DocumentSnapshot> documents = result
          .docs; //mảng này chỉ chứa 0 hoặc 1 phần tử, tương ứng với người dùng chưa hoặc đã có trên firebase

      if (documents.length == 0) {
        print("------------------------Đăng nhập lần đầu");
        //nếu người dùng đăng nhập lần đầu //document[0] = Instance of 'QueryDocumentSnapshot'
        // Update data to server if new user  //cập nhật dữ liệu lên server
        FirebaseFirestore.instance
            .collection('users') //bảng user
            .doc(firebaseUser.uid) //tại id mới
            .set({
          //set các thuộc tính cho người dùng mới
          'nickname': firebaseUser.displayName,
          'photoUrl': firebaseUser.photoURL,
          'id': firebaseUser.uid,
          'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
          'chattingWith': null,
          //nếu máy 1 = null, chỉ gán máy 1
          //nếu máy 1 khác null, thay thế máy 2
          //nếu cả 2 máy khác null, thay thế máy 1
          //Vì đăng nhập lần đầu nên chỉ cần gán máy 1 thôi
          'id_device1': device_user,
          'id_device2': null,
        });

        FirebaseFirestore.instance
            .collection('users') //bảng user
            .doc(firebaseUser.uid) //tại id mới
            .set({
          //set các thuộc tính cho người dùng mới
          'nickname': firebaseUser.displayName,
          'photoUrl': firebaseUser.photoURL,
          'id': firebaseUser.uid,
          'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
          'chattingWith': null,
          'id_device1': device_user,
          'id_device2': null,
        });

        // Write data to local
        currentUser =
            firebaseUser; //lấy dữ liệu trong firebase thì cũng cần phải cập nhật lại công cụ moi dữ liệu luôn
        await prefs.setString('id', currentUser.uid);
        await prefs.setString('nickname', currentUser.displayName.toString());
        await prefs.setString('photoUrl', currentUser.photoURL.toString());
      } else {
        print("----------------------Đã đăng nhập trước đây rồi");

        String phone1 = documents[0]['id_device1']; //vì đã từng đăng nhập 1 lần trước đây rồi nên chắc chắn máy 1 khác null
        String phone2 = documents[0]['id_device2'];
        //nếu máy 2 bằng null, gán máy 2
        //nếu máy 2 khác null, máy 2 trở thành máy 1 và máy 1 được thay mới
        //nếu máy mới khác cả 2 máy đầu thì mới cho thay thế
        if (phone2.toString() == 'null' && phone1 != device_user) {
          FirebaseFirestore.instance
              .collection('users') //bảng user
              .doc(firebaseUser.uid) //tại id mới
              .update({
            'id_device2': device_user,
          });
        }
        else if (phone2.toString() != 'null' && device_user != phone2 && device_user != phone1){
          FirebaseFirestore.instance
              .collection('users') //bảng user
              .doc(firebaseUser.uid) //tại id mới
              .update({
            'id_device1': device_user,
            'id_device2': phone1,
          });
        }

        //nếu người dùng đăng nhập lần hai trở đi, thì tức là đã có tên trong firestore rồi  //document[0] = Instance of 'QueryDocumentSnapshot'
        // Write data to local
        await prefs.setString('id', documents[0]['id']);
        await prefs.setString('nickname', documents[0]['nickname']);
        await prefs.setString('photoUrl', documents[0]['photoUrl']);
        // await prefs.setString('aboutMe', documents[0]['aboutMe']);
        print("------------------bao gồm = " +
            documents[0]['id'] +
            documents[0]['nickname'] +
            documents[0]['photoUrl']);
      }
      Fluttertoast.showToast(msg: "Đăng nhập thành công");
      this.setState(() {
        isLoading = false;
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              //bên trên cũng có hàm route sang HomeScreen, nhưng route ở dưới đây là route khi ấn nút sign-in, chứ ko phải thực hiện ngay khi mở app lần đầu
              builder: (context) => MyHomePage(
                    title: 'VietStenoGame',
                  )));
    } else {
      //đăng nhập thất bại do không tìm thấy tên trên firestore
      print("firebaseUser bằng null null");
      Fluttertoast.showToast(msg: "Sign in fail");
      this.setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
                color: Color(0xFFBA1313), fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Image.asset('lib/image/selection_background.JPG',
                    // width: 300,
                    height: 150,
                    fit: BoxFit.fill),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 120.0),
                Align(
                  child: _loading
                      ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearPercentIndicator(
                        trailing: Icon(Icons.mood),
                        // animation: true,
                        animationDuration: 9000,
                        center:Text('${(_progressValue * 100).round()}%',style: TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF))),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        alignment:  MainAxisAlignment.center,
                        width: 300.0,
                        lineHeight: 24.0,
                        percent: _progressValue,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ) : Center(
                    child: FlatButton(
                      onPressed: handleSignIn,
                      child: Text(
                        'Đăng nhập bằng Google',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      color: Color(0xffdd4b39),
                      highlightColor: Color(0xffff7f7f),
                      splashColor: Colors.transparent,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                    ),
                  ),

                ),
              ],
            ),

            // Loading
            Positioned(
              child: isLoading
                  ? const Loading()
                  : Container(), //có xoay vòng khi loading, còn nếu load xong rồi thì positioned là Container(), tức là rỗng
            ),
          ],
        ));
  }

  void _updateProgress() {
    const oneSec = const Duration(milliseconds: 50);
    new Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.01;
        // we "finish" downloading here
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          return;
        }
      });
    });
  }
}

class Loading extends StatelessWidget {
  const Loading();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xfff5a623)),
        ),
      ),
      color: Colors.white.withOpacity(0.8),
    );
  }
}
