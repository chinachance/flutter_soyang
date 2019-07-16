import 'package:flutter/material.dart';
import 'package:flutter_soyang/components/MenuTabBar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_fragment.dart';

class HomeNewPage extends StatelessWidget {
  HomeNewPage() : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
      home: TabPage(),
    );
  }
}

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() {
    return _TabPageState();
  }
}

class _TabPageState extends State<TabPage> {
  int _selectIndex = 0;
  bool _selectOne = false;
  bool _selectTwo = false;
  bool _selectThree = false;
  bool _selectFour = false;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeFragmentPage(),
    HomeFragmentPage(),
    HomeFragmentPage(),
    HomeFragmentPage(),
  ];

  ///显示toast
  void shoToast() {
    Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: new SafeArea(
          child: new Stack(
        children: <Widget>[
          new Center(
            child: _widgetOptions.elementAt(_selectIndex),
          ),
          new MenuTabBar(
            background: Colors.blue,
            iconButtons: [
              new IconButton(
                  color: _selectOne ? Colors.red : Colors.blue,
                  icon: new Icon(Icons.home, size: 30),
                  onPressed: () {
                    _selectIndex = 0;
                    setState(() {
                      _selectOne = true;
                      _selectTwo = false;
                    });
                  }),
              new IconButton(
                  color: Colors.blue,
                  icon: _selectTwo
                      ? new Icon(Icons.search, size: 30)
                      : new Icon(Icons.ac_unit, size: 30),
                  onPressed: () {
                    _selectIndex = 1;
                    setState(() {
                      _selectOne = false;
                      _selectTwo = true;
                    });
                  }),
              new IconButton(
                  color: Colors.blue,
                  icon: new Icon(Icons.map, size: 30),
                  onPressed: () {
                    _selectIndex = 2;
                  }),
              new IconButton(
                  color: Colors.blue,
                  icon: new Icon(Icons.favorite, size: 30),
                  onPressed: () {
                    _selectIndex = 3;
                  }),
            ],
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    child: new Text("Reminder",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    margin: EdgeInsets.all(10),
                  ),
                  new Container(
                      child: new Text("Camera",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      margin: EdgeInsets.all(10)),
                  new Container(
                      child: new Text("Attchment",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      margin: EdgeInsets.all(10)),
                  new Container(
                      child: new Text("Text Note",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      margin: EdgeInsets.all(10))
                ]),
          )
        ],
      )),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}
