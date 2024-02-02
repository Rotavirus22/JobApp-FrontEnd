import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/services/dio_interceptor.dart';
import 'package:jobapp/services/local_storage.dart';

class RegisterState extends ChangeNotifier {
  Dio dio = dioService();

  String? fullName;
  String? email;
  String? password;

  onFullNameChanged(value) {
    fullName = value;
  }

  onEmailChanged(value) {
    email = value;
  }

  onPasswordChanged(value) {
    password = value;
  }

  bool isLoading = false;

  register() async {
    isLoading = true;
    notifyListeners();
    var data = {'fullName': fullName, 'email': email, 'password': password};

    try {
      var response = await dio.post('/users/register', data: data);
      localStorage.write('token', response.data["accessToken"]);
      var accessTkn = localStorage.read('token');
      navigagorKey.currentState!.pushReplacementNamed('/home');
    } on DioException catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
