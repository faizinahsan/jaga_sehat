import 'package:flutter/material.dart';
import 'FormDemografi.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.pink
      ),
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000)
    );
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut
    );
    _iconAnimation.addListener(()=>this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFF3D6EA),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/backgroundLogin.png"),
            fit: BoxFit.cover,
            // color: Colors.black54,
            // colorBlendMode: BlendMode.darken,
          ),
          new Theme(
            data: new ThemeData(
              brightness: Brightness.light,
              inputDecorationTheme: new InputDecorationTheme(
                labelStyle: new TextStyle(color: Colors.pink,fontSize: 25.0)
              )
            ),
            isMaterialAppTheme: true,
            child:new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // new FlutterLogo(
                  
                //   size: _iconAnimation.value*100,
                // ),
                // new ImageIcon(
                //   new AssetImage("assets/logo.png"),
                //   size: _iconAnimation.value*100,
                //   color: null,
                // ),
                 //Logo
                  new Image(
                    image: new AssetImage("assets/logo.png"),
                    width: _iconAnimation.value*200,
                    height: _iconAnimation.value*200,
                    color: null,
                  ),
                  
                  new Container(
                        padding: const EdgeInsets.all(20.0),
                        child: new Form(
                          autovalidate: true,
                          child:new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new TextFormField(
                                decoration: new InputDecoration(
                                  hintText: "Enter Email",fillColor: Colors.black
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              new TextFormField(
                                decoration: new InputDecoration(
                                  hintText: "Enter Password",

                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),  
                              new Padding(
                                padding: const EdgeInsets.only(top: 60.0),
                              ),
                              new MaterialButton(
                                height: 50.0,
                                minWidth: 150.0,
                                color: Colors.pink,
                                splashColor: Colors.pinkAccent,
                                textColor: Colors.white,
                                child: new Icon(Icons.transit_enterexit),
                                onPressed: () {
                                  var routes = new MaterialPageRoute(
                                    builder: (BuildContext context)=> new FormDemografi(),
                                  );
                                  Navigator.of(context).pushReplacement(routes);
                                },
                              )
                            ],
                          ),
                        ),      
                      )
              ],
            ) ,
          ),
        ],
      ),
    );
  }
}















/*
import 'package:flutter/material.dart';
import 'FormDemografi.dart';
import 'HomePage.dart';
void main(){
  runApp(
    new MaterialApp(
      home: new LoginScreen(),
    )
  );
}
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("You need to Login"),
        backgroundColor: Colors.pink,
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
          key: this._formKey,
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(
                  hintText: 'you@example.com',
                  labelText: 'Email'
                ),
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  hintText: 'Password',
                  labelText: 'Enter your Password'
                ),
              ),
              new Container(
                child: new MaterialButton(
                  height:40.0,
                  color: Colors.pink,                  
                  child: new Text("Login",style: new TextStyle(
                    color: Colors.white,
                  ),),
                  onPressed: (){
                    var routes = new MaterialPageRoute(
                      builder: (BuildContext context)=> new HomePage(),
                    );
                    Navigator.of(context).pushReplacement(routes);
                  },
                ),
                margin: new EdgeInsets.only(top: 20.0),
              )
            ],   
          ),
        ),
      ),
    );
  }
}
 */