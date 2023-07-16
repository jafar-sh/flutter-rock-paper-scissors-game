import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rock_paper_scissors_game/screens/home2screen.dart';
import 'package:rock_paper_scissors_game/screens/homescreen.dart';
import 'package:rock_paper_scissors_game/screens/testscreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ApplicationInit(),
    );
  }
}

class ApplicationInit extends StatelessWidget {
  const ApplicationInit({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    // return Home2Screen(myWidth: ScreenUtil().screenWidth, myHight: ScreenUtil().screenHeight,);
    // // return TestScreen();
    return HomeScreen(myWidth: ScreenUtil().screenWidth, myHight: ScreenUtil().screenHeight);
  }
}
