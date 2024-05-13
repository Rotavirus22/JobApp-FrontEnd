import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobapp/common/constants/flutterToast.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/services/dio_interceptor.dart';
import 'package:jobapp/services/local_storage.dart';
import 'package:jobapp/themes/app_themes.dart';

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
      Utils().toastMessage(
          message: response.data["message"], bgColor: sucessColor);
      localStorage.write('token', response.data["accessToken"]);
      var accessTkn = localStorage.read('token');
      print(accessTkn);
      navigagorKey.currentState!.pushReplacementNamed('/bottomNav');
    } on DioException catch (e) {
      print(e);
      var errorMessage =
          e.response?.data != null && e.response?.data['message'] != null
              ? e.response?.data['message']
              : 'Unknown error occurred';
      Utils().toastMessage(
          message: errorMessage,
          bgColor: errorColor,
          gravity: ToastGravity.TOP);
    }
    isLoading = false;
    notifyListeners();
  }
}
