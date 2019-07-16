import 'package:flutter/material.dart';
import 'package:flutter_soyang/components/app_bar.dart';
import 'package:flutter_soyang/components/state_layout.dart';

class WidgetNotFind extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: "页面不存在",
      ),
      body: StateLayout(
        type: StateType.account,
        hintText: "页面不存在",
      ),
    );
  }
}
