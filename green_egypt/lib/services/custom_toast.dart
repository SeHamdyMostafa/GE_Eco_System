import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:green_egypt/config/theme/default_colors.dart';

class CustomToast {
  static void showGreenToast({required String messsage}) {
    Fluttertoast.showToast(
        msg: messsage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: DefaultColors.defaultGreen,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static void showRedToast({required String messsage}) {
    Fluttertoast.showToast(
        msg: messsage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static void showBlackToast({required String messsage}) {
    Fluttertoast.showToast(
        msg: messsage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static void showGreyToast({required String messsage}) {
    Fluttertoast.showToast(
        msg: messsage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
