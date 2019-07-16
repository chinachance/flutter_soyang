import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toasts {
  static show(String msg, {toastLength = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.black,
    );
  }

  static cancelToast() {
    Fluttertoast.cancel();
  }
}
