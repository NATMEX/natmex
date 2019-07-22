import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:natmex/screens/my_services.dart';
import 'package:natmex/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

//คำสั่ง TERMINAL
//Shift+Alt+F = จัดระเบียบโค้ด
//r = รีเฟรชหน้าปัจจุบัน
//R = รีเฟรชทุกหน้าแล้วกลับไปหน้าแรก
//q = หยุดกระบวนการทุกอย่าง
//flutter run = run
//flutter devices = เช็คอุปกรณ์
//View>Terminal = เปิดกล่องใส่คำสั่ง

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  double mySize = 175.0; //ขนาดรูปภาพ
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Method

  @override
  void initState(){
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus()async{

    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      
    }
  }


  void moveToService(){

    var serviceRoute = MaterialPageRoute(builder: (BuildContext context) => MyServices());
    Navigator.of(context).pushAndRemoveUntil(serviceRoute, (Route<dynamic> Route) => false);

  }


  Widget mySizeBox() {
    return SizedBox(
      width: 8.0, //ระยะห่างของปุ่ม
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      color: Colors.yellow,
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.black),
        //Accent ใช้ได้แค่กับบางสีเท่านั้น
      ),
      onPressed: () {
        //ตั้งค่าการคลิก
        print('You Click SignUp');
        // Create Rounte
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.yellow,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {},
    );
  }

  Widget myButton() {
    return Container(
      //ถุง CON ไว้ใส่ของ
      width: 220.0,
      child: Row(
        //ถุง CHI ไว้ย้าย CON
        //ROW แสดงผลจากซ้ายไปขวา
        children: <Widget>[
          Expanded(
            //ถุง EXP ขยายในที่ๆไปได้
            child: signInButton(),
          ),
          mySizeBox(), //สร้างระยะห่างระหว่างปุ่ม
          Expanded(
            child: signUpButton(),
          ),
        ],
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 220.0,
      child: TextFormField(
        obscureText: true, //เปลี่ยนช่องใส่รหัสเป็นดอกจัน
        decoration: InputDecoration(
          //ทำให้เป็นช่องอินพุท
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
        decoration: InputDecoration(
          //ทำให้เป็นช่องอินพุท
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
        //เอาภาพมาใส่
        'images/logo.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showText() {
    return Text('NATMEX',
        style: TextStyle(
            //รูปแบบฟอนต์
            fontSize: 45.0,
            fontWeight: FontWeight.bold,
            color: Colors.yellow[700],
            fontFamily: 'VarelaRound'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, //แก้บัคช่องใส่รหัสมีแถบเหลือง
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          //ไล่เฉดสีพื้นหลัง
          colors: [Colors.yellowAccent, Colors.lightGreenAccent],
          begin: Alignment.topLeft, //การฉายแสง
        )),
        padding: EdgeInsets.only(top: 50.0), //ห่างจากด้านบน
        alignment: Alignment.topCenter, //ไว้ตรงกลาง
        child: Column(
          //COL แสดงผลจากบนลงล่าง
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
