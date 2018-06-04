import 'package:flutter/material.dart';
import 'KontakPetugas.dart';
import 'FormDemografi.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => new _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
          color: Color(0xFFF3D6EA)
        ),
      child: new ListView(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.person),
            title: new Text("Kontak Petugas"),
            onTap: (){
              var routes = new MaterialPageRoute(
                      builder: (BuildContext context)=> new KontakPetugas(),
                    );
                    Navigator.of(context).push(routes);
            },          
          ),
          new ListTile(
            leading: new Icon(Icons.text_format),
            title: new Text("Form Demografi"),
            onTap: (){
              var routes = new MaterialPageRoute(
                builder: (BuildContext context)=> new FormDemografi(),
              );
              Navigator.of(context).push(routes);
            },
          ),
        ],
      ),
    );
  }
}

