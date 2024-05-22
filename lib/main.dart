import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx/screens/screen1.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(100, 300),
      child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        home: Screen1(),
      ),
    );
  }
}
