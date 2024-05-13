import 'package:flutter/material.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/services/local_storage.dart';

class SplashState extends ChangeNotifier {
  SplashState() {
    var accessTkn = localStorage.read('token');
    Future.delayed(Duration(seconds: 2), () {
      goToNext();
    });
  }
  goToNext() {
    var accessTkn = localStorage.read("token");
    print(accessTkn);
    if (accessTkn != null) {
      navigagorKey.currentState!.pushReplacementNamed('/bottomNav');
    } else {
      navigagorKey.currentState!.pushReplacementNamed('/landing');
    }
  }
}
