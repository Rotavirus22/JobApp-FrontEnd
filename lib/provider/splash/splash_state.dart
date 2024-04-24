import 'package:flutter/material.dart';

class SplashState extends ChangeNotifier {
  SplashState() {
    goToNext();
    Future.delayed(Duration(seconds: 3), () {
      // navigagorKey.currentState!
      //     .pushNamedAndRemoveUntil('/login', (route) => false);
    });
  }
  goToNext() {}
}
