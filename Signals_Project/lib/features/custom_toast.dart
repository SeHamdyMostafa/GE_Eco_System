import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void showBlackToast({required String message}) {
    Fluttertoast.showToast(
        msg: message + " ✔",
        toastLength: Toast.LENGTH_LONG,
        fontSize: 16,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        backgroundColor: Colors.black);
  }

  static void showRedToast({required String message}) {
    Fluttertoast.showToast(
        msg: message + ' ❌',
        toastLength: Toast.LENGTH_LONG,
        fontSize: 16,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        backgroundColor: Colors.red);
  }
}
