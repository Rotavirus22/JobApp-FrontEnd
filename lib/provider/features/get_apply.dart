import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/flutterToast.dart';
import 'package:jobapp/models/applyModel.dart';
import 'package:jobapp/models/dashBoardModel.dart';
import 'package:jobapp/services/dio_interceptor.dart';
import 'package:jobapp/themes/app_themes.dart';

class MyApply extends ChangeNotifier {
  MyApply() {
    init();
  }

  String? userId;

  init() async {
    await getUserInfo();
    getMyapply();
  }

  DashboardModel? dashboardModel;
  ApplyModel? applyModel;

  Dio dio = dioService();
  bool isLoading = false;

  getUserInfo() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await dio.get("/users/dashboard");
      dashboardModel = DashboardModel.fromJson(response.data);
      userId = dashboardModel?.data?.sId;
    } on DioException catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  getMyapply() async {
    isLoading = true;
    notifyListeners();
    try {
      print(userId);
      var response = await dio.get('/job/apply/users/${userId}');
      applyModel = ApplyModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e);
      var errorMessage =
          e.response?.data != null && e.response?.data['message'] != null
              ? e.response?.data['message']
              : 'Unknown error occurred';
      Utils().toastMessage(message: errorMessage, bgColor: errorColor);
    }
    isLoading = false;
    notifyListeners();
  }
}
