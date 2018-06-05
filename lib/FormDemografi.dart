import 'package:flutter/material.dart';
import 'HomePage.dart';
class FormDemografi extends StatefulWidget {
  @override
  _FormDemografiState createState() => new _FormDemografiState();
}

class _FormDemografiState extends State<FormDemografi> {
  final TextEditingController namaCon = new TextEditingController();
  final TextEditingController jkCon = new TextEditingController();
  final TextEditingController usiaCon = new TextEditingController();
  final TextEditingController pendidikanCon = new TextEditingController();
  final TextEditingController pekerjaanCon = new TextEditingController();
  final TextEditingController emailCon = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Form Demografi"),
       backgroundColor: Colors.pink,        
      ) ,
      body: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF3D6EA)
        ),
        child: new ListView(
          children: <Widget>[
            new FormDemografiList(icons: Icons.people ,controller: namaCon,title: "Nama Lengkap",),
            new FormDemografiList(icons: Icons.people,controller: jkCon,title: "Jenis Kelamin",),
            new FormDemografiList(icons: Icons.calendar_today,controller:usiaCon,title: "Usia",),
            new FormDemografiList(icons: Icons.business,controller: pendidikanCon,title: "Pendidikan",),
            new FormDemografiList(icons: Icons.work,controller: pekerjaanCon,title: "Pekerjaan",),
            new FormDemografiList(icons: Icons.email,controller: emailCon,title: "Email",),
            new Padding(
              padding: new EdgeInsets.only(top: 20.0)
            ),
            new MaterialButton(
              child: new Text("SUBMIT"),
              color: Colors.blue,
              onPressed: (){
              var routes = new MaterialPageRoute(
                builder: (BuildContext context)=> new HomePage(),
              );
              Navigator.of(context).pushReplacement(routes);
              },
            )
          ],
        )
      ),
    );
  }
}
class FormDemografiList extends StatelessWidget {
  final String title;
  IconData icons;
  TextEditingController controller = new TextEditingController();  
  FormDemografiList({this.icons,this.controller,this.title});
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new ListTile(
          leading: new Icon(icons),
          title: new TextField(
            decoration: new InputDecoration(
              hintText: title,
            ),
            controller: controller,
          ),
        )
    );
  }
}