import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soyang/route/route_handlers.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String newHome = "/new_home";
  static String web = "/web";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("route is not find !");
    });

    router.define(home, handler: homeHandler);
    router.define(newHome, handler: newHomeHandler);
    router.define(web, handler: webViewHandler);
  }
}
