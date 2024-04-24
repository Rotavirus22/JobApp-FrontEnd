import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobapp/models/dashBoardModel.dart';
import 'package:jobapp/models/jobModel.dart';
import 'package:jobapp/services/dio_interceptor.dart';

class JobState extends ChangeNotifier {
  JobState() {
    _initializeDashboard();
  }
  Future<void> _initializeDashboard() async {
    try {
      await getDashBoardInfo();
      await getJob();
    } catch (e) {
      print(e);
    }
  }

  Dio dio = dioService();
  bool isLoading = false;

  String? userId;

  JobModel? jobModel;
  DashBoardModel? dashBoardModel;

  getDashBoardInfo() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await dio.get('/users/dashboard');
      dashBoardModel = DashBoardModel.fromJson(response.data);
      userId = dashBoardModel!.data!.sId;
      print(userId);
    } on DioException catch (e) {
      print(e);
    }
  }

  getJob() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await dio.get('/job');
      jobModel = JobModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
