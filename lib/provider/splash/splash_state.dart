import 'package:flutter/material.dart';
import 'package:jobapp/main.dart';

class SplashState extends ChangeNotifier {
  SplashState() {
    goToNext();
    Future.delayed(Duration(seconds: 3), () {
      navigagorKey.currentState!
          .pushNamedAndRemoveUntil('/login', (route) => false);
    });
  }
  goToNext() {}
}
