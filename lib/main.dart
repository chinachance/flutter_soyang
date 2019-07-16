import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soyang/route/application.dart';
import 'package:flutter_soyang/route/fluro_navigator.dart';
import 'package:flutter_soyang/route/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    //初始化路由
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '新氧Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      //初始化路由
      onGenerateRoute: Application.router.generator,
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //跳转到首页
        NavigatorUtils.push(
            context, '/home', transition: TransitionType.fadeIn, replace: true);
//        NavigatorUtils.push(context, '/new_home',transition: TransitionType.fadeIn,replace: true);
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Image.asset(
          'assets/images/ic_add.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
