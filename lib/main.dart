import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:natmex/screens/authen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown,]); //ล็อคจอไม่ให้หมุน
    return MaterialApp(
      home: Authen(),
    );
  }
}
