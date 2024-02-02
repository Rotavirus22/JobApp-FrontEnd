import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobapp/common/app_constant.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/services/dio_interceptor.dart';
import 'package:jobapp/services/local_storage.dart';

class LoginState extends ChangeNotifier {
  String? email;
  String? password;

  Dio dio = dioService();

  onEmailChanged(value) {
    email = value;
    notifyListeners();
  }

  onPasswordChanged(value) {
    password = value;
    notifyListeners();
  }

  bool isLoading = false;
  login() async {
    isLoading = true;
    notifyListeners();
    var data = {'email': email, 'password': password};
    try {
      var response = await dio.post("/users/login", data: data);
      localStorage.write('token', response.data["accessToken"]);
      var accessTkn = localStorage.read('token');
      print(accessTkn);
      navigagorKey.currentState!.pushReplacementNamed('/home');
    } on DioException catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
