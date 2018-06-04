import 'package:flutter/material.dart';
import 'FirstPage.dart' as first;
import 'SecondPage.dart' as second;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController tabController;
  @override
  void initState(){
    super.initState();
    tabController = new TabController(vsync: this, length: 2);
  }
  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     appBar: AppBar(
       title: Text("Jaga Sehat App"),
       backgroundColor: Colors.pink,
     ),
      bottomNavigationBar: new Material(
        color: Colors.pink,
        child: new TabBar(
        controller: tabController,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home), ),
            new Tab(icon: new Icon(Icons.settings), ),
          ],
        ),
      ),
     body: new TabBarView(
       controller: tabController,
      children: <Widget>[
      new first.FirstPage(),
       new second.SecondPage(),        
      ],       
     ),
    );
  }
}