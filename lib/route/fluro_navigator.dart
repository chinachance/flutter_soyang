import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soyang/route/routes.dart';

import 'application.dart';

/// fluro的路由跳转工具类
class NavigatorUtils {
  static push(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      TransitionType transition = TransitionType.native}) {
    Application.router.navigateTo(context, path,
        replace: replace, clearStack: clearStack, transition: transition);
  }

  static pushResult(
      BuildContext context, String path, Function(Object) function,
      {bool replace = false, bool clearStack = false}) {
    Application.router
        .navigateTo(context, path,
            replace: replace,
            clearStack: clearStack,
            transition: TransitionType.native)
        .then((result) {
      // 页面返回result为null
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((error) {
      print("$error");
    });
  }

  /// 返回
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// 带参数返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  /// 跳到WebView页
  static goWebViewPage(BuildContext context, String title, String url) {
    //fluro 不支持传中文,需转换
    push(context,
        '${Routes.web}?title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}');
  }
}
