import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {

  final String url;
  final String title;

  WebViewPage(this.url, this.title);

  @override
  State<StatefulWidget> createState() {
    return _WebViewState(url,title);
  }
}

class _WebViewState extends State {

  final String url;
  final String title;

  _WebViewState(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebviewScaffold(
        url:url,
        withZoom: false,
        withLocalStorage: false,
        withJavascript: true,
      ),
    );
  }

}