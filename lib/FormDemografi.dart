import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:firebase_database/firebase_database.dart';

class FormDemografi extends StatefulWidget {
  @override
  _FormDemografiState createState() => new _FormDemografiState();
}

class _FormDemografiState extends State<FormDemografi> {
  List<Item> items = List();
  Item item;
  DatabaseReference itemRef;
  String radioValue ="";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // List listPendidikan = ["Tidak Sekolah","TK","SD","SMP","SMA/SMK","Sarjana","Magister","Doktor"];
  // List<DropdownMenuItem<String>> dropDownItems;
  // String currentPendidikan;
  @override
  void initState() {
    super.initState();
    item = Item("","","","","","");
    final FirebaseDatabase database = FirebaseDatabase.instance; //Rather then just writing FirebaseDatabase(), get the instance.  
    itemRef = database.reference().child('items');
    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildChanged.listen(_onEntryChanged);
  }


  _onEntryAdded(Event event) {
    setState(() {
      items.add(Item.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    var old = items.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      items[items.indexOf(old)] = Item.fromSnapshot(event.snapshot);
    });
  }

  void handleSubmit() {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();
      itemRef.push().set(item.toJson());
    }
  }
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
        child: new Form(
          key: formKey,
          child: new ListView(
          children: <Widget>[
            //Nama Lengkap
            new ListTile(
              leading: new Icon(Icons.info),
              title: new TextFormField(
                decoration: new InputDecoration(
                  hintText:"Masukan Nama Lengkap Anda",
                ),
                
                initialValue: "",
                onSaved: (val)=> item.nama = val,
                validator: (val)=>val==""?val:null,
              ),
            ),
            //Usia
            new ListTile(
              leading: new Icon(Icons.info),
              title: new TextFormField(
                decoration: new InputDecoration(
                  hintText:"Masukan Usia Anda",
                ),
                keyboardType: TextInputType.number,
                initialValue: "",
                onSaved: (val)=> item.usia = val,
                validator: (val)=>val==""?val:null,
              ),
            ),
            //Jenis Kelamin
            new ListTile(
              leading: new Icon(Icons.info),
              title: new TextFormField(
                decoration: new InputDecoration(
                  hintText:"Masukan Jenis Kelamin Anda",
                ),
                maxLength: 1,
                keyboardType: TextInputType.text,
                initialValue: "",
                onSaved: (val)=> item.pendidikan = val,
                validator: (val)=>val==""?val:null,
              ),
            ),

            // //Jenis Kelamin
            // new RadioListTile(
            //   title: Text("Pria"),
            //   value:"Pria",
            //   groupValue: radioValue,
            //   onChanged:(String value){setState(() {radioValue = value;item.jk = radioValue;});}
            // ),
            // //Jenis Kelamin
            // new RadioListTile(
            //   title: Text("Wanita"),
            //   value:"Wanita",
            //   groupValue: radioValue,
            //   onChanged:(String value){setState(() {radioValue = value;item.jk = radioValue;});},              
            // ),
            //Pendidikan
            new ListTile(
              leading: new Icon(Icons.info),
              title: new TextFormField(
                decoration: new InputDecoration(
                  hintText:"Masukan Pendidikan Terakhir Anda",
                ),
                initialValue: "",
                onSaved: (val)=> item.pendidikan = val,
                validator: (val)=>val==""?val:null,
              ),
            ),
            //Pekerjaan
            new ListTile(
              leading: new Icon(Icons.info),
              title: new TextFormField(
                decoration: new InputDecoration(
                  hintText:"Masukan Pekerjaan Anda",
                ),
                initialValue: "",
                onSaved: (val)=> item.pekerjaan = val,
                validator: (val)=>val==""?val:null,
              ),
            ),
            //Email
            new ListTile(
              leading: new Icon(Icons.info),
              title: new TextFormField(
                decoration: new InputDecoration(
                  hintText:"Masukan Email Lengkap Anda",
                ),
                keyboardType: TextInputType.emailAddress,
                initialValue: "",
                onSaved: (val)=> item.email = val,
                validator: (val)=>val==""?val:null,
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 20.0)
            ),
            new MaterialButton(
              child: new Text("SUBMIT"),
              color: Colors.blue,
              onPressed: (){
              handleSubmit();
              var routes = new MaterialPageRoute(
                builder: (BuildContext context)=> new HomePage(),
              );
              Navigator.of(context).pushReplacement(routes);
              },
            )
          ],
        ),
        )
      ),
    );
  }
}
class Item{
  String key;
  String nama;
  String jk;
  String usia;
  String pendidikan;
  String pekerjaan;
  String email;
  Item(this.nama,this.jk,this.usia,this.pendidikan,this.pekerjaan,this.email);

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        nama = snapshot.value["nama"],
        jk = snapshot.value["jk"],
        usia = snapshot.value["usia"],
        pendidikan= snapshot.value["pendidikan"],
        pekerjaan = snapshot.value["pekerjaan"],
        email = snapshot.value["email"];
  toJson() {
    return {
      "nama": nama,
      "jk": jk,
      "usia": usia,
      "pendidikan": pendidikan,
      "pekerjaan": pekerjaan,
      "email": email,
    };
  }
}