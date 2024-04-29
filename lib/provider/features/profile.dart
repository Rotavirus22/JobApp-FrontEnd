// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobapp/models/dashBoardModel.dart';
import 'package:jobapp/services/dio_interceptor.dart';

class ProfileState extends ChangeNotifier {
  Profile() {
    getDashboardInfo();
  }

  Dio dio = dioService();

  bool isLoading = false;

  DashboardModel? dashBoardModel;
  getDashboardInfo() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await dio.get('/users/dashboard');
      dashBoardModel = DashboardModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e.message);
    }
  }
}
