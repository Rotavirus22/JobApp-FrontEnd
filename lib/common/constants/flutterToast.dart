import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  void toastMessage({String? message, ToastGravity? gravity, Color? bgColor}) {
    Fluttertoast.showToast(
      msg: message ?? '',
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 10.0,
    );
  }
}
