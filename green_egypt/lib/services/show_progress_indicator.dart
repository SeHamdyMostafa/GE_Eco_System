import 'package:flutter/material.dart';

class ShowProgressIndicator {
  ShowProgressIndicator._privateConstructor();

  static final ShowProgressIndicator _instance =
      ShowProgressIndicator._privateConstructor();

  static ShowProgressIndicator get instance => _instance;

  void showLoadingIndicator({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
      },
    );
  }
}
