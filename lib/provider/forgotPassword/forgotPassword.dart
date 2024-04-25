import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/services/dio_interceptor.dart';

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
      navigagorKey.currentState!.pushNamed('/resetPassword', arguments: {
        'email': email,
      });
    } on DioException catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
