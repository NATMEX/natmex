import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0; //เรียกไฟล์แพคเกจมาใช้

//พิมพ์ stl แล้วเลือก State ful,less
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
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
    );
  }

  Widget emailText() {
    return TextFormField(
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
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Register'),
        actions: <Widget>[uploadButton()],
      ),
      body: Container(
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
          decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.4)),
          width: 300.0,
          height: 300.0,
          child: Column(
            children: <Widget>[
              nameText(),
              emailText(),
              passwordText(),
            ],
          ),
        ),
      ),
    ); //สร้าง sc กด Ctrl+.
  }
}
