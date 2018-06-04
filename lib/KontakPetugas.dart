import 'package:flutter/material.dart';
class KontakPetugas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Kontak Petugas"),
       backgroundColor: Colors.pink,        
      ),
      body: 
          new Container(      
        decoration: BoxDecoration(
          color: Color(0xFFF3D6EA)
        ),
          child: new ListView(
            children: <Widget>[
              new ListContact(nama:"Rafidgadah Darmarta",okupasi: "Ahli Hermatologi",),
              new ListContact(nama:"Vega Savera Yuana",okupasi: "Medical Oncologist",),
              new ListContact(nama:"Santo Joosten Malau",okupasi: "Radiation Oncologist",),
              new ListContact(nama:"Reynaldi Noer Rizki",okupasi: "Pediatric Oncologists",),
            ],
          ) ,
        ),
    );
  }
}
class ListContact extends StatelessWidget {
  ListContact({this.nama,this.okupasi});
  final String nama;
  final String okupasi;
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Row(
          children: <Widget>[
            new Icon(Icons.person,size:40.0 ,),
            new Padding(
              padding: new EdgeInsets.all(10.0)
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new Text(nama, style:new TextStyle(fontSize: 30.0,color: Colors.blue)),
                new Text(okupasi,style:new TextStyle(fontSize:20.0 )),
                new Padding(
                  padding: new EdgeInsets.only(bottom:20.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}