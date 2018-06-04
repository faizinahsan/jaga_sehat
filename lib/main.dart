import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'FormDemografi.dart';
import 'login.dart';
import 'dart:async';

void main(){
  runApp(MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomePage': (BuildContext context) => new HomePage(),
      '/FormDemografi': (BuildContext context) => new FormDemografi(),
      '/Login': (BuildContext context) => new LoginPage(),
    },
  ));
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Login');
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }
  @override
  Widget build(BuildContext context) {
  return new Container(
    decoration: const BoxDecoration(
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: const AssetImage('assets/SplashScreen.png'),
      )
    ),
 
    );
  }
}