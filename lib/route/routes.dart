import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soyang/page/404.dart';
import 'package:flutter_soyang/page/home.dart';
import 'package:flutter_soyang/page/home_two.dart';
import 'package:flutter_soyang/page/webview.dart';
import 'package:flutter_soyang/route/router_init.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String newHome = "/new_home";
  static String web = "/web";

  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("route is not find !");
      return WidgetNotFind();
    });

    router.define(home, handler: Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            HomePage()));
    router.define(newHome, handler: Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            HomeNewPage()));
    router.define(web, handler: Handler(handlerFunc: (_, params) {
      String title = params['title']?.first;
      String url = params['url']?.first;
      return WebViewPage(url, title);
    }));

    _listRouter.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化
//    _listRouter.add(ShopRouter());

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
