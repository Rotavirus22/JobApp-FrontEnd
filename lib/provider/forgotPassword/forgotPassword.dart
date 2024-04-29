import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobapp/common/constants/flutterToast.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/services/dio_interceptor.dart';
import 'package:jobapp/themes/app_themes.dart';

class ForgotPasswordState extends ChangeNotifier {
  String? email;
  bool isLoading = false;

  Dio dio = dioService();

  onEmailChanged(value) {
    email = value;
    notifyListeners();
  }

  forgotPassword() async {
    isLoading = true;
    notifyListeners();

    var data = {
      'email': email,
    };
    try {
      var response = await dio.post('/users/forgotPw', data: data);
      Utils().toastMessage(
          message: response.data["message"], bgColor: sucessColor);
      navigagorKey.currentState!.pushNamed('/resetPassword', arguments: {
        'email': email,
      });
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
