import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

//คำสั่ง TERMINAL
//Shift+Alt+F = จัดระเบียบโค้ด
//flutter_run = run
//flutter_devices = เช็คอุปกรณ์
//View>Terminal = เปิดกล่องใส่คำสั่ง

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  double mySize = 175.0; //ขนาดรูปภาพ

  //Method

  Widget signInButton() {
    return RaisedButton(
      child: Text('Sign In'),
      onPressed: () {},//ปุ่มสวย
    );
  }

  Widget myButton() {
    return Container(
      width: 220.0,
      child: Row(
        //แสดงผลจากซ้ายไปขวา
        children: <Widget>[
          signInButton(),
          signInButton(),
        ],
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 220.0,
      child: TextFormField(
        obscureText: true,//เปลี่ยนช่องใส่รหัสเป็นดอกจัน
        decoration: InputDecoration(//ทำให้เป็นช่องอินพุท
          labelText: 'Password :',
          hintText: 'More 6 Character',
        ),
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 220.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(//ทำให้เป็นช่องอินพุท
          labelText: 'Email :',
          hintText: 'you@email.com',
        ),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: mySize,
      height: mySize,
      child: Image.asset(
        'images/logo.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showText() {
    return Text('NATMEX',
        style: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.bold,
            color: Colors.yellow[700],
            fontFamily: 'VarelaRound'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,//แก้บัคช่องใส่รหัสมีแถบเหลือง
      body: Container(//ถุง
        padding: EdgeInsets.only(top: 60.0), //ห่างจากด้านบน
        alignment: Alignment.topCenter, //ไว้ตรงกลาง
        child: Column(
          //แสดงผลจากบนลงล่าง
          children: <Widget>[
            showLogo(),
            showText(),
            emailText(),
            passwordText(),
            myButton(),
          ],
        ),
      ),
    );
  }
}
