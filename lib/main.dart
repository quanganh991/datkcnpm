import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:datk/KIEM_TRA/Selection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HOC/Selection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VietStenoGame',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'VietStenoGame'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;



  Future<Null> handleSignIn() async {
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    User? firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user; //lấy thông tin của người đăng nhập

    print("kiểm tra firebaseUser có null ko, firebaseUser = " + firebaseUser.toString());
    if (firebaseUser != null) { //nếu tìm thấy tài khoản google của người này trong firebase
      // Check is already sign up
      print("-------------------------------firebaseUser Khác null, = " + firebaseUser.toString());
      final QuerySnapshot result = await FirebaseFirestore.instance //QuerySnapshot dùng để chứa kết quả lấy được từ server
          .collection('users')
          .where('id', isEqualTo: firebaseUser.uid)
          .get(); //tìm kiếm id của người này dựa trên id trong tài khoản google đã đăng nhập

      print("Giá trị của QuerySnapshot result là " + result.toString());//[Instance of 'QueryDocumentSnapshot']
    } else {  //đăng nhập thất bại do không tìm thấy tên trên firestore
      print("firebaseUser bằng null null");
      print("----------------------Đăng nhập thất bại");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              //màu nền của ứng dụng
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFDADA),
                  Color(0xFFFFADAD),
                  Color(0xFFFD7A7A),
                  Color(0xFFFC6D6D),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      margin: EdgeInsets.symmetric(horizontal: 6.0),
                      child: IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {},
                        color: Colors.grey,
                      ),
                    ),
                    color: Color(0xFFFFDADA),
                  ),
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      margin: EdgeInsets.symmetric(horizontal: 6.0),
                      child: IconButton(
                        icon: Icon(Icons.bar_chart_outlined),
                        // onPressed: getSticker,
                        color: Colors.grey, onPressed: () {},
                      ),
                    ),
                    color: Color(0xFFFFDADA),
                  ),
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      margin: EdgeInsets.symmetric(horizontal: 6.0),
                      child: IconButton(
                        icon: Icon(Icons.event_note_rounded),
                        // onPressed: getSticker,
                        color: Colors.grey, onPressed: () {},
                      ),
                    ),
                    color: Color(0xFFFFDADA),
                  ),
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      margin: EdgeInsets.symmetric(horizontal: 6.0),
                      child: IconButton(
                        icon: Icon(Icons.comment_rounded),
                        onPressed: () => {},
                        color: Colors.grey,
                      ),
                    ),
                    color: Color(0xFFFFDADA),
                  ),
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      margin: EdgeInsets.symmetric(horizontal: 6.0),
                      child: IconButton(
                        icon: Icon(Icons.wb_incandescent_rounded),
                        onPressed: () => {
                          handleSignIn(),
                        },
                        color: Colors.grey,
                      ),
                    ),
                    color: Color(0xFFFFDADA),
                  ),
                ],
              ),
              const SizedBox(height: 0.0),

              Row(
                children: <Widget>[
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      margin: EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text("Cài đặt"),
                    ),
                    color: Color(0xFFFFDADA),
                  ),
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      margin: EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text("Lịch sử"),
                    ),
                    color: Color(0xFFFFDADA),
                  ),
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      margin: EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text("Xếp hạng"),
                    ),
                    color: Color(0xFFFFDADA),
                  ),
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      margin: EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text("Phản hồi"),
                    ),
                    color: Color(0xFFFFDADA),
                  ),
                  Material(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      margin: EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text("Hướng dẫn"),
                    ),
                    color: Color(0xFFFFDADA),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              // Image.asset("lib/image/steno_keyboard.jpg"),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Image.asset('lib/image/steno_keyboard.jpg',
                    // width: 300,
                    height: 150,
                    fit: BoxFit.fill),
              ),

              const SizedBox(height: 80.0),

              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 92.0),
                  child: FlatButton(
                    color: Colors.orangeAccent,
                    onPressed: () {
                      Navigator.push( //điều hướng sang màn hình mới
                        context,  //điều hướng từ
                        MaterialPageRoute(  //điều hướng sang
                          builder: (context) => HocSelection(),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Image.asset('lib/image/HOC.png',
                            // width: 300,
                            height: 50,
                            fit: BoxFit.fill),
                        Row(
                          children: [
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "Học",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 40),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40.0),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 92.0),
                  child: FlatButton(
                    color: Colors.yellowAccent,
                    onPressed: () {
                      Navigator.push( //điều hướng sang màn hình mới
                        context,  //điều hướng từ
                        MaterialPageRoute(  //điều hướng sang
                            builder: (context) => KiemtraSelection(),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Image.asset('lib/image/KIEM_TRA.jpg',
                            // width: 100,
                            height: 40,
                            fit: BoxFit.fill),
                        Row(
                          children: [
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "Kiểm Tra",
                              style: TextStyle(color: Colors.red, fontSize: 40),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 92.0),
                  child: FlatButton(
                    color: Colors.greenAccent,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Image.asset('lib/image/THI_DAU.png',
                            // width: 300,
                            height: 50,
                            fit: BoxFit.fill),
                        Row(
                          children: [
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "Thi Đấu",
                              style: TextStyle(
                                  color: Colors.deepOrangeAccent, fontSize: 40),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
