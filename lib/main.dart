import 'package:flutter/material.dart';
import './homepage.dart';
import './carousel.dart';
import './login.dart';
import './signup.dart';
import 'otp.dart';
import './dashboard.dart';

void main() => runApp(
      new MyApp(),
    );

class MyApp extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: new CarouselPage(),
      routes: <String, WidgetBuilder>{
        'carousel': (BuildContext context) => new CarouselPage(),
        'login': (BuildContext context) => new LoginPage(),
        'homepage': (BuildContext context)=> new HomePage(),
       'signup': (BuildContext context)=> new SignupPage(),
       'otp': (BuildContext context)=> new OtpPage(),
       'dashboard': (BuildContext context)=> new DashBoardPage(),
        },
    );
  }
}