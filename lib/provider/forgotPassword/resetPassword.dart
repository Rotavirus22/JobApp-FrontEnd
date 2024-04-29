import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobapp/common/constants/flutterToast.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/services/dio_interceptor.dart';
import 'package:jobapp/themes/app_themes.dart';

class ResetPasswordState extends ChangeNotifier {
  ResetPasswordState(context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    email = args['email'];
  }
  String? email;
  String? otp;
  String? newPassword;
  bool isLoading = false;

  Dio dio = dioService();

  onNewPasswordChanged(value) {
    newPassword = value;
    notifyListeners();
  }

  onOtpChanged(value) {
    otp = value;
    notifyListeners();
  }

  resetPassword() async {
    isLoading = true;
    notifyListeners();

    var data = {
      'email': email,
      'new_password': newPassword,
      'resetCode': otp,
    };
    try {
      var response = await dio.post('/users/resetPw', data: data);
      Utils().toastMessage(
          message: response.data["message"], bgColor: sucessColor);
      navigagorKey.currentState!.pushReplacementNamed('/login');
    } on DioException catch (e) {
      print('dIO ERROR ${e.response}');
      var errorMessage = e.response?.data != null
          ? e.response?.data['errors'] != null &&
                  e.response?.data['errors'].isNotEmpty
              ? e.response?.data['errors'][0]['message']
              : 'Unknown error occurred'
          : 'Check your internet connection';
      Utils().toastMessage(
          message: errorMessage,
          bgColor: errorColor,
          gravity: ToastGravity.TOP);
    }
  }
}
