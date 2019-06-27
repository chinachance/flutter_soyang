import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soyang/page/home.dart';
import 'package:flutter_soyang/page/webview.dart';

var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new HomePage();
});

var webViewHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  //获取路由跳转传来的参数
  String url = params["url"].first;
  String title = params["title"].first;
  return new WebViewPage(url, title);
});
