import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0; //เรียกไฟล์แพคเกจมาใช้
import 'package:firebase_auth/firebase_auth.dart';
import 'package:natmex/screens/my_services.dart';

//พิมพ์ stl แล้วเลือก State ful,less
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Method
  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name :',
        labelStyle: TextStyle(color: Colors.blue),
        helperText: 'กรุณากรอกชื่อ',
        helperStyle: TextStyle(color: Colors.blue),
        icon: Icon(
          Icons.stars,
          size: 48.0,
          color: Colors.blue,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          //สิ่งที่กรอกไปในช่อง name จะเก็บไว้ใน value
          return 'Please Fill Name in Blank'; //ถ้าไม่กรอกจะฟ้องคำนี้
        }
      },
      onSaved: (String value) {
        //หลังจากอัพขึ้นคลาวด์ ให้เอาไปเก็บค่าไว้ที่ nameString
        nameString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email :',
        labelStyle: TextStyle(color: Colors.purple),
        helperText: 'you@email.com',
        helperStyle: TextStyle(color: Colors.purple),
        icon: Icon(
          Icons.email,
          size: 48.0,
          color: Colors.purple,
        ),
      ),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Type Email Format';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password :',
        labelStyle: TextStyle(color: Colors.green),
        helperText: 'More 6 Character',
        helperStyle: TextStyle(color: Colors.green),
        icon: Icon(
          Icons.lock,
          size: 48.0,
          color: Colors.green,
        ),
      ),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Pass Much More 6 Character';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Upload');
        if (formKey.currentState.validate()) {
          //validate คือ ตรวจสอบว่า true หมดไหม
          formKey.currentState.save();
          print(
              'Name = $nameString, Email = $emailString, Pass = $passwordString');
          register();
          //อัพไปคลาวด์แล้วแสดงผลตามที่โปรแกรม
        }
      },
    );
  }

//ถ้าฉันทำงานสำเร็จให้แสดง Register Success
  Future<void> register() async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
      email: emailString,
      password: passwordString,
    )
        .then((objResponse) {
      print('Register Success');
      setUpDisplayName();
    }).catchError((objResponse) {
      print('${objResponse.toString()}');
      myAlert(objResponse.code.toString(), objResponse.message.toString());
    });
  }

  Future<void> setUpDisplayName()async{

    await firebaseAuth.currentUser().then((response){
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = nameString;
      response.updateProfile(updateInfo);

      var serviceRoute = 
          MaterialPageRoute(builder: (BuildContext context) => MyServices());
          Navigator.of(context).pushAndRemoveUntil(serviceRoute, (Route<dynamic> route) => false);

          });

  }

  void myAlert(String titleString, String messageString) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titleString),
          content: Text(messageString),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Register'),
        actions: <Widget>[uploadButton()],
      ),
      body: Form(
        key: formKey,
        child: Container(
          //บรรทัดนี้คือการจัดการพื้นหลัง
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/book.jpg'),
              fit: BoxFit.cover, //ปรับภาพพื้นหลังให้คงอัตราส่วนไว้
            ),
          ),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 60.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration:
                BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.2)),
            width: 300.0,
            height: 285.0,
            child: Column(
              children: <Widget>[
                nameText(),
                emailText(),
                passwordText(),
              ],
            ),
          ),
        ),
      ),
    ); //สร้าง sc กด Ctrl+.
  }
}
