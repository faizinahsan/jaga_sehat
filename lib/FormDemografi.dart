import 'package:flutter/material.dart';
import 'HomePage.dart';
class FormDemografi extends StatefulWidget {
  @override
  _FormDemografiState createState() => new _FormDemografiState();
}

class _FormDemografiState extends State<FormDemografi> {
  final TextEditingController controller1 = new TextEditingController();
  final TextEditingController controller2 = new TextEditingController();
  final TextEditingController controller3 = new TextEditingController();
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
            new FormDemografiList(icons: Icons.people ,controller: controller1,title: "Nama Lengkap",),
            new FormDemografiList(icons: Icons.people,controller: controller2,title: "Jenis Kelamin",),
            new FormDemografiList(icons: Icons.calendar_today,controller: controller2,title: "Usia",),
            new FormDemografiList(icons: Icons.business,controller: controller2,title: "Pendidikan",),
            new FormDemografiList(icons: Icons.work,controller: controller2,title: "Pekerjaan",),
            new FormDemografiList(icons: Icons.email,controller: controller2,title: "Email",),
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