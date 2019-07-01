import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

//Ctrl+Alt+F=จัดระเบียบ
//flutter_run=run
//View>Terminal=เปิดกล่องใส่คำสั่ง

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showLogo() {
    return Image.asset(
      'images/logo.png',
      fit: BoxFit.contain,
    ); //ใส่รูปภาพ
  }

  Widget showText() {
    return Text('Authen'); //ใส่ตัวหนังสือ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0), //ห่างจากด้านบน
        alignment: Alignment.topCenter, //ไว้ตรงกลาง
        child: Column(
          children: <Widget>[showLogo(), showText()], //แสดงผลเป็นบรรทัด
        ),
      ),
    );
  }
}
