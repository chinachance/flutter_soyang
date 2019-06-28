import 'package:flutter/material.dart';
import 'home_fragment.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  HomePage() : super();

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
      body: Center(
        child: _widgetOptions.elementAt(_selectIndex),
      ),

      ///底部tab中间的突起的按钮
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            shoToast();
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      ///正常的tab
//      bottomNavigationBar: BottomAppBar(
//        color: Colors.lightBlue, //底部工具栏的颜色。
//        //设置底栏的形状，一般使用这个都是为了和floatingActionButton融合，
//        // 所以使用的值都是CircularNotchedRectangle(),有缺口的圆形矩形。
//        shape: CircularNotchedRectangle(),

//        child: BottomNavigationBar(
//          type: BottomNavigationBarType.fixed,
//          items: const <BottomNavigationBarItem>[
//            BottomNavigationBarItem(
//                icon: Icon(Icons.home), title: Text("learn")),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.message), title: Text("message")),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.near_me), title: Text("me")),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.near_me), title: Text("me"))
//          ],
//          currentIndex: _selectIndex,
//          selectedItemColor: Colors.amber[800],
//          onTap: onItemTapped,
//        ),
//      ),

      ///BottomAppBar 不规则底部工具栏 ----4个tab
      ///另外一种凹下去的tab
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue, //底部工具栏的颜色。
        //设置底栏的形状，一般使用这个都是为了和floatingActionButton融合，
        // 所以使用的值都是CircularNotchedRectangle(),有缺口的圆形矩形。
        shape: CircularNotchedRectangle(),
        child: Row(
          //里边可以放置大部分Widget，让我们随心所欲的设计底栏
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _selectIndex = 0;
                });
              },
            ),
            IconButton(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 100.0, 8.0),
              icon: Icon(Icons.access_alarms, color: Colors.white),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _selectIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _selectIndex = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _selectIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}
