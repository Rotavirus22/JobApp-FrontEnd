import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobapp/common/constants/flutterToast.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/services/dio_interceptor.dart';
import 'package:jobapp/services/local_storage.dart';
import 'package:jobapp/themes/app_themes.dart';

class RegisterState extends ChangeNotifier {
  Dio dio = dioService();

  String? fullName;
  String? position;
  String? email;
  String? password;
  String? confirmPassword;

  onFullNameChanged(value) {
    fullName = value;
    notifyListeners();
  }

  onEmailChanged(value) {
    email = value;
    notifyListeners();
  }

  onWorkPositionChanged(value) {
    position = value;
    notifyListeners();
  }

  onPasswordChanged(value) {
    password = value;
    notifyListeners();
  }

  onConfirmPasswordChanged(value) {
    confirmPassword = value;
    notifyListeners();
  }

  bool isLoading = false;

  register() async {
    isLoading = true;
    notifyListeners();
    var data = {
      'fullName': fullName,
      'email': email,
      'workPosition': position,
      'password': password,
      'confirm_password': confirmPassword,
    };

    try {
      var response = await dio.post('/users/register', data: data);
      Utils().toastMessage(
          message: response.data["message"], bgColor: sucessColor);
      localStorage.write('token', response.data["accessToken"]);
      var accessTkn = localStorage.read('token');
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
