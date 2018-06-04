import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => new _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
          color: Color(0xFFF3D6EA)
        ),
       child:Center(
         child: Column(
           children: <Widget>[
             Text("Ini Adalah HomePage")
           ],
         ),
       )
    );    
  }
}